package day0516;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class EmpDTO {
	private int empno, mgr, sal, comm, deptno;
	private String ename, job;
	private Date hiredate;
}
