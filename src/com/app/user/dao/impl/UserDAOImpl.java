package com.app.user.dao.impl;

import org.springframework.stereotype.Repository;

import com.anteasy.hibernate3.BaseDaoImpl;
import com.app.user.dao.UserDAO;

@Repository("userDAO")
public class UserDAOImpl extends BaseDaoImpl implements UserDAO{

}
