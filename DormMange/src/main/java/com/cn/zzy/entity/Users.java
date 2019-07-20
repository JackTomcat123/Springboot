package com.cn.zzy.entity;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
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

import com.cn.util.Sort;

@Entity
@Table
public class Users {
private int u_id;
private String u_name;
private String u_pass;
private  int u_num;
private String u_rename;
private String u_type;
private String u_role;
private List<Role>role=new ArrayList<Role>();
private List<Teacher> teacher=new ArrayList<Teacher>();
private List<Student>student=new ArrayList<Student>();
@Id
@GeneratedValue(strategy=GenerationType.IDENTITY)
@Column
public int getU_id() {
	return u_id;
}
public void setU_id(int u_id) {
	this.u_id = u_id;
}
@Column
public String getU_name() {
	return u_name;
}
public void setU_name(String u_name) {
	this.u_name = u_name;
}
@Column
public String getU_pass() {
	return u_pass;
}
public void setU_pass(String u_pass) {
	this.u_pass = u_pass;
}
@Column
public int getU_num() {
	return u_num;
}
public void setU_num(int u_num) {
	this.u_num = u_num;
}
@Column
public String getU_rename() {
	return u_rename;
}
public void setU_rename(String u_rename) {
	this.u_rename = u_rename;
}
@Column
public String getU_type() {
	return u_type;
}
public void setU_type(String u_type) {
	this.u_type = u_type;
}
@Column
public String getU_role() {
	return u_role;
}
public void setU_role(String u_role) {
	this.u_role = u_role;
}
@ManyToMany(targetEntity=Role.class,cascade=CascadeType.MERGE,fetch=FetchType.EAGER)
@JoinTable(
		name="users_role",
		joinColumns= {@JoinColumn(name="u_id")},
		inverseJoinColumns= {@JoinColumn(name="r_id")}
		)
public List<Role> getRole() {
	Collections.sort(role, new Sort());
	return role;
}
public void setRole(List<Role> role) {
	this.role = role;
}
@ManyToMany(targetEntity=Teacher.class,cascade=CascadeType.MERGE)
@JoinTable(
		name="users_teacher",
		joinColumns= {@JoinColumn(name="u_id")},
		inverseJoinColumns= {@JoinColumn(name="teachId")}
		)
public List<Teacher> getTeacher() {
	return teacher;
}
public void setTeacher(List<Teacher> teacher) {
	this.teacher = teacher;
}
@ManyToMany(cascade=CascadeType.MERGE,targetEntity=Student.class)
@JoinTable(
		name="users_student",
		joinColumns= {@JoinColumn(name="u_id")},
		inverseJoinColumns= {@JoinColumn(name="stuId")}
		)
public List<Student> getStudent() {
	return student;
}
public void setStudent(List<Student> student) {
	this.student = student;
}


}
