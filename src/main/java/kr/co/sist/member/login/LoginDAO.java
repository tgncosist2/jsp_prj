package kr.co.sist.member.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.dao.DBConnection;

public class LoginDAO {

	private static LoginDAO lDAO;

	private LoginDAO() {
	}// LoginDAO

	public static LoginDAO getInstance() {
		if (lDAO == null) {
			lDAO = new LoginDAO();
		}
		
		return lDAO;
	}// getInstance
	
	public LoginResultDTO selectLogin(LoginDTO lDTO) throws SQLException {
		LoginResultDTO lrDTO = null;

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
			String selectLoginQuery = "SELECT NAME, EMAIL FROM WEB_MEMBER WHERE ID = ? AND PASS = ?";

			pstmt = con.prepareStatement(selectLoginQuery);

			// 5. 바인드 변수에 값 할당
			pstmt.setString(1, lDTO.getId());
			pstmt.setString(2, lDTO.getPass());

			// 6. 쿼리문 수행 후 결과 얻기
			rs = pstmt.executeQuery();
				
			if (rs.next()) {
				lrDTO = new LoginResultDTO();
				lrDTO.setId(lDTO.getId()); // parameter로 입력된 아이디 사용
				lrDTO.setName(rs.getString("NAME")); // 암호화된 데이터
				lrDTO.setEmail(rs.getString("EMAIL"));
			}// 검색결과가 있다면 DTO객체에 값을 생성

		} finally {
			// 7. 연결 끊기
			dbCon.dbClose(con, pstmt, rs);
		} // end try-finally

		return lrDTO;
	}// selectID

}// class
