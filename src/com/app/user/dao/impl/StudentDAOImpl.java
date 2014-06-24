package com.app.user.dao.impl;

import org.springframework.stereotype.Repository;

import com.anteasy.hibernate3.BaseDaoImpl;
import com.app.user.dao.StudentDAO;

@Repository("studentDAO")
public class StudentDAOImpl extends BaseDaoImpl implements StudentDAO{

}
