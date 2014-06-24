package com.app.course.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.course.dao.OpenDAO;
import com.app.course.service.OpenService;
import com.orm.pojo.Open;

@Service("openService")
public class OpenServiceImpl extends BaseServiceImpl implements OpenService {
	@Autowired
	public void setDao(OpenDAO dao) {
		super.setDao(dao);
	}

	@Override
	public void countAdd(Open open) {
		Open openOne = (Open) this.dao.load(new Open(), open.getOpenID());
		Long countNow = openOne.getCountNow();
		Long countLimit = openOne.getCountLimit();
		if (countNow < countLimit + 1) {
			openOne.setCountNow(countNow + 1);
			this.dao.update(openOne);
		}
	}

	@Override
	public void countSub(Open open) {
		Open openOne = (Open) this.dao.load(new Open(), open.getOpenID());
		Long countNow = openOne.getCountNow();
		if (countNow > 0) {
			openOne.setCountNow(countNow - 1);
			this.dao.update(openOne);
		}
	}

}
