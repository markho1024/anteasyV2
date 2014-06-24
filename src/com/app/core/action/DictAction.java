package com.app.core.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.anteasy.common.tool.JsonUtil;
import com.anteasy.struts2.BaseAction;
import com.app.core.service.DictService;
import com.orm.pojo.Dict;

@Controller("dictAction")
public class DictAction extends BaseAction {

	private String type;
	private String code;
	private DictService dictService;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public DictService getDictService() {
		return dictService;
	}

	@Autowired
	public void setDictService(DictService dictService) {
		this.dictService = dictService;
	}

	public void json(){
		List<Dict> list = this.dictService.findType(type);
		
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		if (list != null) {
			StringBuilder data = new StringBuilder();
			// data.append("{\"id\":\"\",\"text\":\"全部\",\"checked\":false,\"open\":false}");
			for (Dict d : list) {
				data.append(data.length() > 0 ? "," : "");
				data.append("{\"id\":\"").append(d.getDictCode()).append("\",");
				data.append("\"text\":\"").append(d.getDictName())
						.append("\",");
				data.append("\"checked\":false,");
				data.append("\"open\":false}");
			}
			sb.append(data);
		}
		sb.append("]");
		JsonUtil.outResponseJson(sb.toString());
	}

	public void jsonAll() {
		List<Dict> list = this.dictService.findType(type);
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		if (list != null) {
			StringBuilder data = new StringBuilder();
			data.append("{\"id\":\"\",\"text\":\"全部\",\"checked\":false,\"open\":false}");
			for (Dict d : list) {
				data.append(data.length() > 0 ? "," : "");
				data.append("{\"id\":\"").append(d.getDictCode()).append("\",");
				data.append("\"text\":\"").append(d.getDictName())
						.append("\",");
				data.append("\"checked\":false,");
				data.append("\"open\":false}");
			}
			sb.append(data);
		}
		sb.append("]");
		JsonUtil.outResponseJson(sb.toString());
	}
	
	public void jsonLimit(){
		List<Dict> list = this.dictService.findTypeLimit(type);
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		if (list != null) {
			StringBuilder data = new StringBuilder();
			data.append("{\"id\":\"\",\"text\":\"全部\",\"checked\":false,\"open\":false}");
			for (Dict d : list) {
				data.append(data.length() > 0 ? "," : "");
				data.append("{\"id\":\"").append(d.getDictCode()).append("\",");
				data.append("\"text\":\"").append(d.getDictName())
						.append("\",");
				data.append("\"checked\":false,");
				data.append("\"open\":false}");
			}
			sb.append(data);
		}
		sb.append("]");
		JsonUtil.outResponseJson(sb.toString());
	}
}
