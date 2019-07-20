package com.cn.zzy.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class DormType
{
   private int typeid;
   private String typename;//宿舍类型(几人间)
   private int personcount;//额定人数
   private int price;
   private int flag;
   private String sex;
   private String memo;
   private List<Dorm> dorm=new ArrayList<Dorm>();
   @Id
   @GeneratedValue(strategy=GenerationType.IDENTITY)
   @Column
public int getTypeid()
{
	return typeid;
}
public void setTypeid(int typeid)
{
	this.typeid = typeid;
}
@Column
public String getTypename()
{
	return typename;
}
public void setTypename(String typename)
{
	this.typename = typename;
}
@Column
public int getPersoncount()
{
	return personcount;
}
public void setPersoncount(int personcount)
{
	this.personcount = personcount;
}
@Column
public int getPrice()
{
	return price;
}
public void setPrice(int price)
{
	this.price = price;
}
@Column
public int getFlag()
{
	return flag;
}
public void setFlag(int flag)
{
	this.flag = flag;
}
@Column
public String getSex()
{
	return sex;
}
public void setSex(String sex)
{
	this.sex = sex;
}
@Column
public String getMemo()
{
	return memo;
}
public void setMemo(String memo)
{
	this.memo = memo;
}
@OneToMany(mappedBy="type",targetEntity=Dorm.class)
public List<Dorm> getDorm() {
	return dorm;
}
public void setDorm(List<Dorm> dorm) {
	this.dorm = dorm;
}
}
