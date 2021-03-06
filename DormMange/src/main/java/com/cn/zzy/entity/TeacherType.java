package com.cn.zzy.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class TeacherType
{
   private int typeid;
   private String typename;
   private String memo;
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
public String getMemo()
{
	return memo;
}
public void setMemo(String memo)
{
	this.memo = memo;
}
   
}
