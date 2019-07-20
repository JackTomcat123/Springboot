package com.cn.zzy.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.websocket.ClientEndpoint;

@Table
@Entity
public class Charge {
private int chargeId;
private Date chargeDate;
private ChargeType type;
private Student stu;
private double payMoney;
private Teacher teacher;
private String memo=null;
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column
public int getChargeId() {
	return chargeId;
}
public void setChargeId(int chargeId) {
	this.chargeId = chargeId;
}
@Column
public Date getChargeDate() {
	return chargeDate;
}
public void setChargeDate(Date chargeDate) {
	this.chargeDate = chargeDate;
}
@ManyToOne
@JoinColumn(name="fk_typeId")
public ChargeType getType() {
	return type;
}
public void setType(ChargeType type) {
	this.type = type;
}
@ManyToOne
@JoinColumn(name="fk_stuId")
public Student getStu() {
	return stu;
}

public void setStu(Student stu) {
	this.stu = stu;
}
@Column
public double getPayMoney() {
	return payMoney;
}
public void setPayMoney(double payMoney) {
	this.payMoney = payMoney;
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
public String getMemo() {
	return memo;
}
public void setMemo(String memo) {
	this.memo = memo;
}
}
