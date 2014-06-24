package com.app.college.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.college.dao.ClazzDAO;
import com.app.college.service.ClazzService;

@Service("clazzService")
public class ClazzServiceImpl extends BaseServiceImpl implements ClazzService{

	@Autowired
	public void setDao(ClazzDAO dao) {
		super.setDao(dao);
	}
}
