package kr.co.sist.board;

public class BoardUtil {
	
	private BoardUtil() {
	}

	/**
	 * 쪽번호 [ &lt;&lt; ] ... [1][2][3] ... [ &gt;&gt; ]를 생성하는 method<br>
	 * <br>
	 * pageNumber - 생성한 인덱스 수 [1][2][3],<br>
	 * currentPage - 사용자가 보고있는 현재페이지,<br>
	 * totalPage - 게시글의 총 페이지 수,<br>
	 * url - 이동할 URL, <br>
	 * field - 검색 필드 (제목, 내용, 작성자), <br>
	 * keyword - 검색 키워드<br>
	 * <br>
	 * 를 pDTO로 입력 받아서 쪽 번호를 생성하는 method 이다.
	 * @param pDTO pagination Method를 사용하기 위해 필요한 변수들을 담은 DTO
	 * @return prevMark + pageLink + nextMark
	 */
	public static String pagination(PaginationDTO pDTO) {
		StringBuilder queryString = new StringBuilder("");
		
		String field = pDTO.getField();
		String keyword = pDTO.getKeyword();
		String url = pDTO.getUrl();
		int currentPage = pDTO.getCurrentPage();
		int pageNumber = pDTO.getPageNumber();
		int totalPage = pDTO.getTotalPage();

		if(field != null && keyword != null) {
			queryString.append("&field=").append(field).append("&keyword=").append(keyword);
		}
		
		// 1. 페이지 인덱스 넘버
//		int pageNumber = 3; // 한 화면에 보여줄 페이지인덱스 수 [1], [2], [3]
				
		// 2. 화면에 보여줄 시작페이지 번호
		int startPage = ((currentPage - 1) / pageNumber) * pageNumber + 1;
		
		// 3. 화면에 보여줄 마지막 페이지 번호
		int endPage = (((startPage - 1) + pageNumber)/pageNumber) * pageNumber;
		
		// 4. 끝페이지보다 전체페이지가 작다면 끝페이지는 전체페이지.
		endPage = totalPage <= endPage ? totalPage : endPage;
		
		// 5. 첫 페이지가 인덱스 화면 아닌경우.
		int movePage = 0;
		StringBuilder prevMark = new StringBuilder("[ &lt;&lt; ]");
		
		if(currentPage > pageNumber) { // 시작페이지보다 1 적은 페이지로 이동
			prevMark.delete(0, prevMark.length());
			movePage = startPage - 1;
			prevMark.append("[ <a href='").append(url).append("?currentPage=")
			.append(movePage).append(queryString.toString()).append("' class='prevMark'> &lt;&lt; </a>]");
		}
		
		prevMark.append(" ... ");
		
		// 6. 시작페이지 번호부터 끝 페이지 번호까지 화면에 출력
		movePage = startPage;
		StringBuilder pageLink = new StringBuilder();
		
		while (movePage <= endPage) {
			if (movePage == currentPage) { // 현재 페이지는 링크를 설정하지 않고 span태그로 색상을 조정한다.
				pageLink.append("[ <span style='color: #0000FF;'>").append(currentPage).append("</span> ]");
			} else {
				pageLink.append("[ <a href='?currentPage=").append(movePage).append(queryString.toString()).append("'>")
				.append(movePage).append("</a> ]");
			}
			movePage++;
		}
		
		pageLink.append(" ... ");
		
		// 7. 뒤에 페이지가 더 있는 경우
		StringBuilder nextMark = new StringBuilder("[ &gt;&gt; ]");
		
		if (totalPage > endPage) {
			movePage = endPage + 1;
			nextMark.delete(0, nextMark.length());
			nextMark.append("...[ <a href='").append(url).append("?currentPage=")
			.append(movePage).append(queryString.toString()).append("' class='nextMark'> &gt;&gt; </a>]");
		}
		
		return prevMark.toString()+pageLink.toString()+nextMark.toString();
	}
}
