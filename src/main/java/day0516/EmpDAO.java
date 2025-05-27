package day0516;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DBConnection;

public class EmpDAO {

	private static EmpDAO dDAO;
	
	private EmpDAO() {
		
	}
	
	public static EmpDAO getInstance() {
		if (dDAO == null) {
			dDAO = new EmpDAO();
		}
		
		return dDAO;
	}
	
	public List<EmpDTO> selectEmp(int deptno) throws SQLException {
		List<EmpDTO> list = new ArrayList<EmpDTO>();
		
		DBConnection dbCon = DBConnection.getInstance();
		
		// 1. JNDI 사용 객체 생성
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dbCon.getDbConn();
			
			String selectSql = "SELECT * FROM EMP WHERE DEPTNO = ?";
			pstmt = con.prepareStatement(selectSql);
			pstmt.setInt(1, deptno);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				EmpDTO empDTO = new EmpDTO();
				empDTO.setEmpno(rs.getInt("EMPNO"));
				empDTO.setEname(rs.getString("ENAME"));
				empDTO.setJob(rs.getString("JOB"));
				empDTO.setMgr(rs.getInt("MGR"));
				empDTO.setHiredate(rs.getDate("HIREDATE"));
				empDTO.setSal(rs.getInt("SAL"));
				empDTO.setComm(rs.getInt("COMM"));
				empDTO.setDeptno(rs.getInt("DEPTNO"));
				list.add(empDTO);
			}
			
		} finally {
			dbCon.dbClose(con, pstmt, rs);
		}
		
		
		// 2. DBCP
		
		return list;
	}
	
}
