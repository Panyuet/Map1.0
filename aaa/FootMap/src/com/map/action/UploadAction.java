package com.map.action;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;
import org.apache.commons.io.FilenameUtils;
import com.map.actionForm.UploadForm;
import com.map.dao.BaseDao;
import com.map.impl.BaseDaoImpl;
import com.map.model.Point;
import com.map.model.User;
import com.map.util.IdGenertor;

/**
 * 完成Point的存储以及图片的上传
 * @author 婷 2017-09-05
 */
public class UploadAction extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Point point = new Point();
		UploadForm ulf = (UploadForm) form;
		String path = request.getContextPath();
		String root=request.getSession().getServletContext().getRealPath("/uploadImages");
		File rootDir = new File(root);
		if (!rootDir.exists())
			rootDir.mkdirs();
		FormFile file = ulf.getFile(); // 从ActionForm中得到上传文件
		String name = file.getFileName(); // 得到文件名
		if (name != null) {
			name = IdGenertor.genGUID() + "."
					+ FilenameUtils.getExtension(name);// 存储时的名字
			System.out.println("存储时用的名字为=" + name);
			point.setImageName(name);
		}
		User user = (User) request.getSession().getAttribute("user");
		point.setUserId(user.getId());
		String childPath = getChildDie(root, name);// 子路胫
		BeanUtils.copyProperties(point, ulf);
		point.setImagePath(childPath);
		File f = new File(rootDir, childPath + "/" + name);
		if (!f.exists())
			f.createNewFile();
		OutputStream os = new FileOutputStream(f);
		os.write(file.getFileData());
		BaseDao dao=new BaseDaoImpl();
		dao.savePoint(point);
		List points=(List) request.getSession().getAttribute("points");
		points.add(point);
		request.getRequestDispatcher("/WEB-INF/jsp/loginSuccess.jsp").forward(request, response);
		return null;
	}

	private String getChildDie(String realPath, String fileName) {
		int hashCode = fileName.hashCode();
		int dir1 = hashCode & 0xf;
		int dir2 = (hashCode & 0xf0) >> 4;
		String s = dir1 + File.separator + dir2;
		File file = new File(realPath, s);
		if (!file.exists())
			file.mkdirs();
		return s;
	}
}
