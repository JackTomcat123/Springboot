package com.cn.zzy.controller;

import com.cn.zzy.dao.DeptDao;
import com.cn.zzy.entity.Dept;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Random;

@Controller
public class TestController {

    @Autowired
    DeptDao dao;
    @RequestMapping("add")
    public String add(){
        Dept entity=new Dept();

        for(int i=0;i<=100;i++){

            String s1="河南"+i;
            String s2="政治部"+i;
            entity.setDname(s2);
            entity.setLoc(s1);
           dao.add(entity);


        }


        return "success";
    }
    @RequestMapping("dinsert")
    @Transactional
    public String importAdd(Integer enterpriseId, MultipartFile file){
        String fileName = file.getOriginalFilename();
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
                if (rows == 0) {
                    return "文件无数据";
                }
                //从第2行开始遍历所有列的信息 并且封装成对象
                for (int i = 1; i < rows; i++) {
                    Row row = sheet.getRow(i);
                    //设置行第二列属性

                    if (null != row & (!row.getCell(0).getStringCellValue().isEmpty())) {
                        row.getCell(1).setCellType(HSSFCell.CELL_TYPE_STRING);
                      Dept entity=new Dept();
                        if (i == 1 && "15861404719".equals(row.getCell(1).getStringCellValue())) {
                            continue;
                        }
                        //获取行第一列的值
                        String dname = row.getCell(0).getStringCellValue();
                        //获取行第二列的值
                        String loc = row.getCell(1).getStringCellValue();
                       entity.setDname(dname);
                       entity.setLoc(loc);
                        dao.add(entity);
                        if (entity ==null) {
                            return "导入失败";
                        }
                    }
                }
            }
            return "success";
        } catch(IOException e){
            return "导入失败";
        }
    }


}
