package com.anteasy.struts2.interceptor;

import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
public class LoginInterceptor extends AbstractInterceptor{
	/*init 方法 ，仅创建Interceptor时调用一次*/
	public void init() {
		System.out.println("inited =================== ");
	}
	
	/*destroy 方法 ，仅摧毁Interceptor时调用一次*/
	public void destroy() {
		System.out.println("destroyed =================== ");
	}
	
	/*intercpte 方法，Interceptor创建后，每次拦截调用*/
	public String intercept(ActionInvocation arg0) throws Exception {
		HttpSession session = ServletActionContext.getRequest().getSession();//得到HttpSession
		String method = arg0.getInvocationContext().getName();//得到请求action的name(不是class)
		
		//判断 session 中“loginUser”键为空（注：此处默认登陆后会存储 用户信息 为“loginUser”到 session中）
		//判断 action请求 的方法名为 不为“login” （注：此处默认 登陆请求的name名为“login”判断的目的是将“login”请求排除）
		if (session.getAttribute("loginUser") == null && !"login".equals(method)) {
			session.invalidate();   //摧毁session对象,而不是清除session中的值
			return "exit";  //返回“exit”结果
		}
		return arg0.invoke();  //继续调用后续拦截器
	}
}
