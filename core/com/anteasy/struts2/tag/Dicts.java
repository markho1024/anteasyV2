package com.anteasy.struts2.tag;


import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.annotations.StrutsTag;
import org.apache.struts2.views.annotations.StrutsTagAttribute;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.app.core.service.DictService;
import com.opensymphony.xwork2.util.ValueStack;
import com.orm.pojo.Dict;

@StrutsTag(name = "dict", tldTagClass = "com.anteasy.util.tag.DictTag", description = "字典标签")
public class Dicts extends Component {
	private String type;
	private String code;
	private HttpSession session;
	private DictService service;

	public Dicts(ValueStack stack) {
		super(stack);
		// TODO Auto-generated constructor stub
	}

	public Dicts(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		super(stack);
		session = request.getSession();
		WebApplicationContext wac = WebApplicationContextUtils
				.getRequiredWebApplicationContext(session.getServletContext());
		service = (DictService) wac.getBean("dictService");
	}

	public DictService getService() {
		return service;
	}

	public void setService(DictService service) {
		this.service = service;
	}

	public HttpSession getSession() {
		return session;
	}

	public void setSession(HttpSession session) {
		this.session = session;
	}

	public String getType() {
		return type;
	}

	@StrutsTagAttribute(description = "字典类型", type = "String", required = true)
	public void setType(String type) {
		this.type = type;
	}

	public String getCode() {
		return code;
	}

	@StrutsTagAttribute(description = "字典代码", type = "String", required = true)
	public void setCode(String code) {
		this.code = code;
	}

	@SuppressWarnings("unchecked")
	public boolean start(Writer writer) {
		boolean result = super.start(writer);
		String actualValue = null;
		if (code != null&&!code.equals("")) {
			code = this.stripExpressionIfAltSyntax(code);
			code = (String) getStack().findValue(code, String.class,
					throwExceptionOnELFailure);
			Map<String, String> map = (HashMap<String, String>) session
					.getAttribute(type);
			map = new HashMap<String, String>();
			Dict dict = new Dict();
			dict.setDictType(type);
			try {
				List<Dict> list = this.service.findTypeAll(type);
				if (list != null && list.size() > 0) {
					for (Dict d : list) {
						map.put(d.getDictCode(), d.getDictName());
					}
				}
				session.setAttribute(type, map);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

			actualValue = map.get(code);
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


