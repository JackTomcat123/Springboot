package com.cn.edu.service;

import com.cn.edu.dao.TeacherInfoDao;
import com.cn.edu.entity.TeacherInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
  *
  * <p>Title: TeacherInfoServiceImpl</p>
  * <p>Description: </p>
  */

@Service
public class TeacherInfoService{

	@Autowired
	private TeacherInfoDao teacherInfoMapper;

	/*
	 * public List<TeacherInfo> getTeachers(TeacherInfo teacher) { return
	 * teacherInfoMapper.getTeachers(teacher); }
	 */

	public TeacherInfo getTeacherByAccount(String teacherAccount) {
		return teacherInfoMapper.getTeacherByAccount(teacherAccount);
	}

	public int updateTeacherIsWork(TeacherInfo teacherInfo) {
		return teacherInfoMapper.updateTeacherIsWork(teacherInfo);
	}

	public TeacherInfo getTeacherById(int teacherId) {
		return teacherInfoMapper.getTeacherById(teacherId);
	}

	public int isUpdateTeacherInfo(TeacherInfo teacher) {
		return teacherInfoMapper.isUpdateTeacherInfo(teacher);
	}

	public int isAddTeacherInfo(TeacherInfo teacher) {
		return teacherInfoMapper.isAddTeacherInfo(teacher);
	}

	public int isDelTeacherInfo(int teacherId) {
		return teacherInfoMapper.isDelTeacherInfo(teacherId);
	}

	public List<TeacherInfo> getTeachers(Map<String, Object> map) {
		return teacherInfoMapper.getTeachers(map);
	}

	public int getTeacherTotal() {
		return teacherInfoMapper.getTeacherTotal();
	}

}
