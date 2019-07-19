package com.cn.edu.service;

import com.cn.edu.dao.ClassInfoDao;
import com.cn.edu.entity.ClassInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
  *
  * <p>Title: ClassInfoServiceImpl</p>
  * <p>Description: 班级信息 Service 实现类</p>
  */
@Service
public class ClassInfoService{
	@Autowired
	private ClassInfoDao classInfoMapper;
	
	public List<Map<String,Object>> getAllClasses(){
		
		return classInfoMapper.getAllClass();
	}
	
	//获取班级集合
	public List<ClassInfo> getClasses(ClassInfo classInfo) {

		return classInfoMapper.getClasses(classInfo);
	}

	//添加班级
	public int isAddClass(ClassInfo classInfo) {

		return classInfoMapper.isAddClass(classInfo);
	}

	//删除班级
	public int isDelClass(int classId) {
		return classInfoMapper.isDelClass(classId);
	}

	public ClassInfo getClassById(int classId) {
		return classInfoMapper.getClassById(classId);
	}

	public int isUpdateClass(ClassInfo classInfo) {
		return classInfoMapper.isUpdateClass(classInfo);
	}

	//获取指定年级下的班级
	public List<ClassInfo> getClassByGradeId(int gradeId) {
		return classInfoMapper.getClassByGradeId(gradeId);
	}

	//获取各(指定年级下)班级下的学生总量
	public Map<String, Object> getStudentCountForClass(Integer gradeId) {
		return classInfoMapper.getStudentCountForClass(gradeId);
	}

	//根据当前班级班主任编号获取当前班级信息
	public ClassInfo getClassByTeacherId(int teacherId) {
		System.out.println(teacherId);
		return classInfoMapper.getClassByTeacherId(teacherId);
	}

}
