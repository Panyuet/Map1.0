package com.map.actionForm;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;
/**
 * 文件上传
 * @author 婷
 */
public class ModifyForm extends ActionForm{
	
	//图片，备注
	private FormFile file;
	private String pointId;
	private String mem;
	private String imagePath;
	private String imageName;
	
	public String getPointId() {
		return pointId;
	}
	public void setPointId(String pointId) {
		this.pointId = pointId;
	}
	public FormFile getFile() {
		return file;
	}
	public void setFile(FormFile file) {
		this.file = file;
	}
	public String getMem() {
		return mem;
	}
	public void setMem(String mem) {
		this.mem = mem;
	}
	
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
}
