package com.app.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.user.dao.TeacherDAO;
import com.app.user.service.TeacherService;

@Service("teacherService")
public class TeacherServiceImpl extends BaseServiceImpl implements
		TeacherService {

	@Autowired
	public void setDao(TeacherDAO dao) {
		super.setDao(dao);
	}
}
