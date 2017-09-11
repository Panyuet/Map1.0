package com.map.action;

import java.io.Serializable;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.map.actionForm.RegistForm;
import com.map.model.User;
import com.map.util.SessionFactoryUtil;

/**
 * 完成注册功能的Action
 * @author 婷
 * 2017-09-05
 */
public class RegistAction extends Action{

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		RegistForm rgf=(RegistForm)form;
		User user=new User();
		BeanUtils.copyProperties(user, rgf);
		Session session=SessionFactoryUtil.getSession();
		Transaction tx=session.beginTransaction();
		Serializable id=session.save(user);
		tx.commit();
		session.close();
		user.setId((String)id);
		request.getSession().setAttribute("user",user);
		return mapping.findForward("success");
	}
	
	
}
