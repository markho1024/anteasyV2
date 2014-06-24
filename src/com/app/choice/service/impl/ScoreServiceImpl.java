package com.app.choice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.choice.dao.ScoreDAO;
import com.app.choice.service.ScoreService;

@Service("scoreService")
public class ScoreServiceImpl extends BaseServiceImpl implements ScoreService{
    @Autowired	
	public void setDao(ScoreDAO dao) {
		super.setDao(dao);
	}
}
