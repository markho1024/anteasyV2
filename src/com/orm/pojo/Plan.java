package com.orm.pojo;

import java.sql.Date;

public class Plan {
	private Long planID;
	private Long majorID;
	private Long courseID;
	private String studentType;
	private Long gradeID;
	
	private String remark;
	private Date createDate;
	private String status;

	public Long getPlanID() {
		return planID;
	}

	public void setPlanID(Long planID) {
		this.planID = planID;
	}

	public Long getMajorID() {
		return majorID;
	}

	public void setMajorID(Long majorID) {
		this.majorID = majorID;
	}

	public Long getCourseID() {
		return courseID;
	}

	public void setCourseID(Long courseID) {
		this.courseID = courseID;
	}

	public String getStudentType() {
		return studentType;
	}

	public void setStudentType(String studentType) {
		this.studentType = studentType;
	}

	public Long getGradeID() {
		return gradeID;
	}

	public void setGradeID(Long gradeID) {
		this.gradeID = gradeID;
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
