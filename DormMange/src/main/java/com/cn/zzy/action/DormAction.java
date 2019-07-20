package com.cn.zzy.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;

import com.cn.zzy.entity.Building;
import com.cn.zzy.entity.Dorm;
import com.cn.zzy.entity.DormType;
import com.cn.zzy.service.BuildingService;
import com.cn.zzy.service.DormService;
import com.cn.zzy.service.DormTypeService;

@Controller
public class DormAction {
private List<Dorm>list;
private List<Building> b_List;
private List<DormType> t_list;
private Dorm entity=new Dorm();
@Autowired
private DormService svr;
@Autowired
private DormTypeService t_svr;
@Autowired
private BuildingService b_svr;
public String toInsert() {
	t_list=t_svr.findAll();
	b_List=b_svr.findAll();
	return "toInsert";
}
public String insert() {
	
	svr.save(entity);
	return "findAll";
}
public String delete() {
	svr.delete(entity);
	return "findAll";
}
public String update() {
//	System.out.println(entity.getBuild().getBuildid());
	svr.update(entity);
	return "findAll";
}
public String toUpdate() {
	entity=svr.findOne(entity);
	t_list=t_svr.findAll();
	b_List=b_svr.findAll();
	return "toUpdate";
}
public String findAll() {
	list=svr.findAll();
	return "list";
}
//get and set
public List<Dorm> getList() {
	return list;
}
public void setList(List<Dorm> list) {
	this.list = list;
}
public List<Building> getB_List() {
	return b_List;
}
public void setB_List(List<Building> b_List) {
	this.b_List = b_List;
}
public List<DormType> getT_list() {
	return t_list;
}
public void setT_list(List<DormType> t_list) {
	this.t_list = t_list;
}
public Dorm getEntity() {
	return entity;
}
public void setEntity(Dorm entity) {
	this.entity = entity;
}

}
