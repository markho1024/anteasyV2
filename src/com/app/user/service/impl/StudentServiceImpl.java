package com.app.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.user.dao.StudentDAO;
import com.app.user.service.StudentService;

@Service("studentService")
public class StudentServiceImpl extends BaseServiceImpl implements
		StudentService {
	@Autowired
	public void setDao(StudentDAO dao) {
		super.setDao(dao);
	}
}
