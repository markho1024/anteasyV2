package com.orm.pojo;

import java.sql.Date;

public class Open {
	private Long openID;
	private Long courseID;
	private Long orderID;
	private Long collegeID;
	private Long teacherID;

	private Integer tableWeek;
	private Integer tableDay;
	private Long period;
	private String periodType;
	private String address;

	private String scoreKind;

	private Long countLimit;
	private Long countNow;

	private String courseType;
	private Float credit;

	private String remark;
	private Date createDate;
	private String status;

	public Long getCountLimit() {
		return countLimit;
	}

	public void setCountLimit(Long countLimit) {
		this.countLimit = countLimit;
	}

	public Long getCountNow() {
		return countNow;
	}

	public void setCountNow(Long countNow) {
		this.countNow = countNow;
	}

	public String getScoreKind() {
		return scoreKind;
	}

	public void setScoreKind(String scoreKind) {
		this.scoreKind = scoreKind;
	}

	public Long getOpenID() {
		return openID;
	}

	public void setOpenID(Long openID) {
		this.openID = openID;
	}

	public Long getCourseID() {
		return courseID;
	}

	public void setCourseID(Long courseID) {
		this.courseID = courseID;
	}

	public Long getOrderID() {
		return orderID;
	}

	public void setOrderID(Long orderID) {
		this.orderID = orderID;
	}

	public Long getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(Long collegeID) {
		this.collegeID = collegeID;
	}

	public Long getTeacherID() {
		return teacherID;
	}

	public void setTeacherID(Long teacherID) {
		this.teacherID = teacherID;
	}

	public Integer getTableWeek() {
		return tableWeek;
	}

	public void setTableWeek(Integer tableWeek) {
		this.tableWeek = tableWeek;
	}

	public Integer getTableDay() {
		return tableDay;
	}

	public void setTableDay(Integer tableDay) {
		this.tableDay = tableDay;
	}

	public Long getPeriod() {
		return period;
	}

	public void setPeriod(Long period) {
		this.period = period;
	}

	public String getPeriodType() {
		return periodType;
	}

	public void setPeriodType(String periodType) {
		this.periodType = periodType;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCourseType() {
		return courseType;
	}

	public void setCourseType(String courseType) {
		this.courseType = courseType;
	}

	public Float getCredit() {
		return credit;
	}

	public void setCredit(Float credit) {
		this.credit = credit;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
