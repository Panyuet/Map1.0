package com.map.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 用于验证登录时输入的 验证码是否与图片验证码一致
 * @author pyt_kilory
 *
 */
public class validateCodeCheckServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//比较验证码是否正确
		boolean flag=true;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String validateCode=request.getParameter("validateCode");
		String vc=(String) request.getSession().getAttribute("validateCode");
		response.setContentType("text/html;charset=UTF-8");
		if(validateCode.equalsIgnoreCase(vc))
		{
			response.getWriter().write("");
		}
		else {
			response.getWriter().write("<font color='red'>验证码错误<font>");
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
