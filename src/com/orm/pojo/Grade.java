package com.orm.pojo;

public class Grade {
	private Long gradeID;
	private String gradeName;
	private String studentType;

	public Long getGradeID() {
		return gradeID;
	}

	public void setGradeID(Long gradeID) {
		this.gradeID = gradeID;
	}

	public String getGradeName() {
		return gradeName;
	}

	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}

	public String getStudentType() {
		return studentType;
	}

	public void setStudentType(String studentType) {
		this.studentType = studentType;
	}

}
