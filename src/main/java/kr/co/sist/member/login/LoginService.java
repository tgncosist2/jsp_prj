package kr.co.sist.member.login;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import kr.co.sist.cipher.DataDecryption;
import kr.co.sist.cipher.DataEncryption;

public class LoginService {

	public boolean loginProcess(LoginDTO lDTO, HttpSession session) {
		boolean flag = false;

		LoginDAO lDAO = LoginDAO.getInstance();

		try {
			// 비밀번호를 SHA로 일방향 암호화를 진행해야 한다.
			lDTO.setPass(DataEncryption.messageDigest("SHA-256", lDTO.getPass()));
			
			LoginResultDTO lrDTO = lDAO.selectLogin(lDTO);
			flag = lrDTO != null; // 검색 결과가 있을때 true
			if (flag) { // 로그인 성공
				String myKey = "asdf1234asdf1234";
				
				DataDecryption dd = new DataDecryption(myKey);
				
				lrDTO.setEmail(dd.decrypt(lrDTO.getEmail()));
				
				session.setAttribute("userData", lrDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return flag;
	}

}
