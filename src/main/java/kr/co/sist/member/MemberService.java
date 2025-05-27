package kr.co.sist.member;

import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.cipher.DataDecryption;
import kr.co.sist.cipher.DataEncryption;
import kr.co.sist.config.SiteProperty;

public class MemberService {

	public boolean searchID(String id) {
		boolean flag = false;

		MemberDAO mDAO = MemberDAO.getInstance();

		try {
			flag = mDAO.selectID(id);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end try-catch

		return flag;
	}// searchID

	public boolean addMember(MemberDTO mDTO) {
		boolean flag = false;

		// mDTO 객체의 값 중 email과 domain을 합쳐서 useEmail에 할당.
		mDTO.setUseEmail(mDTO.getEmail() + "@" + mDTO.getDomain());

		// 정보의 중요도에 따라
		// 일방향 해시 : 비밀번호
		try {
			mDTO.setPass(DataEncryption.messageDigest("SHA-256", mDTO.getPass()));
			// 암호화 결정 :
			String myKey = "asdf1234asdf1234";
			DataEncryption de = new DataEncryption(myKey);

			mDTO.setName(de.encrypt(mDTO.getName()));
			mDTO.setUseEmail(de.encrypt(mDTO.getUseEmail()));
			mDTO.setTel(de.encrypt(mDTO.getTel()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		MemberDAO mDAO = MemberDAO.getInstance();

		try {
			mDAO.insertMember(mDTO);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return flag;
	}

	public List<MemberDTO> searchAllMember(String role) {
		List<MemberDTO> list = null;

		MemberDAO mDAO = MemberDAO.getInstance();

		try {
			list = mDAO.selectAllMember();

			// 관리자B(이름 이메일만 확인가능)

			if ("b".equals(role) || "c".equals(role)) {
				String myKey = "asdf1234asdf1234";
				DataDecryption dd = new DataDecryption(myKey);
				for (MemberDTO mDTO : list) {
					try {
						mDTO.setName(dd.decrypt(mDTO.getName()));
					} catch (Exception e) {
						e.printStackTrace();
					} // end try-catch

					try {
						mDTO.setUseEmail(dd.decrypt(mDTO.getUseEmail()));
					} catch (Exception e) {
						e.printStackTrace();
					} // end try-catch

					if ("c".equals(role)) {
						try {
							mDTO.setTel(dd.decrypt(mDTO.getTel()));
						} catch (Exception e) {
							e.printStackTrace();
						}
					}// end if
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public MemberDTO searchOneMember(String id) {
		MemberDTO mDTO = null;
		
		MemberDAO mDAO = MemberDAO.getInstance();
		
		try {
			mDTO = mDAO.selectOneMember(id);
			
			String myKey = "asdf1234asdf1234";
			DataDecryption dd = new DataDecryption(myKey);
			
			try {
				mDTO.setTel(dd.decrypt(mDTO.getTel()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			try {
				mDTO.setName(dd.decrypt(mDTO.getName()));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mDTO;
	}

}// class
