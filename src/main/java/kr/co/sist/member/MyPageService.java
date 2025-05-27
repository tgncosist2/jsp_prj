package kr.co.sist.member;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.co.sist.cipher.DataEncryption;
import kr.co.sist.member.login.LoginResultDTO;

public class MyPageService {
	
	public boolean modifyMember(MyPageDTO mpDTO, HttpSession session) {
		boolean flag = false;
		
		MyPageDAO mpDAO = MyPageDAO.getInstance();
		
		try {
			String myKey = "asdf1234asdf1234";
			DataEncryption de = new DataEncryption(myKey);
			
			mpDTO.setId(((LoginResultDTO)session.getAttribute("userData")).getId());
			
			if (mpDTO.getImgName().isEmpty()) {
				mpDTO.setImgName("default.jpg");
			}// end if
			
			try {
				mpDTO.setTel(de.encrypt(mpDTO.getTel()));
			} catch (Exception e) {
				e.printStackTrace();
			}// end try-catch
			
			mpDAO.updateMember(mpDTO);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}// end try-catch
		
		return flag;
	}// modifyMember
	
}// class
