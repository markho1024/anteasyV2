package com.app.expand.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.expand.dao.MessageDAO;
import com.app.expand.service.MessageService;

@Service("messageService")
public class MessageServiceImpl extends BaseServiceImpl implements
		MessageService {

	@Autowired
	public void setDao(MessageDAO dao) {
		super.setDao(dao);
	}
}
