package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbUtil {
	/**
	 * 获取一个数据库 连接
	 * 
	 * @return
	 * @throws Exception
	 */
	public static Connection getCon() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");// 加载驱动
		return DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/db_axcw", "root", "root");// 从驱动管理器中获取一个数据库连接
	}

	/**
	 * 测试是否连接成功的代码
	 */
	public static void main(String[] args) throws Exception {
		if (getCon() != null) {
			System.out.println("ok");
		}
	}
}
