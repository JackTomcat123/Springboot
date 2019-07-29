package com.cn.edu.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.cn.edu.entity.*;

/**
  *
  * <p>Title: ExamPaperInfoMapper</p>
  * <p>Description: </p>
  */

@Repository
public interface ExamPaperInfoDao {

	public List<ExamPaperInfo> getExamPapers(Map<String, Object> map);
	
	public ExamPaperInfo getExamPaperById(int examPaperId);

	public List<ExamPaperInfo> getExamPapersClear();
	
	public int isAddExamPaper(ExamPaperInfo examPaper);
	
	public int isUpdateExamPaper(ExamPaperInfo examPaper);
	
	public int isDelExamPaper(int examPaperId);
	
	public int getExamPpaerTotal();
	
	public int isUpdateExamPaperSubjects(Map<String, Object> map);
	
	public int isUpdateExamPaperScore(Map<String, Object> map);
}
