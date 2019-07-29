package com.cn.edu.service;

import com.cn.edu.dao.ExamSubjectMiddleInfoDao;
import com.cn.edu.entity.ExamSubjectMiddleInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
  *
  * <p>Title: ExamSubjectMiddleInfoServiceImpl</p>
  * <p>Description: </p>
  */

@Service
public class ExamSubjectMiddleInfoService {

	@Autowired
	ExamSubjectMiddleInfoDao examSubjectMiddleInfoMapper;
	
	//查询试卷-试题信息
	public List<ExamSubjectMiddleInfo> getExamPaperWithSubject(
			ExamSubjectMiddleInfo esm) {
		return examSubjectMiddleInfoMapper.getExamPaperWithSubject(esm);
	}

	public int isAddESM(Map<String, Object> map) {
		return examSubjectMiddleInfoMapper.isAddESM(map);
	}

	public int removeSubjectWithExamPaper(Map<String, Object> map) {
		return examSubjectMiddleInfoMapper.removeSubjectWithExamPaper(map);
	}

	public Integer getEsmByExamIdWithSubjectId(ExamSubjectMiddleInfo esm) {
		return examSubjectMiddleInfoMapper.getEsmByExamIdWithSubjectId(esm);
	}

}
