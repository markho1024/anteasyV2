package com.app.core.service;

import java.util.List;

import com.anteasy.hibernate3.BaseService;
import com.orm.pojo.Dict;

public interface DictService extends BaseService{
	public List<Dict> findType(String type);
	public List<Dict> findTypeAll(String type);
	public List<Dict> findTypeLimit(String type);
}
