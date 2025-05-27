package kr.co.sist.file;

import java.io.File;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import kr.co.sist.board.RangeDTO;
import kr.co.sist.place.PlaceDAO;

public class FileService {
	
	public List<FileDTO> fileList(RangeDTO rDTO) {
		List<FileDTO> list = new ArrayList<FileDTO>();
		List<FileDTO> result = new ArrayList<FileDTO>();
		
		File uploadDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
		File[] listFiles = uploadDir.listFiles();

		if (listFiles != null) { // 업로드 디렉토리에 파일이 존재하면.
			FileDTO fDTO = null;
			for(File file : listFiles) {
				fDTO = new FileDTO();
				fDTO.setFileName(file.getName());
				fDTO.setLength(file.length());
				fDTO.setLastModified(new Date(file.lastModified()));
				list.add(fDTO);
			}// end for
			
		}// end if
		
		for(int i = rDTO.getStartNum()-1; i < rDTO.getEndNum(); i++ )
			result.add(list.get(i));
		
		return result;
	}// fileList
	
	public int totalCount() {
		int cnt = 0;

		File uploadDir = new File("C:/dev/workspace/jsp_prj/src/main/webapp/upload");
		File[] listFiles = uploadDir.listFiles();

		cnt = listFiles.length;

		return cnt;
	}// totalCount
	
	public int pageScale() {
		int pageScale = 10;

		return pageScale;
	}// pageScale
	
	public int totalPage(int totalCount, int pageScale) {
		int totalPage = 0;

		totalPage = (int) Math.ceil((double) totalCount / pageScale);

		return totalPage;
	}// totalPage
	
	public int startNum(int pageScale, RangeDTO rDTO) {
		int startNum = 0;

		startNum = (rDTO.getCurrentPage() * pageScale) - pageScale + 1;
		rDTO.setStartNum(startNum);

		return startNum;
	}// startNum
	
	public int endNum(int pageScale, RangeDTO rDTO) {
		int endNum = 0;

		endNum = rDTO.getStartNum() + pageScale - 1;
		rDTO.setEndNum(endNum);

		return endNum;
	}// endNum
	
}// class
