package com.app.choice.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.choice.dao.ChoiceDAO;
import com.app.choice.service.ChoiceService;

@Service("choiceService")
public class ChoiceServiceImpl extends BaseServiceImpl implements ChoiceService{
    @Autowired
	public void setDao(ChoiceDAO dao) {
		super.setDao(dao);
	}
}
