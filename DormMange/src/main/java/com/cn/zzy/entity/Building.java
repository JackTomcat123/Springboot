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
public class Building
{
   private Integer buildid;
   private String buildname;//宿舍楼名称
   private int dormcount;//房间数
   private int dormfloor;//层数
   private List<Dorm> dorm=new ArrayList<Dorm>();
   @Id
   @GeneratedValue(strategy=GenerationType.IDENTITY)
   @Column
   public Integer getBuildid()
   {
   	return buildid;
   }
   public void setBuildid(Integer buildid)
   {
   	this.buildid = buildid;
   }
  @Column
public int getDormfloor()
{
	return dormfloor;
}
public void setDormfloor(int dormfloor)
{
	this.dormfloor = dormfloor;
}
@Column
public String getBuildname()
{
	return buildname;
}
public void setBuildname(String buildname)
{
	this.buildname = buildname;
}
@Column
public int getDormcount()
{
	return dormcount;
}
public void setDormcount(int dormcount)
{
	this.dormcount = dormcount;
}
@OneToMany(mappedBy="build",targetEntity=Dorm.class)
public List<Dorm> getDorm() {
	return dorm;
}
public void setDorm(List<Dorm> dorm) {
	this.dorm = dorm;
}
   
   
}
