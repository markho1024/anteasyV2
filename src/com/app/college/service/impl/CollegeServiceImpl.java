package com.app.college.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.college.dao.CollegeDAO;
import com.app.college.service.CollegeService;

@Service("collegeService")
public class CollegeServiceImpl extends BaseServiceImpl implements
		CollegeService {
	@Autowired
	public void setDao(CollegeDAO dao) {
		super.setDao(dao);
	}
}
