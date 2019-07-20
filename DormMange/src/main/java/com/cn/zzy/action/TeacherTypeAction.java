package com.cn.zzy.action;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cn.zzy.entity.TeacherType;
import com.cn.zzy.service.TeacherTypeService;


@Controller
public class TeacherTypeAction
{
	 @Autowired
     TeacherTypeService svr;
	 
	 List<TeacherType> list;
	 TeacherType entity=new TeacherType();
	 
	 
	 public String save() {
		 svr.save(entity);
		 return "findAll";
	 }
	 
	 public String update() {
		 svr.update(entity);
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

	public List<TeacherType> getList()
	{
		return list;
	}

	public void setList(List<TeacherType> list)
	{
		this.list = list;
	}

	public TeacherType getEntity()
	{
		return entity;
	}

	public void setEntity(TeacherType entity)
	{
		this.entity = entity;
	}
	 
	 
}
