package com.cn.zzy.entity;

import java.util.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Table
@Entity
public class ClassInfo {
private int classId;
private String className;
private Teacher teacher;
private Date createDate;
private Date endDate=null;
private int flag=0;
private String memo;
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column
public int getClassId() {
	return classId;
}
public void setClassId(int classId) {
	this.classId = classId;
}
@Column
public String getClassName() {
	return className;
}
public void setClassName(String className) {
	this.className = className;
}
@ManyToOne
@JoinColumn(name="fk_teachId")
public Teacher getTeacher() {
	return teacher;
}
public void setTeacher(Teacher teacher) {
	this.teacher = teacher;
}
@Column
public Date getCreateDate() {
	return createDate;
}
public void setCreateDate(Date createDate) {
	this.createDate = createDate;
}
@Column
public Date getEndDate() {
	return endDate;
}
public void setEndDate(Date endDate) {
	this.endDate = endDate;
}
@Column
public int getFlag() {
	return flag;
}
public void setFlag(int flag) {
	this.flag = flag;
}
@Column
public String getMemo() {
	return memo;
}
public void setMemo(String memo) {
	this.memo = memo;
}
}
