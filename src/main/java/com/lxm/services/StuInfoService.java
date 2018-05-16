package com.lxm.services;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lxm.dao.StuInfoMapper;
import com.lxm.dao.StuSelectedMapper;
import com.lxm.dao.SyscodeMapper;
import com.lxm.pojo.StuInfo;
import com.lxm.pojo.StuSelected;
import com.lxm.tools.Tools;

@Service
public class StuInfoService {

	@Autowired
	StuInfoMapper stuInfoMapper;
	@Autowired
	StuSelectedMapper stuSelectedMapper;
	@Autowired
	SyscodeMapper syscodeMapper;
	private final static String xls = "xls";
	private final static String xlsx = "xlsx";
	
	public Map<String,Object> login(Map<String,String> stuinfo) {
		Map<String,Object> map = new HashMap();
		map.put("role", "2");
		StuInfo info = null;
		try {
			//在测试阶段提供的密码显示功能，正常发布可以删除
			System.out.println(Tools.getMD5String(stuinfo.get("pass")));
			stuinfo.put("pass",Tools.getMD5String(stuinfo.get("pass")));
			
			info = this.stuInfoMapper.stuLogin(stuinfo);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(info != null) {
			info.setStuPwd("");
			map.put("msg", "stusuccess");
			map.put("info", info);
			
		}else {
			map.put("msg", "stuerror");
		}
		return map;
	}
	/**
	 * 查询用户输入的信息是否存在
	 * @param stuInfo
	 * @return
	 */
	public Map<String,Object> getOne(StuInfo stuInfo){
		Map<String,Object> map = new HashMap();
		List<StuInfo> list = this.stuInfoMapper.stuGetOne(stuInfo);
		if(list != null&&list.size()==1) {
			map.put("msg", "success");
			map.put("stuId", list.get(0).getStuId());
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}

	/***
	 * 更新用户和密码
	 * @param map
	 * @return
	 */
	public Map<String,Object> updatePwd(Map<String,Object> map){

		if(map!=null&&map.get("pwd").toString().equals(map.get("rePwd").toString())) {
			try {
				map.put("rePwd", Tools.getMD5String(map.get("rePwd").toString()));
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int n = this.stuInfoMapper.updatePwd(map); 
		if(n==1) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		return map;
	}
	/**
	 * 查询账号是否存在
	 * @param stuInfo
	 * @return
	 */
	public Map<String, Object> getAccount(StuInfo stuInfo) {
		Map<String,Object>map = new HashMap();
		StuInfo info =  this.stuInfoMapper.getAccount(stuInfo);
		if(info!=null) {
			map.put("msg", "error");
			
		}else {
			map.put("msg", "success");

		}
		return map;
	}
	
	/**
	 * 检测学号是否存在
	 * @return
	 */
	public Map<String,Object> searchCandidate(StuInfo stuInfo){
		Map<String,Object> map= new HashMap();
		StuInfo info = this.stuInfoMapper.getCandidate(stuInfo);
		if(info != null) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		return map;
		
	}
	
	/**
	 * 用户注册
	 * @param stuInfo
	 * @return
	 */
	public Map<String,Object> register(StuInfo stuInfo){
		Map<String,Object> map= new HashMap();
		if(stuInfo!=null) {
			try {
				stuInfo.setStuPwd(Tools.getMD5String(stuInfo.getStuPwd()));
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		int num = this.stuInfoMapper.register(stuInfo);
		if(num==1) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}
	/***
	 * 第一次进入系统后进行更新个人信息
	 * @param map
	 * @return
	 */
	public Map<String,String> fistUpdate(Map<String,String[]> map){
		Map<String,String> data  = new HashMap();
		Set<String> set = map.keySet();
		for(String str:set) {
			data.put(str,map.get(str)[0]);
		}
		int num = this.stuInfoMapper.firstUpdate(data);
		if(num==1) {
			data.put("msg", "success");
		}else {
			data.put("msg", "error");
		}
		return data;
	}
	@Transactional
	public Map<String, String> updateStuMangerId(StuInfo stuInfo) {
		int num = this.stuInfoMapper.updateStuMangerId(stuInfo);
		StuSelected select = new StuSelected();
		select.setChooseDate(new Date());
		select.setChooseType("1");
		select.setManagerId(stuInfo.getManagerId());
		select.setStuId(stuInfo.getStuId());
		
		int num2 = this.stuSelectedMapper.insert(select);
		Map<String,String> map = new HashMap<>();
		if(num==1&&num2==1) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		return map;
	}
	/**
	 * 根据当前页面的id 查询该学生信息
	 * @return
	 */
	public Map<String, Object> selectStuInfo(StuInfo stuInfo) {
		Map<String,Object> map = new HashMap<>();
		StuInfo info = this.stuInfoMapper.selectStuInfo(stuInfo);
		if(info != null) {
			map.put("info", info);
			map.put("msg", "success");
		}else
		{
			map.put("msg", "error");
		}
		
		return map;
	}
	
	/**
	 * 解析excel 并插入数据库
	 * 
	 * @param file
	 * @return
	 */
	@Transactional
	public Map<String, Object> addRecord(MultipartFile file) {
		Map<String,Object> map = new HashMap<>();
	
		
		if(file==null) {
			map.put("msg", "error");
			return map;
		}else
		{
		String fileName=file.getOriginalFilename();
    	
        //创建Workbook工作薄对象，表示整个excel
        Workbook workbook = null;
        try {
            //获取excel文件的io流
            InputStream is = file.getInputStream();
            //根据文件后缀名不同(xls和xlsx)获得不同的Workbook实现类对象
            if(fileName.endsWith(xls)){
                //2003
                workbook = new HSSFWorkbook(is);
            }else if(fileName.endsWith(xlsx)){
                //2007 及2007以上
                workbook =  new XSSFWorkbook(is);
            }
        } catch (IOException e) {
           e.printStackTrace();
        }
       //创建返回对象，把每行中的值作为一个数组，所有行作为一个集合返回
       List<String[]> list = new ArrayList<String[]>();
       if(workbook != null){
           for(int sheetNum = 0;sheetNum < workbook.getNumberOfSheets();sheetNum++){
               //获得当前sheet工作表
               Sheet sheet = workbook.getSheetAt(sheetNum);
               if(sheet == null){
                   continue;
               }
               //获得当前sheet的开始行
               int firstRowNum  = sheet.getFirstRowNum();
               //获得当前sheet的结束行
               int lastRowNum = sheet.getLastRowNum();
               //循环除了第一行的所有行
               for(int rowNum = firstRowNum+1;rowNum <= lastRowNum;rowNum++){
                   //获得当前行
                   Row row = sheet.getRow(rowNum);
                   if(row == null){
                       continue;
                   }
                   //获得当前行的开始列
                   int firstCellNum = row.getFirstCellNum();
                   //获得当前行的列数
                   int lastCellNum = row.getPhysicalNumberOfCells();
                   String[] cells = new String[row.getPhysicalNumberOfCells()];
                   //循环当前行
                   for(int cellNum = firstCellNum; cellNum < lastCellNum;cellNum++){
                       Cell cell = row.getCell(cellNum);
                       cells[cellNum] = getCellValue(cell);
                   }
                   list.add(cells);
               }
           }
          // workbook.close();
       }
       //return list;
       map.put("msg", "success");
       List<StuInfo> info = new ArrayList<>();
     if(list!=null) {
    	 for(String temp[]:list) {
    		 StuInfo stuInfo = new StuInfo();
    		 for(int i = 0;i<temp.length;i++) {
    			 stuInfo.setStuCandidate(temp[0]);
    			 stuInfo.setStuName(temp[1]);
    			 stuInfo.setStuSpecialtycode(temp[2]);
    			 stuInfo.setStuMajorname(temp[3]);
    			 stuInfo.setStuPolotics(new BigDecimal(temp[4]));
    			 stuInfo.setStuEnglish(new BigDecimal(temp[5]));
    			 stuInfo.setStuSub1(new BigDecimal(temp[6]));
    			 stuInfo.setStuSub2(new BigDecimal(temp[7]));
    			 stuInfo.setStuTotalscore1(new BigDecimal(temp[8]));
    			 stuInfo.setStuSex(temp[9]);
    			 stuInfo.setStuMajorcondition(temp[10]);
    			 stuInfo.setStuGraduationschool(temp[11]);
    			 stuInfo.setStuGraduationmajor(temp[12]);
    			 stuInfo.setStuGraduationtime(temp[13]);
    			 stuInfo.setStuState("1");
    			// stuInfo.setStuStudytype(temp[10].substring(1, temp[10].indexOf(")")));
    			 stuInfo.setStuStudytype("全日制");
    			 stuInfo.setStuMastertype((temp[2].equals("085212")||temp[2].equals("085211"))?"专硕":"学硕");
    		 }
    		info.add(stuInfo);
    	 }
     }
     int num = this.stuInfoMapper.addBatch(info);
     map.put("num", num);
       return map;
		}
	}
	
	  public static String getCellValue(Cell cell){
	        String cellValue = "";
	        if(cell == null){
	            return cellValue;
	        }
	        //把数字当成String来读，避免出现1读成1.0的情况
	        if(cell.getCellType() == Cell.CELL_TYPE_NUMERIC){
	            cell.setCellType(Cell.CELL_TYPE_STRING);
	        }
	        //判断数据的类型
	        switch (cell.getCellType()){
	            case Cell.CELL_TYPE_NUMERIC: //数字
	                cellValue = String.valueOf(cell.getNumericCellValue());
	                break;
	            case Cell.CELL_TYPE_STRING: //字符串
	                cellValue = String.valueOf(cell.getStringCellValue());
	                break;
	            case Cell.CELL_TYPE_BOOLEAN: //Boolean
	                cellValue = String.valueOf(cell.getBooleanCellValue());
	                break;
	            case Cell.CELL_TYPE_FORMULA: //公式
	                cellValue = String.valueOf(cell.getCellFormula());
	                break;
	            case Cell.CELL_TYPE_BLANK: //空值
	                cellValue = "";
	                break;
	            case Cell.CELL_TYPE_ERROR: //故障
	                cellValue = "非法字符";
	                break;
	            default:
	                cellValue = "未知类型";
	                break;
	        }
	        return cellValue;
	    }
	public Map<String, Object> selectAll() {
		Map<String,Object> map = new HashMap<>();
		
		List<StuInfo> list = this.stuInfoMapper.selectAll();
		if(list != null) {
			map.put("msg", "success");
			map.put("info", list);
		}else {
			map.put("msg", "error");
		}
		return map;
	}
	public Map<String, Object> searchAllStuByExample(String stuName,String stuTel) {
		Map<String,Object> map = new HashMap<>();
		StuInfo info = new StuInfo();
		info.setStuName(stuName);
		info.setStuTel(stuTel);
		List<StuInfo> list = this.stuInfoMapper.selectAllStuByExample(info);
		if(list!=null) {
			map.put("msg", "success");
			map.put("info", list);
		}else {
			map.put("msg", "error");
		}
		return map;
	}
	
	
	public Map<String, Object> deleteOneStu(StuInfo stuInfo) {
		int n = this.stuInfoMapper.updateState(stuInfo.getStuId());
		Map<String,Object> map = new HashMap<>();
		if(n>0) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}
	public Map<String, Object> updateStuInfoByTea(StuInfo stuInfo) {
		int num = this.stuInfoMapper.updateStuInfoByTea(stuInfo);
		Map<String,Object> map = new HashMap<>();
		if(num>0) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}
	public Map<String, Object> addOneByTea(StuInfo stuInfo) {
		Map<String,Object> map = new HashMap<>();
		int n = this.stuInfoMapper.addOneByTea(stuInfo);
		if(n>0) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		return map;
	}
	public Map<String, Object> deleteAllStu() {
		int n = this.stuInfoMapper.deleteAllStu();
		Map<String,Object> map = new HashMap<>();
		if(n>0) {
			map.put("msg", "success");
		}else
		{
			map.put("msg", "error");
		}
		
		return map;
	}
	public Map<String, Object> selectAllByTea() {
	Map<String,Object> map = new HashMap<>();
		
		List<StuInfo> list = this.stuInfoMapper.selectAllByTea();
		if(list != null) {
			map.put("msg", "success");
			map.put("info", list);
		}else {
			map.put("msg", "error");
		}
		return map;
	}
	public Map<String, Object> addOneGroup(Map<String, Object> map) {
		String group = "9"+map.get("group").toString();
		String str = map.get("id").toString();
		String[] idArr = str.split(",");
		Map<String,Object> stu = new HashMap<>();
		stu.put("stuState", group);
		stu.put("stuId", idArr);
		int n = this.stuInfoMapper.addOneGroup(stu);
		if(n>0) {
			stu.put("msg", "success");
		}else {
			stu.put("msg", "error");
		}
		
		return stu;
	}
	public Map<String, Object> showAllGroup() {
		List<Map<String,Object>> info =  this.stuInfoMapper.showAllGroup();
		Map<String,Object> map = new HashMap<>();
		if(info != null && info.size()!=0) {
			map.put("msg", "success");
			map.put("info", info);
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}
	public Map<String, Object> searchStuAndTea(Map<String,Object> param) {
		Map<String,Object> map = new HashMap<>();
		StuInfo stuInfo = new StuInfo();
		stuInfo.setStuCandidate(param.get("stuCandidate").toString());
		stuInfo.setStuName(param.get("stuName").toString());
		System.out.println(stuInfo);
		List<Map<String,Object>> info = this.stuInfoMapper.searchStuAndTea(stuInfo);
		if(info != null) {
			map.put("info", info);
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}
	public Map<String, Object> emptyTeaId(StuInfo stuInfo) {
		Map<String,Object> map = new HashMap<>();
		int n = this.stuInfoMapper.emptyTeaId(stuInfo);
		if(n>0) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}
	public Map<String, Object> addReTestScore(StuInfo stuInfo) {
		Map<String,Object> map = new HashMap<>();
		
		int n = this.stuInfoMapper.addReTestScore(stuInfo);
		if(n>0) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}
	public Map<String, Object> searchStuAndScore(Map<String,Object> param) {
		Map<String,Object> map = new HashMap<>();
		StuInfo stuInfo = new StuInfo();
		stuInfo.setStuCandidate(param.get("stuCandidate").toString());
		stuInfo.setStuName(param.get("stuName").toString());
		List<StuInfo> info = this.stuInfoMapper.searchStuAndScore(stuInfo);
		if(info != null) {
			map.put("msg", "success");
			map.put("info", info);
		}else {
			map.put("msg", "error");
		}
		return map;
	}
	public Map<String, Object> showAllScore() {
		Map<String,Object> map = new HashMap<>();
		List<Map<String,Object>> list = this.stuInfoMapper.showAllScore();
		List<Map<String,Object>> list2 = this.syscodeMapper.selectPercent();
		if(list!=null &&list2!=null) {
			map.put("msg", "success");
			map.put("info", list);
			map.put("info2", list2);
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}
	public Map<String, Object> cancleSelect(StuInfo stuInfo) {
		Map<String,Object> info = new  HashMap<>();
		int n = this.stuInfoMapper.cancleSelect(stuInfo);
		if(n>0) {
			info.put("msg", "success");
		}else {
			info.put("msg", "error");
		}
		
		return info;
	}
	public Map<String, Object> updateStuState(StuInfo stuInfo) {
		Map<String,Object> map = new HashMap<>();
		int n = this.stuInfoMapper.updateStuState(stuInfo);
		if(n>0) {
			map.put("msg", "success");
			
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}
	public Map<String, Object> checkStuState(StuInfo stuInfo) {
		Map<String,Object> map = new HashMap<>();
		StuInfo info = this.stuInfoMapper.checkStuState(stuInfo);
		if(info != null) {
			map.put("info", info);
		}
		return map;
	}
	
}
