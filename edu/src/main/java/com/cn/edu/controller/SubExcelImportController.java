package com.cn.edu.controller;

import com.cn.edu.dao.SubjectInfoDao;
import com.cn.edu.entity.CourseInfo;
import com.cn.edu.entity.GradeInfo;
import com.cn.edu.entity.SubjectInfo;
import org.springframework.stereotype.Controller;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
@Controller
@RequestMapping("Sub")
public class SubExcelImportController {
    @Autowired
    SubjectInfoDao dao;
@RequestMapping("ExcelImport")
    @Transactional
    public String importAdd( MultipartFile file, SubjectInfo entity,int courseId,int gradeId){
        String fileName = file.getOriginalFilename();
    System.out.println(courseId);
    System.out.println(gradeId);
        if (!fileName.endsWith("xlsx")) {
            return "文件类型错误";
        }
        try {
            //读取Excel的内容
            Workbook workbook = new XSSFWorkbook(file.getInputStream());
            Sheet sheet;
            for (int k = 0; k < workbook.getNumberOfSheets(); k++) {//获取每个Sheet表
                sheet = workbook.getSheetAt(k);
                //获取总行数
                int rows = sheet.getLastRowNum() + 1;
                System.out.println(rows);
                if (rows == 0) {
                    return "文件无数据";
                }
                //从第2行开始遍历所有列的信息 并且封装成对象
                for (int i = 1; i < rows; i++) {
                    Row row = sheet.getRow(i);
                    //设置行第二列属性

                    if (null != row & (!row.getCell(0).getStringCellValue().isEmpty())) {
                        row.getCell(1).setCellType(HSSFCell.CELL_TYPE_STRING);
                        row.getCell(2).setCellType(HSSFCell.CELL_TYPE_STRING);
                        row.getCell(3).setCellType(HSSFCell.CELL_TYPE_STRING);
                        row.getCell(4).setCellType(HSSFCell.CELL_TYPE_STRING);
                        row.getCell(5).setCellType(HSSFCell.CELL_TYPE_STRING);
                        row.getCell(6).setCellType(HSSFCell.CELL_TYPE_STRING);
                        row.getCell(0).setCellType(HSSFCell.CELL_TYPE_STRING);
                      SubjectInfo sub=new SubjectInfo();
                        if (i == 1 && "15861404719".equals(row.getCell(1).getStringCellValue())) {
                            continue;
                        }
                        //获取行第一列的值
                        String subjectName = row.getCell(0).getStringCellValue();
                        //获取行第二列的值
                        String optionA = row.getCell(1).getStringCellValue();
                        //获取行第三列的值
                        String optionB = row.getCell(2).getStringCellValue();
                        //获取行第四列的值
                        String optionC = row.getCell(3).getStringCellValue();
                        //获取行第五列的值
                        String optionD = row.getCell(4).getStringCellValue();
                        //获取行第六列的值
                        String rightResult = row.getCell(5).getStringCellValue();
                        int subjectScore  = Integer.parseInt(row.getCell(6).getStringCellValue());
                          sub.setSubjectName(subjectName);
                          sub.setOptionA(optionA);
                          sub.setOptionB(optionB);
                          sub.setOptionC(optionC);
                          sub.setOptionD(optionD);
                          sub.setRightResult(rightResult);
                        CourseInfo c=new CourseInfo();
                        GradeInfo g=new GradeInfo();
                        c.setCourseId(courseId);
                        g.setGradeId(gradeId);
                        sub.setCourse(c);
                        sub.setGrade(g);
                        //添加用户信息
                      int add = dao.isAddSubject(sub);
                     if (add == 0) {
                           return "error";
                     }
                    }
                }
            }
            return "admin/success";
        } catch(IOException e){
            return "error";
        }
    }

}
