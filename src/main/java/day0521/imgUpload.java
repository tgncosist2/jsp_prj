package day0521;

import java.io.File;

import com.oreilly.servlet.MultipartRequest;

public class imgUpload {

	private imgUpload() {
	}

	public static void uploadImg() {
		File saveDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
					
		// 2. 업로드 크기를 설정합니다. : 10Mbyte
		int maxSize = 10 * 1024 * 1024;
					
		if (!saveDir.exists()) {
			saveDir.mkdir();
		}// end if
					
	}

}
