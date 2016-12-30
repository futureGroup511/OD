package com.future.interceptors;

import com.future.domain.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SessionInterceptors implements HandlerInterceptor{
 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String url = request.getRequestURI();
		String beUrl = "loginUI,login";
		System.out.println("访问的url："+url);
		if(user == null){
			if(url.contains("login") || url.contains("js") ||url.contains("jquery") || url.contains("img") || url.contains("css") || url.contains("pdf") ){
				System.out.println("放行");
				return true;
			} else {
				System.out.println("转到登陆页面");
				request.getRequestDispatcher("/user/loginUI").forward(request, response);
			}
			//request.getRequestDispatcher("user/longinUI").forward(request, response);
			return false;
		}
		return true;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
	}

}
