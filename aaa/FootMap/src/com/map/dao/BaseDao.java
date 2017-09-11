package com.map.dao;

import java.util.List;

import com.map.model.Point;

public interface BaseDao {
	//检查用户名是否可用
	boolean nameCheck(String name);
	
	//往数据库中添加点的记录
	void savePoint(Point point);

	//根据id删除数据中的一条point记录,返回更新后的数据
	List<Point> delePointById(String pointId);

	List<Point> modifyPointById(String pointId,String mem);

	Point findPointById(String pointId);
}
