package com.orm.pojo;

import java.sql.Date;

public class Pick {
	private Long pickID;
	private Long studentID;
	private Long openID;

	private String scoreType;
	private String score;

	private Long point;
	private Date examDate;
	private String logStatus;

	private String remark;
	private Date createDate;
	private String status;

	public Long getPickID() {
		return pickID;
	}

	public void setPickID(Long pickID) {
		this.pickID = pickID;
	}

	public Long getStudentID() {
		return studentID;
	}

	public void setStudentID(Long studentID) {
		this.studentID = studentID;
	}

	public Long getOpenID() {
		return openID;
	}

	public void setOpenID(Long openID) {
		this.openID = openID;
	}

	public String getScoreType() {
		return scoreType;
	}

	public void setScoreType(String scoreType) {
		this.scoreType = scoreType;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Long getPoint() {
		return point;
	}

	public void setPoint(Long point) {
		this.point = point;
	}

	public Date getExamDate() {
		return examDate;
	}

	public void setExamDate(Date examDate) {
		this.examDate = examDate;
	}

	public String getLogStatus() {
		return logStatus;
	}

	public void setLogStatus(String logStatus) {
		this.logStatus = logStatus;
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
