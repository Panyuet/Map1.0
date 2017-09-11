package com.map.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 用于验证注册时验证码是否与邮箱注册码一致
 * @author pyt_kilory
 *
 */
public class registCodeCheckServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean flag=true;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String validateCode=request.getParameter("registCode");
		Integer i=(Integer)request.getSession().getAttribute("registCode");
		String vc=i.toString();
		response.setContentType("text/html;charset=UTF-8");
		if(validateCode.equalsIgnoreCase(vc))
		{
			response.getWriter().write("");
		}
		else {
			response.getWriter().write("<font color='color'>注册码错误<font>");
		}
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
