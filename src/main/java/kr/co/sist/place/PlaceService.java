package kr.co.sist.place;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.board.BoardDAO;
import kr.co.sist.board.BoardDTO;
import kr.co.sist.board.RangeDTO;

public class PlaceService {

	public RestDTO searchOneRestaurant(int num) {
		RestDTO restDTO = null;

		PlaceDAO pDAO = PlaceDAO.getInstance();
		
		try {
			restDTO = pDAO.selectOneBoard(num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return restDTO;
	}
	
	public List<RestDTO> selectRestaurant(RangeDTO rDTO) {
		List<RestDTO> list = new ArrayList<RestDTO>();
		
		PlaceDAO pDAO = PlaceDAO.getInstance();
		
		try {
			list = pDAO.selectRestaurant(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}// selectBoard
	
	
	/**
	 * 맛집을 추가하는거구요
	 * @param rDTO 레스토랑명 등등
	 * @return
	 */
	public boolean writeRestaurant(RestDTO rDTO) {
		boolean flag = false;
		
		PlaceDAO pDAO = PlaceDAO.getInstance();
		
		try {
			pDAO.insertRestaurant(rDTO);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return flag;
	}// addRestaurant
	
	public int totalCount(RangeDTO rDTO) {
		int cnt = 0;

		PlaceDAO pDAO = PlaceDAO.getInstance();

		try {
			cnt = pDAO.selectTotalCount(rDTO);
		} catch (SQLException e) {
			e.printStackTrace();
		} // end try-catch

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
