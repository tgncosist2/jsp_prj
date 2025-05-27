package day0515;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.sist.dao.DBConnection;

public class DeptDAO {

	private static DeptDAO dDAO;
	
	private DeptDAO() {
		
	}
	
	public static DeptDAO getInstance() {
		if (dDAO == null) {
			dDAO = new DeptDAO();
		}
		
		return dDAO;
	}
	
	public List<Dept> selectAllDept() throws SQLException {
		List<Dept> list = new ArrayList<Dept>();
		
		DBConnection dbCon = DBConnection.getInstance();
		
		// 1. JNDI 사용 객체 생성
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dbCon.getDbConn();
			
			String selectSql = "SELECT * FROM DEPT";
			pstmt = con.prepareStatement(selectSql);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Dept deptDTO = new Dept(rs.getInt("DEPTNO"), rs.getString("DNAME"), rs.getString("LOC"));
				
				list.add(deptDTO);
			}
			
		} finally {
			dbCon.dbClose(con, pstmt, rs);
		}
		
		
		// 2. DBCP
		
		return list;
	}
	
}
