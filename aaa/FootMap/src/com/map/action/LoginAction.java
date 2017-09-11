package com.map.action;

import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;
import com.map.actionForm.LoginForm;
import com.map.model.User;
import com.map.util.SessionFactoryUtil;

/**
 * 完成用户登录功能的action
 * @author 婷
 * 2017-09-05
 */
public class LoginAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		//form中包含name,password
		LoginForm lgf=(LoginForm)form;
		User user=new User();
		Session session=SessionFactoryUtil.getSession();
		List list=session.createQuery("from User where firstname=:name and password=:password")
			.setParameter("name", lgf.getName()).setParameter("password", lgf.getPassword()).list();
		
		if(list.size()!=0)
		{
			//登录成功
			for (Iterator iter=list.iterator(); iter.hasNext();) 
			{
				 user = (User)iter.next();
				 //取出用户对应的Point记录
				  List points = session.createQuery("select p from Point as p").list();
				  request.getSession().setAttribute("points", points);
				  request.getSession().setAttribute("pageNum", 0);
				break;
			}
			request.getSession().setAttribute("user",user);
			session.close();
			return mapping.findForward("success");
		}
		else {
			session.close();
			return mapping.findForward("fail");
		}
		
		
	}
	
	
}
