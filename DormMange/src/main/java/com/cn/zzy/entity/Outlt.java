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
@Table
@Entity
public class Outlt {
private int  o_id;
private Student stu;
private Dorm dorm;
private Teacher teach;
private String memo;
private int flag=0;//0 为初始化，1，老师未批准 2，老师批准，3，退宿成功
private String Tmemo;
private String Dmemo;
private Date sendTime;
private Date TcheckTime;
private Date DcheckTime;
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column
public int getO_id() {
	return o_id;
}
public void setO_id(int o_id) {
	this.o_id = o_id;
}
@ManyToOne
@JoinColumn(name="stuid")
public Student getStu() {
	return stu;
}
public void setStu(Student stu) {
	this.stu = stu;
}
@ManyToOne
@JoinColumn(name="dormid")
public Dorm getDorm() {
	return dorm;
}
public void setDorm(Dorm dorm) {
	this.dorm = dorm;
}
@ManyToOne
@JoinColumn(name="teachid")
public Teacher getTeach() {
	return teach;
}
public void setTeach(Teacher teach) {
	this.teach = teach;
}
@Column
public String getMemo() {
	return memo;
}
public void setMemo(String memo) {
	this.memo = memo;
}
@Column
public int getFlag() {
	return flag;
}
public void setFlag(int flag) {
	this.flag = flag;
}
@Column
public String getTmemo() {
	return Tmemo;
}
public void setTmemo(String tmemo) {
	Tmemo = tmemo;
}
@Column
public String getDmemo() {
	return Dmemo;
}
public void setDmemo(String dmemo) {
	Dmemo = dmemo;
}
@Column
public Date getSendTime() {
	return sendTime;
}
public void setSendTime(Date sendTime) {
	this.sendTime = sendTime;
}
@Column
public Date getTcheckTime() {
	return TcheckTime;
}
public void setTcheckTime(Date tcheckTime) {
	TcheckTime = tcheckTime;
}
@Column
public Date getDcheckTime() {
	return DcheckTime;
}
public void setDcheckTime(Date dcheckTime) {
	DcheckTime = dcheckTime;
}





}
