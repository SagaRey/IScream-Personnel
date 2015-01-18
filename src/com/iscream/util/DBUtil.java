package com.iscream.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBUtil {

	private static DataSource ds;

	static {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context)

			initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup

			("jdbc/PersonnelDB");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 用来获取数据库连接对象,仅限于测试
	 * 
	 * @return 数据库连接对象
	 */
	public static Connection getConn() {

		try {
			return ds.getConnection();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public static void close(Connection conn) {
		if (null != conn) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
				System.out.println(e.getMessage());
			}
		}
	}

	/**
	 * 用来关闭数据库连接和Statement对象
	 * 
	 * @param conn
	 *            数据库连接
	 * @param stmt
	 *            Statement对象
	 */
	public static void close(Connection conn, Statement stmt) {
		close(stmt);
		close(conn);
	}

	/**
	 * 用来关闭数据库连接和Statement对象以及结果集
	 * 
	 * @param conn
	 *            数据库连接
	 * @param stmt
	 *            Statement对象
	 * @param rs
	 *            结果集
	 */
	public static void close(Connection conn, Statement

	stmt, ResultSet rs) {
		close(rs);
		close(conn, stmt);
	}

	public static void close(Statement stmt) {
		if (null != stmt) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
				System.out.println(e.getMessage());
			}
		}
	}

	public static void close(ResultSet rs) {
		if (null != rs) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				// e.printStackTrace();
				System.out.println(e.getMessage());
			}
		}
	}
}
