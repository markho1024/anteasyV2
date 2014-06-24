package com.app.course.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.course.dao.PlanDAO;
import com.app.course.service.PlanService;

@Service("planService")
public class PlanServiceImpl extends BaseServiceImpl implements PlanService {
	@Autowired
	public void setDao(PlanDAO dao) {
		super.setDao(dao);
	}
}
