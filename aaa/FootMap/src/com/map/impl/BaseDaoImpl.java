package com.map.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.map.dao.BaseDao;
import com.map.model.Point;
import com.map.util.SessionFactoryUtil;

public class BaseDaoImpl implements BaseDao{

	@Override
	public boolean nameCheck(String name) {
		Session session=SessionFactoryUtil.getSession();
		int i=session.createQuery("from User u where firstname=:name")
				.setParameter("name", name).list().size();
		session.close();
		if(0!=i)
			return false;
		else
			return true;
	}

	@Override
	public void savePoint(Point point) {
		Session session=SessionFactoryUtil.getSession();
		Transaction tx=session.beginTransaction();
		session.save(point);
		tx.commit();
		session.close();
	}


	@Override
	public List<Point> delePointById(String pointId) {
		Session session=SessionFactoryUtil.getSession();
		Transaction tx=session.beginTransaction();
		Query query=session.createQuery("delete from Point where id=:id").setParameter("id", pointId);
		query.executeUpdate();
		tx.commit();
		List points = session.createQuery(" from Point").list(); 
        return points;
	}


	@Override
	public List<Point> modifyPointById(String pointId,String mem) {
		if(mem==null||mem=="")
		{
			//只更改了图片
			return null;
		}
		else {
			Session session=SessionFactoryUtil.getSession();
			session.createQuery("update Point set mem=:mem where id=:id").setParameter("mem", mem).setParameter("id", pointId);
			List points = session.createQuery(" from Point").list(); 
	        return points;
		}
	}


	@Override
	public Point findPointById(String pointId) {
		Session session=SessionFactoryUtil.getSession();
		Point point = (Point) session.createQuery("from Point where id=:id").setParameter("id", pointId).uniqueResult();
        return point;
	}
}
