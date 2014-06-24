package com.anteasy.common.tool;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.apache.struts2.ServletActionContext;

public class JsonUtil {

	/* jsp 输出 */
	public static void outResponseJson(String jsonStr) {
		ServletActionContext.getResponse().setContentType(
				"application/json;charset=UTF-8");
		outString(jsonStr);
	}

	public static void outString(String str) {
		PrintWriter out;
		try {
			out = ServletActionContext.getResponse().getWriter();
			out.write(str);
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void outBoolean(Boolean str) {
		PrintWriter out;
		try {
			out = ServletActionContext.getResponse().getWriter();
			out.print(str);
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/* json 输出 */
	public static void jsonMap(List<Object> list, String jsonType) {
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		StringBuilder data = new StringBuilder();

		if (list != null) {
			if (jsonType.equals("all")) {
				data.append("{\"id\":\"\",\"text\":\"全部\",\"checked\":false,\"open\":false}");
			}
			for (Object obj : list) {
				Object[] param = (Object[]) obj;
				Object code =  param[0];
				Object name =  param[1];
				data.append(data.length() > 0 ? "," : "");
				data.append("{\"id\":\"").append(code.toString()).append("\",");
				data.append("\"text\":\"").append(name.toString()).append("\",");
				data.append("\"checked\":false,");
				data.append("\"open\":false}");
			}
		} else {
			data.append("{\"id\":\"\",\"text\":\"全部\",\"checked\":false,\"open\":false}");
		}
		sb.append(data);
		sb.append("]");
		JsonUtil.outResponseJson(sb.toString());
	}
}
