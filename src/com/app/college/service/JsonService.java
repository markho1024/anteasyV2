package com.app.college.service;

import java.util.List;

public interface JsonService {
	public List<?> findType(String type);
	public List<?> findTyping(String type);
	public List<?> findType(String type, String typeSon, String typeSonV,
			int status);
	public List<?> findByType(String sql);
	public boolean isExist(String type,String idValue);
	public Long findNext(String type, String typeSon, String typeSonV,String dateName,String date,String kind,String kindV) ;

	public Long findOrder(String courseID);
	
	public boolean orderExist(String typeV,String typeSonV);
	
	public boolean isPw(String pw);

}
