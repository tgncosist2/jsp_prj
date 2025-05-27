package kr.co.sist.board;

import java.sql.Date;

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
public class BoardDTO {
	private int num, cnt;
	private String subject, content, id, ip;
	private Date inputDate;
}
