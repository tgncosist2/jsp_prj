package kr.co.sist.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DBConnection;

public class MemberDAO {

	private static MemberDAO mDAO;

	private MemberDAO() {
	}// MemberDAO

	public static MemberDAO getInstance() {
		if (mDAO == null) {
			mDAO = new MemberDAO();
		} // end if
		return mDAO;
	}// getInstance

	/**
	 * 입력받은 아이디를 검색하는 일
	 * 
	 * @param id 검색할 아이디
	 * @return 검색된 아이디
	 * @throws SQLException
	 */
	public boolean selectID(String ID) throws SQLException {
		boolean flag = false;

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
			String selectIDQuery = "SELECT ID FROM WEB_MEMBER WHERE ID = ?";

			pstmt = con.prepareStatement(selectIDQuery);

			// 5. 바인드 변수에 값 할당
			pstmt.setString(1, ID);

			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			flag = rs.next(); // 검색 결과가 있으면 true, 없으면 false

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, rs);
		} // end try-finally

		return flag;
	}// selectID

	public void insertMember(MemberDTO mDTO) throws SQLException {

		DBConnection dbCon = DBConnection.getInstance();

		PreparedStatement pstmt = null;
		Connection con = null;

		try {
			// 1. JNDI 사용객체 생성
			// 2. DBCP에서 연결객체 얻기 (DataSource)
			// 3. Connection 얻기
			con = dbCon.getDbConn();

			// 4. 쿼리문 생성 객체 얻기
			StringBuilder insertWebMember = new StringBuilder();
			insertWebMember.append("	INSERT INTO WEB_MEMBER	")
					.append("	(ID, PASS, NAME, BIRTH, TEL, EMAIL, GENDER, ZIPCODE, ADDR, ADDR2, INTRO, IP)	")
					.append("	VALUES(?,?,?,?,?,?,?,?,?,?,?,?)	");

			pstmt = con.prepareStatement(insertWebMember.toString());

			// 5. 바인드 변수에 값 할당
			pstmt.setString(1, mDTO.getId());
			pstmt.setString(2, mDTO.getPass());
			pstmt.setString(3, mDTO.getName());
			pstmt.setString(4, mDTO.getBirth());
			pstmt.setString(5, mDTO.getTel());
			pstmt.setString(6, mDTO.getUseEmail());
			pstmt.setString(7, mDTO.getGender());
			pstmt.setString(8, mDTO.getZipcode());
			pstmt.setString(9, mDTO.getAddr());
			pstmt.setString(10, mDTO.getAddr2());
			pstmt.setString(11, mDTO.getIntro());
			pstmt.setString(12, mDTO.getIp());

			// 6. 쿼리문 수행 후 결과 얻기
			pstmt.executeQuery();

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, null);
		} // end try-finally
	}// insertMember

	public List<MemberDTO> selectAllMember() throws SQLException {
		List<MemberDTO> list = new ArrayList<MemberDTO>();

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
			String selectquery = "SELECT * FROM WEB_MEMBER";

			pstmt = con.prepareStatement(selectquery);

			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberDTO mDTO = new MemberDTO();
				mDTO.setId(rs.getString("ID"));
				mDTO.setName(rs.getString("NAME"));
				mDTO.setBirth(rs.getString("BIRTH"));
				mDTO.setTel(rs.getString("TEL"));
				mDTO.setUseEmail(rs.getString("EMAIL"));
				mDTO.setGender(rs.getString("GENDER"));
				mDTO.setInput_date(rs.getDate("INPUT_DATE"));
				list.add(mDTO);
			}

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, rs);
		} // end try-finally

		return list;
	}
	
	public MemberDTO selectOneMember(String id) throws SQLException {
		MemberDTO mDTO = null;

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
			String selectquery = "SELECT NAME, BIRTH, TEL, GENDER, INPUT_DATE, IP, PROFILE_IMG FROM WEB_MEMBER WHERE ID = ?";

			pstmt = con.prepareStatement(selectquery);
			
			pstmt.setString(1, id);

			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				mDTO = new MemberDTO();
				mDTO.setName(rs.getString("NAME"));
				mDTO.setBirth(rs.getString("BIRTH"));
				mDTO.setTel(rs.getString("TEL"));
				mDTO.setIp(rs.getString("IP"));
				mDTO.setGender(rs.getString("GENDER"));
				mDTO.setInput_date(rs.getDate("INPUT_DATE"));
				mDTO.setProfile_img(rs.getString("PROFILE_IMG"));
			}// end if

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, rs);
		} // end try-finally

		return mDTO;
	}
	
	

}// class
