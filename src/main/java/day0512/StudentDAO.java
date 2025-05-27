package day0512;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class StudentDAO {

	public List<String> selectStuNum() {
		List<String> list = new ArrayList<String>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource) envCtx.lookup("jdbc/dbcp");
			conn = ds.getConnection();

			pstmt = conn.prepareStatement("SELECT * FROM STUDENT");
			rs = pstmt.executeQuery();

			while (rs.next()) {
				list.add(rs.getString("STU_NUM"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}

				if (pstmt != null) {
					pstmt.close();
				}

				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return list;
	}

}
