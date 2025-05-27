package kr.co.sist.place;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.board.BoardDTO;
import kr.co.sist.board.RangeDTO;
import kr.co.sist.dao.DBConnection;

public class PlaceDAO {

	private static PlaceDAO instance;

	private PlaceDAO() {
	}// PlaceDAO

	public static PlaceDAO getInstance() {
		if (instance == null) {
			instance = new PlaceDAO();
		}
		return instance;
	}// getInstance

	public void insertRestaurant(RestDTO rDTO) throws SQLException {
		DBConnection dbCon = DBConnection.getInstance();

		PreparedStatement pstmt = null;
		Connection con = null;

		try {
			// 1. JNDI 사용객체 생성
			// 2. DBCP에서 연결객체 얻기 (DataSource)
			// 3. Connection 얻기
			con = dbCon.getDbConn();

			// 4. 쿼리문 생성 객체 얻기
			StringBuilder insertRest = new StringBuilder();
			insertRest.append("	INSERT INTO RESTAURANT(REST_NUM, RESTAURANT, MENU, PRICE, INFO, LAT, LNG, IP, ID)	")
					.append("	VALUES(SEQ_REST.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?)");

			pstmt = con.prepareStatement(insertRest.toString());

			// 5. 바인드 변수에 값 할당
			pstmt.setString(1, rDTO.getRestaurant());
			pstmt.setString(2, rDTO.getMenu());
			pstmt.setInt(3, rDTO.getPrice());
			pstmt.setString(4, rDTO.getInfo());
			pstmt.setDouble(5, rDTO.getLat());
			pstmt.setDouble(6, rDTO.getLng());
			pstmt.setString(7, rDTO.getIp());
			pstmt.setString(8, rDTO.getId());

			// 6. 쿼리문 수행 후 결과 얻기
			pstmt.executeQuery();

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, null);
		} // end try-finally
	}// insertRestaurant

	public int selectTotalCount(RangeDTO rDTO) throws SQLException {
		int cnt = 0;

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection con = null;

		DBConnection dbCon = DBConnection.getInstance();

		try {
			// 1. JNDI 사용객체 생성
			// 2. DBCP에서 연결객체 얻기 (DataSource)
			// 3. Connection 얻기
			con = dbCon.getDbConn();

			// 4. 쿼리문 생성 객체 얻기
			StringBuilder selectCount = new StringBuilder();
			selectCount.append("SELECT COUNT(*) cnt FROM RESTAURANT	");

			if (rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				selectCount.append("	WHERE	INSTR(").append(rDTO.getFieldName(1)).append(",?) != 0");
			} // end if

			pstmt = con.prepareStatement(selectCount.toString());

			if (rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				pstmt.setString(1, rDTO.getKeyword());
			} // end if

			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
			} // end if

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, rs);
		} // end try-finally

		return cnt;
	}// selectTotalCount

	public List<RestDTO> selectRestaurant(RangeDTO rDTO) throws SQLException {
		List<RestDTO> list = new ArrayList<RestDTO>();

		DBConnection dbCon = DBConnection.getInstance();

		PreparedStatement pstmt = null;
		Connection con = null;
		ResultSet rs = null;

		try {
			// 1. JNDI 사용객체 생성
			// 2. DBCP에서 연결객체 얻기 (DataSource)
			// 3. Connection 얻기
			con = dbCon.getDbConn();

			// 4. 쿼리문 생성 객체 얻기
			StringBuilder sb = new StringBuilder();
			sb.append("	SELECT * FROM (").append(
					"	SELECT REST_NUM, RESTAURANT, MENU, INPUT_DATE, ID, ROW_NUMBER() OVER (ORDER BY INPUT_DATE DESC) RNUM	")
					.append("	FROM RESTAURANT	");

			if (rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				sb.append("	WHERE	INSTR(").append(rDTO.getFieldName(1)).append(",?) != 0");
			} // end if

			sb.append(")	WHERE RNUM BETWEEN ? AND ?");

			pstmt = con.prepareStatement(sb.toString());

			// 5. 바인드 변수 할당
			int bindIndex = 1;

			if (rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				pstmt.setString(bindIndex++, rDTO.getKeyword());
			} // end if

			pstmt.setInt(bindIndex++, rDTO.getStartNum());
			pstmt.setInt(bindIndex++, rDTO.getEndNum());

			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				RestDTO restDTO = new RestDTO();
				restDTO.setRest_num(rs.getInt("REST_NUM"));
				restDTO.setRestaurant(rs.getString("RESTAURANT"));
				restDTO.setMenu(rs.getString("MENU"));
				restDTO.setInput_date(rs.getDate("INPUT_DATE"));
				restDTO.setId(rs.getString("ID"));
				list.add(restDTO);
			} // end while

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, rs);
		} // end try-finally

		return list;
	}

	public RestDTO selectOneBoard(int num) throws SQLException {
		RestDTO restDTO = null;

		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection con = null;

		DBConnection dbCon = DBConnection.getInstance();

		try {
			// 1. JNDI 사용객체 생성
			// 2. DBCP에서 연결객체 얻기 (DataSource)
			// 3. Connection 얻기
			con = dbCon.getDbConn();

			// 4. 쿼리문 생성 객체 얻기
			String selectIDQuery = "SELECT * FROM RESTAURANT WHERE REST_NUM = ?";

			pstmt = con.prepareStatement(selectIDQuery);

			pstmt.setInt(1, num);

			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				restDTO = new RestDTO();
				restDTO.setRestaurant(rs.getString("RESTAURANT"));
				restDTO.setMenu(rs.getString("MENU"));
				restDTO.setPrice(rs.getInt("PRICE"));
				restDTO.setInfo(rs.getString("INFO"));
				restDTO.setId(rs.getString("ID"));
				restDTO.setIp(rs.getString("IP"));
				restDTO.setLat(rs.getDouble("LAT"));
				restDTO.setLng(rs.getDouble("LNG"));
				restDTO.setInput_date(rs.getDate("INPUT_DATE"));

			} // end if

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, rs);
		} // end try-finally

		return restDTO;
	}// selectOneBoard

}// class
