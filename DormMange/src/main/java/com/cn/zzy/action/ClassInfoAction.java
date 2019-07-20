package com.cn.zzy.action;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cn.zzy.entity.ClassInfo;
import com.cn.zzy.entity.Teacher;
import com.cn.zzy.service.ClassInfoService;
import com.cn.zzy.service.TeacherService;

@Controller
public class ClassInfoAction {
private List<ClassInfo> list;
private List<Teacher> t_list;
private ClassInfo entity=new ClassInfo();
@Autowired
private ClassInfoService svr;
@Autowired
private TeacherService t_svr;

public String toInsert() {
	t_list=t_svr.findAll();
	return "toInsert";
}
public String insert() {
	entity.setCreateDate(new Date());
	svr.save(entity);
	return "findAll";
}
public String delete() {
	svr.delete(entity);
	return "findAll";
}
public String update() {
	svr.update(entity);
	return "findAll";
}
public String toUpdate() {
	entity=svr.findOne(entity);
	t_list=t_svr.findAll();
	return "toUpdate";
}
public String tofindOne() {
	entity=svr.findOne(entity);
	t_list=t_svr.findAll();
	return "tofindOne";
}
public String findAll() {
	list=svr.findAll();
	return "list";
}
//get and set
public List<ClassInfo> getList() {
	return list;
}
public void setList(List<ClassInfo> list) {
	this.list = list;
}
public List<Teacher> getT_list() {
	return t_list;
}
public void setT_list(List<Teacher> t_list) {
	this.t_list = t_list;
}
public ClassInfo getEntity() {
	return entity;
}
public void setEntity(ClassInfo entity) {
	this.entity = entity;
}


}