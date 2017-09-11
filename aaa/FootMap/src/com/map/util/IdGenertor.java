package com.map.util;

import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * 根据日期生成id
 * @author 婷
 *
 */
public class IdGenertor {
	public static String genGUID(){
		return new BigInteger(165, new Random()).toString(36).toUpperCase();
	}
	
	public static String genOrderId(){
		Date date=new Date();
		return new SimpleDateFormat("yyyyMMDDhhMMSS").format(date);
	}
}
