package com.iscream.util;

public class PagingUtil {

	private int rowsPerPage = 3;	//每页显示的记录数
	private int totalRows;	//总行数
	private int totalPages;	//总页数
	private int reqPage = 1;	//请求页
	private int firstRow;	//请求页的第一行
	
	private int pervPage;	//上一页
	private int nextPage;	//下一页
	private int firstPage = 1;	//首页
	private int lastPage;	//末页
	
	public PagingUtil(int rowsPerPage){
		this.rowsPerPage = rowsPerPage;
	}
	
	public void gotoPage(int reqPage,int totalRows){
		this.totalRows = totalRows;
		this.totalPages = (int)Math.ceil((this.totalRows + 0.0) 

/ rowsPerPage);
		this.reqPage = reqPage;
		this.firstRow = (this.reqPage - 1) * this.rowsPerPage;
		this.pervPage = this.reqPage <= 1 ? 1 : (this.reqPage - 

1);
		this.nextPage = this.reqPage >= this.totalPages ? 

this.totalPages : (this.reqPage + 1);
		this.lastPage = this.totalPages;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getFirstRow() {
		return firstRow;
	}

	public int getPervPage() {
		return pervPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public int getLastPage() {
		return lastPage;
	}
	
}
