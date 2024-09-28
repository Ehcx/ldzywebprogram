package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 数据库连接工具类
 * @author Administrator
 *
 */

import java.sql.Statement;
public class BaseDao {
	// 加载驱动，并建立数据库连接
	public static Connection getConnection() {
		/**
		 * DriverManager ：依据数据库的不同，管理JDBC驱动
		 * Connection ：负责连接数据库并担任传送数据的任务
		 *  Statement ：由Connection 产生、负责执行SQL语句
		 *   ResultSet：负责保存Statement执行后所产生的查询结果
		 *   加载驱动
		 *   建立连接
		 *   发送sql语句
		 *   处理返回结果
		 *   释放资源
		 */
		Connection conn = null; // 负责连接数据库并担任传送数据的任务
		Statement stmt = null; // 由 Connection 产生、负责执行SQL语句
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			// 建立连接
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/constructiondb?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8&useSSL=false", "root", "123456");
			conn.setAutoCommit(false);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return conn;

	}
	public static void closeAll(ResultSet rs, Statement stmt, Connection conn) {

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}


