package com.cn.edu.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.cn.edu.entity.*;

/**
  *
  * <p>Title: CourseInfoMapper</p>
  * <p>Description: </p>

  */

@Repository
public interface CourseInfoDao {

	public List<CourseInfo> getCourses(CourseInfo course);
	
	public int isUpdateCourse(CourseInfo course);

	public int isAddCourse(CourseInfo course);
	
	public int isDelCourse(int courseId);
	
	public CourseInfo getCourseById(int courseId);
}
