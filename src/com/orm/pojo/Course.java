package com.orm.pojo;

import java.sql.Date;

public class Course {
	private Long courseID;
	private String courseName;

	private Long collegeID;
	private String courseKind;

	private String remark;
	private Date createDate;
	private String status;

	public Long getCollegeID() {
		return collegeID;
	}

	public void setCollegeID(Long collegeID) {
		this.collegeID = collegeID;
	}

	public String getCourseKind() {
		return courseKind;
	}

	public void setCourseKind(String courseKind) {
		this.courseKind = courseKind;
	}

	public Long getCourseID() {
		return courseID;
	}

	public void setCourseID(Long courseID) {
		this.courseID = courseID;
	}

	public String getCourseName() {
		return courseName;
	}

	public void setCourseName(String courseName) {
		this.courseName = courseName;
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
