package com.map.model;

public class Point {
	private String id;
	private float x;
	private float y;
	private String city;
	private String mem;
	private String imagePath;
	private	String imageName;
	private String userId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
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
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Point() {}
	//加载时用到的构造函数
	
	public Point(String id, float x, float y, String city, String mem,
			String imagePath, String imageName, String userId) {
		super();
		this.id = id;
		this.x = x;
		this.y = y;
		this.city = city;
		this.mem = mem;
		this.imagePath = imagePath;
		this.imageName = imageName;
		this.userId = userId;
	}
	

	@Override
	public String toString() {
		return this.getX()+"="+this.getY()+"="+this.getCity()+"="+this.getMem();
	}
	
}
