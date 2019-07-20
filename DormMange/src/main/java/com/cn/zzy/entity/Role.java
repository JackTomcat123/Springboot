package com.cn.zzy.entity;

import java.util.ArrayList;
import java.util.List;

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
import javax.persistence.Table;
@Entity
@Table
public class Role
{
	private int r_id;
	private String r_name;
	private int r_sort;
	//处理多对多关系
	private List<Users> users = new ArrayList<Users>();
	private List<Power> power=new ArrayList<Power>();
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column
	public int getR_id()
	{
		return r_id;
	}

	public void setR_id(int r_id)
	{
		this.r_id = r_id;
	}
	@Column
	public String getR_name()
	{
		return r_name;
	}

	public void setR_name(String r_name)
	{
		this.r_name = r_name;
	}
	@Column
	public int getR_sort() {
		return r_sort;
	}

	public void setR_sort(int r_sort) {
		this.r_sort = r_sort;
	}
	@ManyToMany(mappedBy="role",cascade=CascadeType.MERGE,targetEntity=Users.class)
	public List<Users> getUsers()
	{
		return users;
	}

	public void setUsers(List<Users> users)
	{
		this.users = users;
	}
	@ManyToMany(cascade=CascadeType.MERGE,fetch=FetchType.EAGER,targetEntity=Power.class)
	@JoinTable(
			name="role_power",
			joinColumns= {@JoinColumn(name="r_id")},
			inverseJoinColumns= {@JoinColumn(name="p_id")}
			)
	public List<Power> getPower() {
		return power;
	}

	public void setPower(List<Power> power) {
		this.power = power;
	}

	

	
	
	
}
