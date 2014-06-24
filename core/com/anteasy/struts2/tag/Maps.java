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

@StrutsTag(name = "map", tldTagClass = "com.anteasy.util.tag.MapTag", description = "映射标签")
public class Maps extends Component {
	private String name;
	private String type;
	private String code;

	private HttpSession session;
	private BaseDAO dao;

	/* 构造方法 */
	public Maps(ValueStack stack) {
		super(stack);
	}

	public Maps(ValueStack stack, HttpServletRequest request,
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

	public boolean start(Writer writer) {
		boolean result = super.start(writer);
		String actualValue = null;
		if (code != null) {
			code = this.stripExpressionIfAltSyntax(code);
			code = (String) getStack().findValue(code, String.class,
					throwExceptionOnELFailure);
			if (code != null && !code.equals("")) {
				String pojo = name.substring(0, 1).toUpperCase()
						+ name.substring(1);
				String pojoID = name + "ID";
				String sql = "select " + type + " from " + pojo + " where "
						+ pojoID + " = " + code;

				List<?> list = this.dao.find(sql);

				if (list != null) {
					for (Object obj : list) {
						if (null != obj)
							actualValue = obj.toString();
					}
				}
			}
		}
		try {
			if (actualValue != null) {
				writer.write(actualValue);
			} else {
				writer.write(code);
			}
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

		return result;
	}
}