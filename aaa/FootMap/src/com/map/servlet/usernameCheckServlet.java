package com.map.servlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.map.dao.BaseDao;
import com.map.impl.BaseDaoImpl;
/**
 * 用于验证用户名是否可用
 * @author pyt_kilory
 *
 */
public class usernameCheckServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//比较用户名是否可用
		boolean flag=true;
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String name=request.getParameter("name");
		BaseDao dao=new BaseDaoImpl();
		flag=dao.nameCheck(name);
		response.setContentType("text/html;charset=UTF-8");
		if(flag==true)
		{
			response.getWriter().write("<font color='green'>用户名可用<font>");
		}
		else {
			response.getWriter().write("<font color='color'>用户名已被他人占用<font>");
		}
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
