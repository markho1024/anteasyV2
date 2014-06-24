package com.app.college.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.college.dao.MajorDAO;
import com.app.college.service.MajorService;

@Service("majorService")
public class MajorServiceImpl extends BaseServiceImpl implements MajorService {
	@Autowired
	public void setDao(MajorDAO dao) {
		super.setDao(dao);
	}
}
