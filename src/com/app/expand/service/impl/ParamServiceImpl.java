package com.app.expand.service.impl;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.anteasy.common.tool.DateUtil;
import com.anteasy.hibernate3.BaseServiceImpl;
import com.app.expand.dao.ParamDAO;
import com.app.expand.service.ParamService;
import com.app.util.Params;
import com.opensymphony.xwork2.ActionContext;
import com.orm.pojo.Param;

@Service("paramService")
public class ParamServiceImpl extends BaseServiceImpl implements ParamService {

	@Autowired
	public void setDao(ParamDAO dao) {
		// TODO Auto-generated method stub
		super.setDao(dao);
	}

	@SuppressWarnings("unchecked")
	public Params load() {
		String sql = "from Param";
		Map<String, String> map = new HashMap<String, String>();
		Params params = new Params();
		List<Param> find = (List<Param>) this.dao.find(sql);
		for (Param param : find) {
			map.put(param.getParamName(), param.getParamValue());
		}

		params.setPageCount(Integer.parseInt(map.get("pageCount")));

		Date cOne = (Date) getDate(map.get("choiceDate")).get("start");
		Date cTwo = (Date) getDate(map.get("choiceDate")).get("end");
		Date lOne = (Date) getDate(map.get("logDate")).get("start");
		Date lTwo = (Date) getDate(map.get("logDate")).get("end");

		params.setChoiceOne(cOne);
		params.setChoiceTwo(cTwo);
		params.setLogOne(lOne);
		params.setLogTwo(lTwo);
		set(params);
		return params;
	}

	@SuppressWarnings({ "deprecation", "rawtypes" })
	public Map getDate(String dateStr) {
		String[] str = dateStr.split(">");

		String start = str[0];
		String end = str[1];

		String[] strm = start.split("-");
		int sm = Integer.parseInt(strm[0]);
		int sd = Integer.parseInt(strm[1]);

		String[] stre = end.split("-");
		int em = Integer.parseInt(stre[0]);
		int ed = Integer.parseInt(stre[1]);

		Date dateNow = DateUtil.dateNow();
		int year = dateNow.getYear();

		Date startd = new Date(year, sm - 1, sd);
		Date endd = new Date(year, em - 1, ed);

		HashMap<String, Date> map = new HashMap<String, Date>();

		map.put("start", startd);
		map.put("end", endd);
		return map;
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	public void update(Params params) {
		Param param = null;
		List<Param> find = (List<Param>) this.dao
				.find("from Param where paramName  = 'pageCount'");
		for (Param paramOne : find) {
			param = paramOne;
		}
		param.setParamValue(params.getPageCount().toString());
		this.dao.update(param);

		List<Param> find2 = (List<Param>) this.dao
				.find("from Param where paramName  = 'choiceDate'");
		for (Param paramOne : find2) {
			param = paramOne;
		}

		String choiceDate = (params.getChoiceOne().getMonth() + 1) + "-"
				+ params.getChoiceOne().getDate() + ">"
				+ (params.getChoiceTwo().getMonth() + 1) + "-"
				+ params.getChoiceTwo().getDate();
		param.setParamValue(choiceDate);
		this.dao.update(param);

		List<Param> find3 = (List<Param>) this.dao
				.find("from Param where paramName  = 'logDate'");
		for (Param paramOne : find3) {
			param = paramOne;
		}
		String logDate = (params.getLogOne().getMonth() + 1) + "-"
				+ params.getLogOne().getDate() + ">"
				+ (params.getLogTwo().getMonth() + 1) + "-"
				+ params.getLogTwo().getDate();
		param.setParamValue(logDate);
		this.dao.update(param);
	}

	@SuppressWarnings("unchecked")
	public void set(Params params) {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		session.put("params", params);
	}

	@SuppressWarnings("unchecked")
	public Params get() {
		Map<String, Object> session = (Map<String, Object>) ActionContext
				.getContext().get("session");
		Params params = (Params) session.get("params");
		return params;
	}
}
