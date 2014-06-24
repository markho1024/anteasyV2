package com.app.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.user.dao.UserDAO;
import com.app.user.service.UserService;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl implements UserService {

	@Autowired
	public void setDao(UserDAO dao) {
		super.setDao(dao);
	}
}
