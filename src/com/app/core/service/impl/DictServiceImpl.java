package com.app.core.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.core.dao.DictDAO;
import com.app.core.service.DictService;
import com.orm.pojo.Dict;

@Service("dictService")
public class DictServiceImpl extends BaseServiceImpl implements DictService{

	@Autowired
	public void setDao(DictDAO dao) {
		super.setDao(dao);
	}
	
	@SuppressWarnings("unchecked")
	public List<Dict> findType(String type) {
		String sql = "from Dict where dictType = '" + type
				+ "' and status != '9' ";
	    return (List<Dict>) this.dao.find(sql);
	}
	@SuppressWarnings("unchecked")
	public List<Dict> findTypeLimit(String type) {
		String sql = "from Dict where dictType = '" + type
				+ "' and status = '1' ";
		return (List<Dict>) this.dao.find(sql);
	}
	@SuppressWarnings("unchecked")
	public List<Dict> findTypeAll(String type) {
		String sql = "from Dict where dictType = '" + type
				+ "'";
		return (List<Dict>) this.dao.find(sql);
	}
	
}
