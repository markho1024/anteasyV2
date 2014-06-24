package com.app.util;

import java.sql.Date;

public class Params {

	/* 结果页面的结果个数 */
	private Integer pageCount;

	/* 选课上、下学期 */
	private Date choiceOne;
	private Date choiceTwo;

	/* 上、下学期 */
	private Date logOne;
	private Date logTwo;

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public Date getChoiceOne() {
		return choiceOne;
	}

	public void setChoiceOne(Date choiceOne) {
		this.choiceOne = choiceOne;
	}

	public Date getChoiceTwo() {
		return choiceTwo;
	}

	public void setChoiceTwo(Date choiceTwo) {
		this.choiceTwo = choiceTwo;
	}

	public Date getLogOne() {
		return logOne;
	}

	public void setLogOne(Date logOne) {
		this.logOne = logOne;
	}

	public Date getLogTwo() {
		return logTwo;
	}

	public void setLogTwo(Date logTwo) {
		this.logTwo = logTwo;
	}
	
	public String toString(){
		
	return (
		this.choiceOne.toString()+">"+
		this.choiceTwo.toString()+"/"+
		this.logOne.toString()+">"+
		this.logTwo.toString()+"/"+
		this.pageCount
	);
	}
}
