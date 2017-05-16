package com.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 字符串工具类
 * 
 * @author Administrator
 *
 */
public class StringUtil {
	/**
	 * 
	 * 判断字符串是否为空
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isBlank(String str) {
		if (str == null || "".equals(str)) {
			return true;
		}
		return false;
	}

	/**
	 * 
	 * 分页前端代码生成 工具
	 * 
	 * @param url
	 * @param totalNums
	 * @param pageSize
	 * @param page
	 * @return
	 */
	public static String getPageCode(String url, Integer totalNums, int pageSize, int page) {
		if (totalNums == null || totalNums < 0) {
			return null;
		}
		StringBuilder pageCode = new StringBuilder();
		int totalPages = totalNums % pageSize > 0 ? totalNums / pageSize + 1 : totalNums / pageSize;
		pageCode.append("<a type=\"button\"  href=\"/" + url + "?page=" + 1 + "\">首页</a>");
		if (page > 1) {
			pageCode.append("<a type=\"button\"  href=\"/" + url + "?page=" + (page - 1)
					+ "\">上一页</a>");
		}
		if (page > 0 && page <= totalPages) {
			pageCode.append("<a type=\"button\"  href=\"/" + url + "?page=" + page + "\">"
					+ page + "</a>");
		}
		if ((page + 1) <= totalPages) {
			pageCode.append("<a type=\"button\"  href=\"/" + url + "?page=" + (page + 1)
					+ "\">下一页</a>");
		}
		pageCode.append(
				"<a type=\"button\"  href=\"/" + url + "?page=" + totalPages + "\">尾页</a>");
		return pageCode.toString();
	}
	
	public static boolean checkPhoneNum(String phone) {
		Pattern p = Pattern.compile("^((17[0-9])|(13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
		Matcher m = p.matcher(phone);
		return m.matches();
	}
}
