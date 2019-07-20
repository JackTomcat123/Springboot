package com.cn.zzy.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cn.zzy.entity.Building;
import com.cn.zzy.service.BuildingService;



@Controller
public class BuildingAction
{
	 @Autowired
     BuildingService svr;
	 
	 List<Building> list;
	 Building entity=new Building();
	 
	 
	 public String save() {
		 svr.save(entity);
		 return "findAll";
	 }
	 
	 public String update() {
		 svr.update(entity);
		 System.out.println(entity.getBuildname());
		 return "findAll";
	 }
	 
	 public String delete() {
		 svr.delete(entity);
		 return "findAll";
	 }
	 
	 public String toUpdate() {
		 entity=svr.findOne(entity);
		 return "update";
	 }
	 
	 public String findAll() {
		 list=svr.findAll();
		 return "list";
	 }

	public List<Building> getList()
	{
		return list;
	}

	public void setList(List<Building> list)
	{
		this.list = list;
	}

	public Building getEntity()
	{
		return entity;
	}

	public void setEntity(Building entity)
	{
		this.entity = entity;
	}
}
