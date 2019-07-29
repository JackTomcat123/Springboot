package com.cn.edu.service;

import com.cn.edu.dao.StudentExamInfoDao;
import com.cn.edu.entity.StudentExamInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
  *
  * <p>Title: StudentExamInfoServiceImpl</p>
  * <p>Description: </p>
  */

@Service
public class StudentExamInfoService {

	@Autowired
	private StudentExamInfoDao studentExamInfoMapper;
	
	public List<StudentExamInfo> getStudentExamCountByClassId(int classId) {
		return studentExamInfoMapper.getStudentExamCountByClassId(classId);
	}

	public List<StudentExamInfo> getStudentExamInfo(int studentId) {
		return studentExamInfoMapper.getStudentExamInfo(studentId);
	}

	public List<StudentExamInfo> getAllStudentAvgScoreCount(int classId) {
		return studentExamInfoMapper.getAllStudentAvgScoreCount(classId);
	}

}
