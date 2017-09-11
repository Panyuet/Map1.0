package com.map.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import com.map.actionForm.ModifyForm;
import com.map.dao.BaseDao;
import com.map.impl.BaseDaoImpl;
import com.map.model.Point;

/**
 * 完成point的修改
 * @author 婷 2017-09-05
 */
public class ModifyAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		System.out.println("modifyaction");
		ModifyForm mf = (ModifyForm) form;
		FormFile file = mf.getFile(); 
		String root=request.getSession().getServletContext().getRealPath("/uploadImages");
		String childPath=mf.getImagePath();
		String name = mf.getImageName(); // 得到文件名
		
		File f = new File(root, childPath + "/" + name);
		if(f.exists())
			f.delete();
		if (!f.exists())
			f.createNewFile();
		int size=file.getFileSize();
		if(0!=size)
		{
			OutputStream os = new FileOutputStream(f);
			os.write(file.getFileData());
		}
		BaseDao dao=new BaseDaoImpl();
		List<Point> temp=dao.modifyPointById(mf.getPointId(), mf.getMem());
		response.setHeader("cache-control", "no-store");
		response.setHeader("pragma", "no-cache");
		response.setDateHeader("expires", 0);
		if(temp==null)
		{
			request.getRequestDispatcher("/WEB-INF/jsp/pointDetail.jsp").forward(request, response);
			
			return null;
		}
		else {
			//points和point都要改
			request.getSession().removeAttribute("points");
			request.getSession().setAttribute("points", temp);
			
			Point point=(Point) request.getSession().getAttribute("point");
			point.setMem(mf.getMem());
			request.getSession().setAttribute("point", point);
			request.getRequestDispatcher("/WEB-INF/jsp/pointDetail.jsp").forward(request, response);
			return null;
		}
		
	}
}
