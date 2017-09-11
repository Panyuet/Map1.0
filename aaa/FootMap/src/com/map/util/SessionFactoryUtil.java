package com.map.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import com.map.model.Point;
import com.map.model.User;

public class SessionFactoryUtil {
	
	private static SessionFactory factory;//一个应用一般只有一个SessioFactory，他的创建比较耗时
	static
	{
		Configuration configuration=new Configuration().configure();
		configuration.addClass(User.class);
		configuration.addClass(Point.class);
		StandardServiceRegistry serviceRegistry=new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
		factory=configuration.buildSessionFactory(serviceRegistry);
	}
	public static SessionFactory getSessionFactory(){
		return factory;
	}
	public static Session getSession(){
		Session session = factory.openSession();
		return session;
	}
}