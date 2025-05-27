package day0512;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Singleton {

	private static Singleton instance;
	private static DataSource ds;
	private static Connection conn;
	
	private Singleton() {
	}

	public static Singleton getInstance() {
		if (instance == null) {
			instance = new Singleton();
			try {
				Context ctx = new InitialContext();
				ds = (DataSource) ctx.lookup("java:comp/env/jdbc/dbcp");
			} catch (NamingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return instance;
	}

	public static Connection getConn() {
		try {
			if (conn == null) {
				conn = ds.getConnection();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	public static void getClose(Connection conn, PreparedStatement pstmt, ResultSet rs) {
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
}
