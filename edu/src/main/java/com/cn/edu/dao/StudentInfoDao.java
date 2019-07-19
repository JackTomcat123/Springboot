package com.cn.edu.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Select;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.stereotype.Repository;

import com.cn.edu.entity.*;

/**
  *
  * <p>Title: StudentInfoMapper</p>
  * <p>Description: </p>
  */
@Repository
public interface StudentInfoDao {

	public List<StudentInfo> getStudents(Map<String, Object> map);
	
	public StudentInfo getStudentById(int studentId);
	
	public int isUpdateStudent(StudentInfo student);
	
	public int isDelStudent(int studentId);
	
	public int isAddStudent(StudentInfo student);
	
	public int getStudentTotal();
	public StudentInfo getStudentByAccountAndPwd(String studentAccount);
	
	public int isResetPwdWithStu(StudentInfo studentInfo);
	
	public List<StudentInfo> getStudentsByClassId(int classId);
}
