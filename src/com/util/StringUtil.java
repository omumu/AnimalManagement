package com.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * �ַ���������
 * 
 * @author Administrator
 *
 */
public class StringUtil {
	/**
	 * 
	 * �ж��ַ����Ƿ�Ϊ��
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
	 * ��ҳǰ�˴������� ����
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
		pageCode.append("<a type=\"button\"  href=\"/" + url + "?page=" + 1 + "\">��ҳ</a>");
		if (page > 1) {
			pageCode.append("<a type=\"button\"  href=\"/" + url + "?page=" + (page - 1)
					+ "\">��һҳ</a>");
		}
		if (page > 0 && page <= totalPages) {
			pageCode.append("<a type=\"button\"  href=\"/" + url + "?page=" + page + "\">"
					+ page + "</a>");
		}
		if ((page + 1) <= totalPages) {
			pageCode.append("<a type=\"button\"  href=\"/" + url + "?page=" + (page + 1)
					+ "\">��һҳ</a>");
		}
		pageCode.append(
				"<a type=\"button\"  href=\"/" + url + "?page=" + totalPages + "\">βҳ</a>");
		return pageCode.toString();
	}
	
	public static boolean checkPhoneNum(String phone) {
		Pattern p = Pattern.compile("^((17[0-9])|(13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
		Matcher m = p.matcher(phone);
		return m.matches();
	}
}
