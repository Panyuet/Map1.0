package com.map.actionForm;

import org.apache.struts.action.ActionForm;
import org.apache.struts.upload.FormFile;
/**
 * 文件上传
 * @author 婷
 */
public class UploadForm extends ActionForm{
	
	//x,y,城市，图片，备注
	private float x;
	private float y;
	private String city;
	private FormFile file;
	private String mem;
	public float getX() {
		return x;
	}
	public void setX(float x) {
		this.x = x;
	}
	public float getY() {
		return y;
	}
	public void setY(float y) {
		this.y = y;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
	
	
}
