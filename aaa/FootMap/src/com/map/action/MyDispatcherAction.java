package com.map.action;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import com.map.dao.BaseDao;
import com.map.impl.BaseDaoImpl;
import com.map.model.Point;

import cn.dsna.util.images.ValidateCode;

/**
 * 完成转发功能的Action
 * 
 * @author 婷 2017-09-05
 */
public class MyDispatcherAction extends DispatchAction {

	/**
	 * 登录前的准备 ：获取图片验证码
	 */
	// public ActionForward loginPreparement(ActionMapping mapping, ActionForm
	// form,
	// HttpServletRequest req, HttpServletResponse resp)
	// {
	// System.out.println("进入");
	// ValidateCode validateCode=new ValidateCode(120, 30, 4, 5);
	// System.out.println(req.getRequestURI());
	// System.out.println(req.getRequestURL());
	// try {
	// System.out.println(req.getContextPath());
	// FileOutputStream fos=new FileOutputStream(req.getContextPath()+"vc.jpg");
	// BufferedImage bImage=validateCode.getBuffImg();
	// ImageIO.write(bImage, "jpg", fos);
	// //validateCode.write("vc.jpg");
	// } catch (FileNotFoundException e) {
	// e.printStackTrace();
	// } catch (IOException e) {
	// e.printStackTrace();
	// }
	// req.getSession().setAttribute("validateCode", validateCode.getCode());
	// System.out.println("验证码为:"+req.getSession().getAttribute("validateCode"));
	// return mapping.findForward("login");
	// }

	public ActionForward loginPreparement(ActionMapping mapping,
			ActionForm form, HttpServletRequest req, HttpServletResponse resp)
			throws Exception {

		System.out.println("验证码准备");
		ValidateCode validateCode = new ValidateCode(120, 30, 4, 5);

		// try {
		// //validateCode.write(new FileOutputStream(new
		// File("validateCode.jpg")));
		// } catch (IOException e) {
		// e.printStackTrace();
		// }
		BufferedImage bImage = validateCode.getBuffImg();
		ServletOutputStream outputStream = resp.getOutputStream();
		ImageIO.write(bImage, "jpg", outputStream);
		// resp.getOutputStream().write(b);
		outputStream.close();
		req.getSession().setAttribute("validateCode", validateCode.getCode());
		req.getRequestDispatcher("/login.jsp");
		req.getSession().setAttribute("validateCode", validateCode.getCode());
		// resp.setContentType("text/plain;charset=UTF-8");//以纯文本形式传输
		// resp.getWriter().write(validateCode.getCode().toString());
		System.out.println("验证码为:"+ req.getSession().getAttribute("validateCode"));
		return null;
	}

	/**
	 * 负责页面转发的方法
	 */
	public ActionForward doDispatcher(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String uri = req.getParameter("uri");
		System.out.println("uri=" + uri);
		req.getRequestDispatcher("/WEB-INF/jsp/" + uri + ".jsp").forward(req,
				resp);
		return null;
	}

	/**
	 * 负责删除点的方法
	 */
	public ActionForward deletePoint(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws Exception {
		System.out.println("删除点");
		req.getSession().removeAttribute("points");
		String pointId=req.getParameter("pointId");
		BaseDao dao=new BaseDaoImpl();
		Point point=dao.findPointById(pointId);
		String root=req.getSession().getServletContext().getRealPath("/uploadImages");
		String childPath=point.getImagePath();
		String name = point.getImageName(); // 得到文件名
		
		File f = new File(root, childPath + "/" + name);
		if(f.exists())
		{
			System.out.println("文件存在");
			f.delete();
		}
		List<Point> points=dao.delePointById(pointId);
		req.getSession().setAttribute("points", points);
		req.getRequestDispatcher("/WEB-INF/jsp/pointsManage.jsp").forward(req,resp);
		return null;
	}

	/**
	 * 负责修改前的准备的方法
	 */
	public ActionForward modifyPreparement(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws Exception {

		String pointId=req.getParameter("pointId");
		BaseDao dao=new BaseDaoImpl();
		Point point=dao.findPointById(pointId);
		req.getSession().setAttribute("point", point);
		return mapping.findForward("pointDetail");
	}
	
	/**
	 * 负责修改点的方法
	 */
	/*public ActionForward modifyPoint(ActionMapping mapping, ActionForm form,
			HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String pointId=req.getParameter("pointId");
		String city=req.getParameter("city");
		String mem=req.getParameter("mem");
		
		BaseDao dao=new BaseDaoImpl();
		dao.modifyPointById(pointId)
		//List<Point> points=dao.modifyPointById(pointId);
		Point point=dao.findPointById(pointId);
		//req.getSession().removeAttribute("points");
		req.setAttribute("point", point);
		return mapping.findForward("pointDetail");
	}
*/
	/**
	 * 负责添加点
	 */
	/*
	 * public ActionForward addPoint(ActionMapping mapping, ActionForm form,
	 * HttpServletRequest req, HttpServletResponse resp) throws Exception {
	 * req.setCharacterEncoding("utf-8"); // java.net.URLDecoder.decode(s, enc)
	 * float x=Float.parseFloat(req.getParameter("x")); float
	 * y=Float.parseFloat(req.getParameter("y")); // String
	 * m=req.getParameter("mem"); // byte[] b=m.getBytes(); // String mem=new
	 * String(b,"utf-8"); // System.out.println(req.getParameter("mem")); Point
	 * point=new Point(x, y,
	 * req.getParameter("city"),req.getParameter("mem")+"@#$"); BaseDao dao=new
	 * BaseDaoImpl(); dao.savePoint(point); List points=(List)
	 * req.getSession().getAttribute("points"); points.add(point);
	 * req.getRequestDispatcher("/WEB-INF/jsp/loginSuccess.jsp").forward(req,
	 * resp); return null; }
	 */

	// /**
	// * 注册
	// */
	// public ActionForward regist(ActionMapping mapping, ActionForm form,
	// HttpServletRequest req, HttpServletResponse resp)
	// throws Exception {
	// //注册后返回登录成功页面
	// return null;
	// }

	// /**
	// * 验证用户名是否可用
	// */
	// public ActionForward nameCheck(ActionMapping mapping, ActionForm form,
	// HttpServletRequest req, HttpServletResponse resp)
	// throws Exception {
	// return null;
	// }

	public ActionForward exitSystem(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse resp) {
		request.getSession().removeAttribute("client");
		return mapping.findForward("exitSystem");
	}

	public ActionForward unspecified(ActionMapping mapping,
			HttpServletRequest request, HttpServletResponse response) {
		return mapping.findForward("error");
	}
}
