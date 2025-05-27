package kr.co.sist.board;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DBConnection;
import kr.co.sist.member.MemberDTO;
import oracle.sql.CLOB;

public class BoardDAO {
	private static BoardDAO instance;

	private BoardDAO() {
	}

	public static BoardDAO getInstance() {
		if (instance == null) {
			instance = new BoardDAO();
		}

		return instance;
	}

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
			StringBuilder selectIDQuery = new StringBuilder();
			selectIDQuery.append("SELECT COUNT(*) cnt FROM BOARD	");
			
			if (rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				selectIDQuery.append("	WHERE	INSTR(").append(rDTO.getFieldName(0))
				.append(",?) != 0");
			}// end if
			
			pstmt = con.prepareStatement(selectIDQuery.toString());

			if (rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				pstmt.setString(1, rDTO.getKeyword());
			}// end if
			
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

	/**
	 * 시작번호와 끝번호 사이에 있는 레코드를 얻는다.
	 * 
	 * @return
	 * @throws SQLException
	 */
	public List<BoardDTO> selectBoard(RangeDTO rDTO) throws SQLException {
		List<BoardDTO> list = new ArrayList<BoardDTO>();

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
					"	SELECT NUM, SUBJECT, ID, INPUT_DATE, CNT, ROW_NUMBER() OVER (ORDER BY INPUT_DATE DESC) RNUM	")
					.append("	FROM BOARD	");

			if (rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				sb.append("	WHERE	INSTR(").append(rDTO.getFieldName(0))
				.append(",?) != 0");
			}// end if
			
			sb.append(")	WHERE RNUM BETWEEN ? AND ?");
			
			pstmt = con.prepareStatement(sb.toString());

			// 5. 바인드 변수 할당
			int bindIndex = 1;
			
			if (rDTO.getKeyword() != null && !"".equals(rDTO.getKeyword())) {
				pstmt.setString(bindIndex++, rDTO.getKeyword());
			}// end if
			
			pstmt.setInt(bindIndex++, rDTO.getStartNum());
			pstmt.setInt(bindIndex++, rDTO.getEndNum());
			
			

			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO bDTO = new BoardDTO();
				bDTO.setNum(rs.getInt("NUM"));
				bDTO.setSubject(rs.getString("SUBJECT"));
				bDTO.setId(rs.getString("ID"));
				bDTO.setInputDate(rs.getDate("INPUT_DATE"));
				bDTO.setCnt(rs.getInt("CNT"));
				list.add(bDTO);
			} // end while

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, rs);
		} // end try-finally

		return list;
	}

	public void insertBoard(BoardDTO bDTO) throws SQLException {
		DBConnection dbCon = DBConnection.getInstance();

		PreparedStatement pstmt = null;
		Connection con = null;

		try {
			// 1. JNDI 사용객체 생성
			// 2. DBCP에서 연결객체 얻기 (DataSource)
			// 3. Connection 얻기
			con = dbCon.getDbConn();

			// 4. 쿼리문 생성 객체 얻기
			StringBuilder insertBoard = new StringBuilder();
			insertBoard.append("	INSERT INTO BOARD(NUM, SUBJECT, CONTENT, ID, IP)	")
					.append("	VALUES(SEQ_BOARD.NEXTVAL, ?, ?, ?, ?)");

			pstmt = con.prepareStatement(insertBoard.toString());

			// 5. 바인드 변수에 값 할당
			pstmt.setString(1, bDTO.getSubject());
			pstmt.setString(2, bDTO.getContent());
			pstmt.setString(3, bDTO.getId());
			pstmt.setString(4, bDTO.getIp());

			// 6. 쿼리문 수행 후 결과 얻기
			pstmt.executeQuery();

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, null);
		} // end try-finally
	}// insertBoard

	public BoardDTO selectOneBoard(int num) throws SQLException {
		BoardDTO bDTO = null;

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
			String selectIDQuery = "SELECT * FROM BOARD WHERE NUM = ?";

			pstmt = con.prepareStatement(selectIDQuery);

			pstmt.setInt(1, num);

			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();

			if (rs.next()) {
				bDTO = new BoardDTO();
				bDTO.setNum(num);
				bDTO.setSubject(rs.getString("SUBJECT"));
				bDTO.setId(rs.getString("ID"));
				bDTO.setIp(rs.getString("IP"));
				bDTO.setInputDate(rs.getDate("INPUT_DATE"));
				bDTO.setCnt(rs.getInt("CNT"));

				// bDTO.setContent(rs.getString("CONTENT"));
				// CLOB은 아주 긴 문자열을 저장하므로 별도의 Stream을 연결하여 값을 읽어들입니다.
				StringBuilder tempContent = new StringBuilder();
				String lineData = "";

				Clob clob = rs.getClob("content");
				
				if (clob != null) {
					try (BufferedReader br = new BufferedReader(clob.getCharacterStream())) {
						while ((lineData = br.readLine()) != null) {
							tempContent.append(lineData).append("\n");
						}
					} catch (IOException e) {
						e.printStackTrace();
						tempContent.append("글 내용 읽기 실패");
					} // end try-with-resources
				}// end if

				bDTO.setContent(tempContent.toString());

			}// end if

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, rs);
		} // end try-finally

		return bDTO;
	}

	/**
	 * 조회수 올리기
	 * 
	 * @param num
	 * @return
	 * @throws SQLException
	 */
	public int updateCnt(int num) throws SQLException {
		int rowCnt = 0;

		DBConnection dbCon = DBConnection.getInstance();

		PreparedStatement pstmt = null;
		Connection con = null;

		try {
			// 1. JNDI 사용객체 생성
			// 2. DBCP에서 연결객체 얻기 (DataSource)
			// 3. Connection 얻기
			con = dbCon.getDbConn();

			// 4. 쿼리문 생성 객체 얻기
			StringBuilder updateCnt = new StringBuilder();
			updateCnt.append("	UPDATE BOARD SET CNT = CNT+1	").append("	WHERE NUM = ?");

			pstmt = con.prepareStatement(updateCnt.toString());

			// 5. 바인드 변수에 값 할당
			pstmt.setInt(1, num);

			// 6. 쿼리문 수행 후 결과 얻기
			rowCnt = pstmt.executeUpdate();

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, null);
		} // end try-finally

		return rowCnt;
	}// updateCnt

	public int deleteBoard(BoardDTO bDTO) throws SQLException {
		int rowCnt = 0;
		
		DBConnection dbCon = DBConnection.getInstance();

		PreparedStatement pstmt = null;
		Connection con = null;

		try {
			// 1. JNDI 사용객체 생성
			// 2. DBCP에서 연결객체 얻기 (DataSource)
			// 3. Connection 얻기
			con = dbCon.getDbConn();

			// 4. 쿼리문 생성 객체 얻기
			StringBuilder deleteBoard = new StringBuilder();
			deleteBoard
			.append("	DELETE FROM BOARD	")
			.append("	WHERE NUM = ? AND ID = ?	");

			pstmt = con.prepareStatement(deleteBoard.toString());

			// 5. 바인드 변수에 값 할당
			pstmt.setInt(1, bDTO.getNum());
			pstmt.setString(2, bDTO.getId());

			// 6. 쿼리문 수행 후 결과 얻기
			rowCnt = pstmt.executeUpdate();
			
		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, null);
		} // end try-finally
		
		return rowCnt;
	}
	
	public int updateBoard(BoardDTO bDTO) throws SQLException {
		int rowCnt = 0;
		
		DBConnection dbCon = DBConnection.getInstance();

		PreparedStatement pstmt = null;
		Connection con = null;

		try {
			// 1. JNDI 사용객체 생성
			// 2. DBCP에서 연결객체 얻기 (DataSource)
			// 3. Connection 얻기
			con = dbCon.getDbConn();

			// 4. 쿼리문 생성 객체 얻기
			StringBuilder updateBoard = new StringBuilder();
			updateBoard
			.append("	UPDATE BOARD SET	CONTENT = ?	")
			.append("	WHERE NUM = ? AND ID = ?	");

			pstmt = con.prepareStatement(updateBoard.toString());

			// 5. 바인드 변수에 값 할당
			pstmt.setString(1, bDTO.getContent());
			pstmt.setInt(2, bDTO.getNum());
			pstmt.setString(3, bDTO.getId());

			// 6. 쿼리문 수행 후 결과 얻기
			rowCnt = pstmt.executeUpdate();
			
		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, null);
		} // end try-finally
		
		return rowCnt;
	}

}
