package com.app.course.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.course.dao.CourseDAO;
import com.app.course.service.CourseService;

@Service("courseService")
public class CourseServiceImpl extends BaseServiceImpl implements CourseService {
	@Autowired
	public void setDao(CourseDAO dao) {
		super.setDao(dao);
	}
}
