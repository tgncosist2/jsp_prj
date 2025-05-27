package kr.co.sist.board;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class RangeDTO {

	private String field, keyword;// 검색에 대한 부분.
	private int currentPage = 1, startNum, endNum;// 현재페이지, 시작번호, 끝번호.
	private int startPage, endPage;

	private String[] boardFieldText = { "제목", "내용", "작성자" };
	private String[] restFieldText = { "식당명", "메인 메뉴", "작성자" };

	public String getFieldName(int type) {
		String fieldName = "";
		switch (type) {
		case 0:
			fieldName = "subject";

			switch (field) {
			case "1":
				fieldName = "content";
				break;
			case "2":
				fieldName = "id";
				break;
			}
			break;
		case 1:
			fieldName = "restaurant";

			switch (field) {
			case "1":
				fieldName = "menu";
				break;
			case "2":
				fieldName = "id";
				break;
			}
			break;
		}// end switch

		
		return fieldName;
	}
}
