package com.lxm.controller;

import java.io.IOException;
import java.io.InputStream;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.lxm.pojo.ManagerInfo;
import com.lxm.services.ManagerInfoService;
import com.lxm.services.StuInfoService;

@Controller
public class UploadFile {

	@Autowired
	StuInfoService stuInfoService;
	@Autowired
	ManagerInfoService managerInfoService;
	
	/**
	 * 上传学生信息
	 * @param file
	 * @return
	 * @throws IllegalStateException
	 * @throws IOException
	 */
    @RequestMapping("/upload2")
    @ResponseBody
    public Map<String,Object>  upload2(MultipartFile file){
    	
    	
    	return this.stuInfoService.addRecord(file);
		
     }
    /**
     * 上传教师信息
     * @param file
     * @return
     * @throws NoSuchAlgorithmException 
     */
    @RequestMapping("/upload3")
    @ResponseBody
    public Map<String,Object> upload3(MultipartFile file) throws NoSuchAlgorithmException{
    	return this.managerInfoService.addManagerRecord(file);
    }
    
    	
}
    
    
    
	

