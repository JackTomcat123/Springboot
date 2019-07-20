package com.cn.zzy.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table
public class Dorm {
private Integer dormId;
private int dormNum;
private DormType type;
private Building build;
private int personCount;
private int flag=0;
private String memo;
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column
public Integer getDormId() {
	return dormId;
}

public void setDormId(Integer dormId) {
	this.dormId = dormId;
}
@Column
public int getDormNum() {
	return dormNum;
}
public void setDormNum(int dormNum) {
	this.dormNum = dormNum;
}
@ManyToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE},targetEntity=DormType.class)
@JoinColumn(name="fk_typeId")
public DormType getType() {
	return type;
}
public void setType(DormType type) {
	this.type = type;
}
@ManyToOne(cascade={CascadeType.PERSIST,CascadeType.MERGE},targetEntity=Building.class)

@JoinColumn(name="fk_buildid")
public Building getBuild() {
	return build;
}
public void setBuild(Building build) {
	this.build = build;
}
@Column
public int getPersonCount() {
	return personCount;
}
public void setPersonCount(int personCount) {
	this.personCount = personCount;
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
