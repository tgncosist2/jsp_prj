package day0512;

import java.util.ArrayList;
import java.util.List;

public class StudentService {

	public List<String> searchStuNum() {
		List<String> list = new ArrayList<String>();
		
		StudentDAO sDAO = new StudentDAO();
		
		list = sDAO.selectStuNum();
		
		return list;
	}
	
}
