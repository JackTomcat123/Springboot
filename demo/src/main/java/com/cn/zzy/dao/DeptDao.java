package com.cn.zzy.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;

import com.cn.zzy.entity.Dept;

@MapperScan
public interface DeptDao {
@Select("select * from dept")
public List<Dept> findAll();
@Insert("insert into dept (dname,loc) values(#{dname},#{loc})")
    public void add(Dept entity);
}
