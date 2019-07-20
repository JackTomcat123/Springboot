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
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table
public class Power {
private int p_id;
private String p_name;
private String p_url;
private int  p_mgr=0;
private List<Role> role=new ArrayList<Role>();
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column
public int getP_id() {
	return p_id;
}
public void setP_id(int p_id) {
	this.p_id = p_id;
}
@Column
public String getP_name() {
	return p_name;
}
public void setP_name(String p_name) {
	this.p_name = p_name;
}
@Column
public String getP_url() {
	return p_url;
}
public void setP_url(String p_url) {
	this.p_url = p_url;
}
@Column
public int getP_mgr() {
	return p_mgr;
}
public void setP_mgr(int p_mgr) {
	this.p_mgr = p_mgr;
}
@ManyToMany(mappedBy="power",cascade=CascadeType.MERGE,fetch=FetchType.EAGER,targetEntity=Role.class)
public List<Role> getRole() {
	return role;
}
public void setRole(List<Role> role) {
	this.role = role;
}

}
