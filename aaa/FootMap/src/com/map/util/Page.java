package com.map.util;
import java.util.List;

import com.map.model.Point;
public class Page {
	private List<Point> records;
	private int pageNum;
	private int totalPageNum;
	private int prePage;
	private int nextPage;
	
	private int pageSize=3;
	private int totalRecordsNum;
	
	private int startIndex;
	
	private String url;
	public Page(int pageNum,int totalRecordsNum)
	{
		this.pageNum=pageNum;
		this.totalRecordsNum=totalRecordsNum;
		
		totalPageNum=totalRecordsNum%pageSize==0?totalRecordsNum/pageSize:totalRecordsNum/pageSize+1;
		startIndex=pageNum-1;
	}

	public List<Point> getRecords() {
		return records;
	}

	public void setRecords(List<Point> records) {
		this.records = records;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}

	public int getPrePage() {
		prePage=pageNum-1;
		if(prePage<1)
			prePage=1;
		return prePage;
	}

	public void setPrePage(int prePage) {
		this.prePage = prePage;
	}

	public int getNextPage() {
		nextPage=pageNum+1;
		if(nextPage>totalPageNum)
			nextPage=totalPageNum;
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecordsNum() {
		return totalRecordsNum;
	}

	public void setTotalRecordsNum(int totalRecordsNum) {
		this.totalRecordsNum = totalRecordsNum;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
}
