package com.app.course.service;

import com.anteasy.hibernate3.BaseService;
import com.orm.pojo.Open;

public interface OpenService extends BaseService{
	public void countAdd(Open open);
	public void countSub(Open open);

}
