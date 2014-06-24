package com.app.util;

import java.util.ArrayList;

import com.orm.pojo.Open;

public class TimeTable {
	public TimeTable[] week;
	public TimeTable[] day;
	public ArrayList<Open> course;

	public TimeTable(int week, int day) {
		this.day = new TimeTable[day];
		for (int i = 0; i < day; i++) {
			this.day[i] = new TimeTable(week);
		}
	}

	public TimeTable(int week) {
		this.week = new TimeTable[week];
		for (int i = 0; i < week; i++) {
			this.week[i] = new TimeTable();
		}
	}

	public TimeTable() {
		this.course = new ArrayList<Open>();
	}

	public TimeTable[] getWeek() {
		return week;
	}

	public void setWeek(TimeTable[] week) {
		this.week = week;
	}

	public TimeTable[] getDay() {
		return day;
	}

	public void setDay(TimeTable[] day) {
		this.day = day;
	}

	public ArrayList<Open> getCourse() {
		return course;
	}

	public void setCourse(ArrayList<Open> course) {
		this.course = course;
	}

}
