package com.cn.zzy.dao;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.mybatis.spring.annotation.MapperScan;

import com.cn.zzy.entity.Emp;
import com.cn.zzy.util.Page;
@MapperScan
public interface EmpDao {
	@Insert("insert into emp (ename,deptid,img)values(#{ename},#{deptid},#{img})")
public void insert(Emp entity);
	@Delete("delete from emp where eid=#{eid}")
	public void delete(Emp entity);
	@Update("update emp set ename=#{ename},deptid=#{deptid},img=#{img} where eid=#{eid}")
	public void update(Emp entity);
	@Select("select * from emp where eid=#{eid}")
	public Emp findOne(Emp entity);
	@Select("select * from emp e left join dept d on e.deptid=d.deptid limit #{begin},#{pageSize}")
	public List<Map<String,Object>> findAll(Page page);
	@Select("select count(*) from emp e left join dept d on e.deptid=d.deptid")
	public int count();
	@Select("select * from emp e left join dept d on e.deptid=d.deptid where e.deptid=#{deptid}")
	public List<Map<String,Object>> findEmpbyDept(Emp entity);
}
