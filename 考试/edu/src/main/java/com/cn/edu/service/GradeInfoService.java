package com.cn.edu.service;

import com.cn.edu.dao.GradeInfoDao;
import com.cn.edu.entity.GradeInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
  *
  * <p>Title: GradeInfoServiceImpl</p>
  * <p>Description: </p>
  */

@Service
public class GradeInfoService{

	@Autowired
	private GradeInfoDao gradeInfoMapper;
	
	public List<GradeInfo> getGrades() {
		return gradeInfoMapper.getGrades();
	}

	public int isAddGrade(GradeInfo grade) {
		return gradeInfoMapper.isAddGrade(grade);
	}

	public int isDelGrade(int gradeId) {
		return gradeInfoMapper.isDelGrade(gradeId);
	}

	public int isUpdateGrade(GradeInfo grade) {
		return gradeInfoMapper.isUpdateGrade(grade);
	}

	public GradeInfo getGradeById(int gradeId) {
		return gradeInfoMapper.getGradeById(gradeId);
	}

}
