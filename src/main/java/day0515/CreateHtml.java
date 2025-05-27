package day0515;

import java.io.FileWriter;
import java.io.IOException;

public class CreateHtml {
	public static void main(String[] args) {
		String msg = "내 이름은 <strong>주현석</strong> 입니다. <br> \r\n"
				+ "<img src='../common/images/img_5.jpg'/>";
		
		try {
			FileWriter fw = new FileWriter("C:/dev/workspace/jsp_prj/src/main/webapp/day0515/ajax.html");
			
			fw.write(msg);
			fw.flush();
			
			if(fw != null) {
				fw.close();
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
