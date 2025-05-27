package kr.co.sist.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.spi.DirStateFactory.Result;

import lombok.Getter;

public class SitePropertyVO {

	private static SitePropertyVO instance;

	@Getter
	private String site_name, site_version, site_info, protocol, server_name, server_port, servlet_path, logo_img,
			upload_path;

	private SitePropertyVO() {
		try {
			setConfig();
		} catch (SQLException e) {
			e.printStackTrace();
		} // end try-catch
	}// SitePropertyVO

	public static SitePropertyVO getInstance() {
		if (instance == null) {
			instance = new SitePropertyVO();
		} // end if
		return instance;
	}// getInstance

	private void setConfig() throws SQLException {

		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String user = "scott";
		String pass = "tiger";

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			con = DriverManager.getConnection(url, user, pass);
			stmt = con.createStatement();

			String configSql = "SELECT * FROM SITE_PROPERTY";

			rs = stmt.executeQuery(configSql);

			if (rs.next()) {
				site_name = rs.getString("SITE_NAME");
				site_version = rs.getString("SITE_VERSION");
				site_info = rs.getString("SITE_INFO");
				protocol = rs.getString("PROTOCOL");
				server_name = rs.getString("server_name");
				server_port = rs.getString("server_port");
				servlet_path = rs.getString("servlet_path");
				logo_img = rs.getString("logo_img");
				upload_path = rs.getString("upload_path");
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (stmt != null) {
				stmt.close();
			}
			if (con != null) {
				con.close();
			}
		}
	}// setConfig

}// class
