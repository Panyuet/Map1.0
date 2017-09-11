package com.map.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * 用于验证用户名是否可用
 * @author pyt_kilory
 *
 */
public class sendMailServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Properties properties=new Properties();
		properties.setProperty("mail.transport.protocol", "smtp");
		properties.setProperty("mail.host", "smtp.163.com");
		properties.setProperty("mail.smtp.auth", "true");//设置需要身份验证
		properties.setProperty("mail.debug", "true");//可以看到发送的详情
		System.err.println("11");
		Session session=Session.getInstance(properties);//发送的环境
		MimeMessage message=new MimeMessage(session);//一封邮件
		String email=request.getParameter("email");
		try {
			message.setFrom(new InternetAddress("13879119157@163.com"));
			message.setRecipients(Message.RecipientType.TO, email);//设置收件人
			message.setSubject("您的【足迹】注册码");//设置邮件的主题
			int code=(int)(Math.random()*(9999-1000+1))+1000;
			System.out.println(code);
			message.setContent("欢迎注册！您的【足迹】注册码为："+code, "text/plain;charset=UTF-8");
			request.getSession().setAttribute("registCode",code);
			message.saveChanges();
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}//发件人
		
		
		//开始发送
		Transport ts;
		try {
			System.out.println("session:"+session);
			ts = session.getTransport();
			System.out.println("ts:"+ts);
			ts.connect("13879119157@163.com","pyt53568196");//设置用户名和密码
			ts.sendMessage(message, message.getAllRecipients());
			
		} catch (NoSuchProviderException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
