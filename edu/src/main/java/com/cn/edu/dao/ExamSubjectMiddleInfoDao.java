package com.cn.edu.dao;

import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Repository;

import com.cn.edu.entity.*;

/**
  *
  * <p>Title: ExamSubjectMiddleInfoMapper</p>
  * <p>Description: </p>
  */

@Repository
public interface ExamSubjectMiddleInfoDao {

	public List<ExamSubjectMiddleInfo> getExamPaperWithSubject(ExamSubjectMiddleInfo esm);
	
	public int isAddESM(Map<String, Object> map);
	
	public int removeSubjectWithExamPaper(Map<String, Object> map);
	
	public Integer getEsmByExamIdWithSubjectId(ExamSubjectMiddleInfo esm);
}
