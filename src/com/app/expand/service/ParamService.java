package com.app.expand.service;

import com.anteasy.hibernate3.BaseService;
import com.app.util.Params;

public interface ParamService extends BaseService {
	public Params load();
	public void update(Params params);
}
