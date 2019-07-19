package com.cn.zzy.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cn.zzy.dao.EmpDao;
import com.cn.zzy.entity.Emp;
import com.cn.zzy.util.Page;

@Service
public class EmpService {
@Autowired
EmpDao dao;
public void insert(Emp entity) {
	dao.insert(entity);
}
public void delete(Emp entity) {
	dao.delete(entity);
}
public void update(Emp entity) {
	dao.update(entity);
}
public Emp toUpdate(Emp entity) {
	
	return dao.findOne(entity);
}
public List<Map<String,Object>> findAll(Page page){
	return dao.findAll(page);
	
}
public int count() {
	return dao.count();
}
public List<Map<String,Object>> findEmpbyDept(Emp entity){

	return dao.findEmpbyDept(entity);
}
}
