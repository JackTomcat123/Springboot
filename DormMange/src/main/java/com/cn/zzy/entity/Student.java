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
@Table
@Entity
public class Student {
private int stuId;
private String stuNum;
private String stuName;
private String stuUserName;
private String stuPass;
private String sex;
private Date birthday;
private String cardId;
private ClassInfo clazz;
private String tel;
private String province;
private String city;
private Date inDate;
private Date outDate=null;
private Date dormStartDate=null;
private Date dormEndDate=null;
private Dorm dorm;
private int flag=0;
private String memo;
private List<Users> users=new ArrayList<Users>();
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column
public int getStuId() {
	return stuId;
}
public void setStuId(int stuId) {
	this.stuId = stuId;
}
@Column
public String getStuNum() {
	return stuNum;
}
public void setStuNum(String stuNum) {
	this.stuNum = stuNum;
}
@Column
public String getStuName() {
	return stuName;
}
public void setStuName(String stuName) {
	this.stuName = stuName;
}
@Column
public String getStuUserName() {
	return stuUserName;
}
public void setStuUserName(String stuUserName) {
	this.stuUserName = stuUserName;
}
@Column
public String getStuPass() {
	return stuPass;
}
public void setStuPass(String stuPass) {
	this.stuPass = stuPass;
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
public String getCardId() {
	return cardId;
}
public void setCardId(String cardId) {
	this.cardId = cardId;
}
@ManyToOne
@JoinColumn(name="fk_classId")
public ClassInfo getClazz() {
	return clazz;
}
public void setClazz(ClassInfo clazz) {
	this.clazz = clazz;
}
@Column
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
@Column
public String getProvince() {
	return province;
}
public void setProvince(String province) {
	this.province = province;
}
@Column
public String getCity() {
	return city;
}
public void setCity(String city) {
	this.city = city;
}
@Column
public Date getInDate() {
	return inDate;
}
public void setInDate(Date inDate) {
	this.inDate = inDate;
}
@Column
public Date getOutDate() {
	return outDate;
}

public void setOutDate(Date outDate) {
	this.outDate = outDate;
}
@Column
public Date getDormStartDate() {
	return dormStartDate;
}
public void setDormStartDate(Date dormStartDate) {
	this.dormStartDate = dormStartDate;
}
@Column
public Date getDormEndDate() {
	return dormEndDate;
}
public void setDormEndDate(Date dormEndDate) {
	this.dormEndDate = dormEndDate;
}
@ManyToOne(fetch = FetchType.EAGER)
@JoinColumn(name="fk_dormId")
public Dorm getDorm() {
	return dorm;
}
public void setDorm(Dorm dorm) {
	this.dorm = dorm;
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
@ManyToMany(mappedBy="student",cascade=CascadeType.MERGE,targetEntity=Users.class)

public List<Users> getUsers() {
	return users;
}
public void setUsers(List<Users> users) {
	this.users = users;
}


}
