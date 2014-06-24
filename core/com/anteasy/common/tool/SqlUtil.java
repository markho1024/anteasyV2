package com.anteasy.common.tool;

import java.sql.Date;

public class SqlUtil {

	/* 得到两个日期之间 的sql语句 */
	public static String betweenDate(String tbname, Date startDate, Date endDate) {
		if (null != endDate && null != startDate) {
			String str = tbname + " >= '" + startDate + "' and " + tbname
					+ " <= '" + endDate + "'";
			return str;
		}
		return null;
	}
	
	/* 得到两个数字之间 的sql语句 */
	public static String betweenInt(String tbname, Integer low, Integer high) {
		if (null != low && null != high) {
			String str = tbname + " >= " + low + " and " + tbname
					+ " <= " + high;
			return str;
		}
		return null;
	}
	public static String betweenInt(String tbname, Float low, Float high) {
		if (null != low && null != high) {
			String str = tbname + " >= " + low + " and " + tbname
					+ " <= " + high;
			return str;
		}
		return null;
	}
}
