package com.future.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.future.domain.User;

public class SessionInterceptors implements HandlerInterceptor{
 
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		String url = request.getRequestURI();
		String beUrl = "loginUI,login";
		if(user == null){
			if(url.contains("login")){
				return true;
			} else {
				request.getRequestDispatcher("/user/loginUI").forward(request, response);
			}
			//request.getRequestDispatcher("user/longinUI").forward(request, response);
			System.out.println("放行");
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
