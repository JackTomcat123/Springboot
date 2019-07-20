package com.cn.zzy.entity;

import java.util.*;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class Teacher {
	
private int teachId;
private String teachName;
private  String teachUserName;
private String teachPass;
private String sex;
private Date birthday;
private String idCard;
private String edulevel;
private String specialty;
private String tel;
private String address;
private int flag=0;
private String memo;
private Date hireDate;
private Date leaveDate=null;
private TeacherType type;
private List<Users> users=new ArrayList<Users>();
//get and set
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column
public int getTeachId() {
	return teachId;
}
public void setTeachId(int teachId) {
	this.teachId = teachId;
}
@Column
public String getTeachName() {
	return teachName;
}
public void setTeachName(String teachName) {
	this.teachName = teachName;
}
@Column
public String getTeachUserName() {
	return teachUserName;
}
public void setTeachUserName(String teachUserName) {
	this.teachUserName = teachUserName;
}
@Column
public String getTeachPass() {
	return teachPass;
}
public void setTeachPass(String teachPass) {
	this.teachPass = teachPass;
}
@Column
public String getSex() {
	return sex;
}
public void setSex(String sex) {
	this.sex = sex;
}
@Column
public Date getBirthday() {
	return birthday;
}
public void setBirthday(Date birthday) {
	this.birthday = birthday;
}
@Column
public String getIdCard() {
	return idCard;
}
public void setIdCard(String idCard) {
	this.idCard = idCard;
}
@Column
public String getEdulevel() {
	return edulevel;
}
public void setEdulevel(String edulevel) {
	this.edulevel = edulevel;
}
@Column
public String getSpecialty() {
	return specialty;
}
public void setSpecialty(String specialty) {
	this.specialty = specialty;
}
@Column
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
@Column
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
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
@Column
public Date getHireDate() {
	return hireDate;
}
public void setHireDate(Date hireDate) {
	this.hireDate = hireDate;
}
@Column
public Date getLeaveDate() {
	return leaveDate;
}
public void setLeaveDate(Date leaveDate) {
	this.leaveDate = leaveDate;
}
@ManyToOne
@JoinColumn(name="fk_typeid")
public TeacherType getType() {
	return type;
}
public void setType(TeacherType type) {
	this.type = type;
}
@ManyToMany(mappedBy="teacher",targetEntity=Users.class,fetch=FetchType.EAGER,cascade=CascadeType.MERGE)
public List<Users> getUsers() {
	return users;
}
public void setUsers(List<Users> users) {
	this.users = users;
}


	
	
	
}
