package com.anteasy.struts2.tag;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.annotations.StrutsTag;
import org.apache.struts2.views.annotations.StrutsTagAttribute;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.anteasy.hibernate3.BaseDAO;
import com.opensymphony.xwork2.util.ValueStack;

@StrutsTag(name = "deep", tldTagClass = "com.anteasy.util.tag.MapTag", description = "映射标签")
public class Deeps extends Component {
	private String name;
	private String type;
	private String code;
	private String value;

	private HttpSession session;
	private BaseDAO dao;

	/* 构造方法 */
	public Deeps(ValueStack stack) {
		super(stack);
	}

	public Deeps(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		super(stack);
		session = request.getSession();
		WebApplicationContext wac = WebApplicationContextUtils
				.getRequiredWebApplicationContext(session.getServletContext());
		dao = (BaseDAO) wac.getBean("baseDAO");
	}

	/* setter方法 */
	@StrutsTagAttribute(description = "映射表名", type = "String", required = true)
	public void setName(String name) {
		this.name = name;
	}

	@StrutsTagAttribute(description = "映射属性名", type = "String", required = true)
	public void setType(String type) {
		this.type = type;
	}

	@StrutsTagAttribute(description = "映射ID值", type = "String", required = true)
	public void setCode(String code) {
		this.code = code;
	}

	public void Judge() {
		String[] types = type.split("[|]");
		String[] names = name.split("[|]");
		value = code;
		for (int i = 0; i < names.length; i++) {
			String nameOne = names[i];
			String letter = nameOne.substring(0, 1);
			if (letter.equals('@')||letter.equals("@")) {
				value = Dict(types[i]);
			} else {
				value = Map(names[i], types[i]);
			}
		}
	}

	public String Dict(String type) {
		String sql = "select dictName from Dict where dictType='" + type
				+ "' and dictCode=" + value;
		List<?> list = this.dao.find(sql);
		String value = null;
		if (list != null) {
			for (Object obj : list) {
				value = obj.toString();
			}
		}
		return value;
	}

	public String Map(String name, String type) {
		String pojo = name.substring(0, 1).toUpperCase() + name.substring(1);
		String pojoID = name + "ID";
		String sql = "select " + type + " from " + pojo + " where " + pojoID
				+ "=" + value;
		List<?> list = this.dao.find(sql);
		String value = null;
		if (list != null) {
			for (Object obj : list) {
				value = obj.toString();
			}
		}
		return value;
	}

	public boolean start(Writer writer) {
		boolean result = super.start(writer);
		code = this.stripExpressionIfAltSyntax(code);
		code = (String) getStack().findValue(code, String.class,
				throwExceptionOnELFailure);
		Judge();
		try {
			if (value != null) {
				writer.write(value);
			} else {
				writer.write(code);
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
}