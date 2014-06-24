package com.anteasy.common.tool;

import java.sql.Date;
import java.util.Calendar;

public class DateUtil {
	public static Date dateNow(){
		Calendar cl = Calendar.getInstance();
		@SuppressWarnings({ "deprecation", })
		Date date = new Date(cl.get(Calendar.YEAR)-1900,cl.get(Calendar.MONTH),cl.get(Calendar.DAY_OF_MONTH));
		return date;
	}
	
	
}
