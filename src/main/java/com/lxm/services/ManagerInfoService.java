package com.lxm.services;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.lxm.dao.ManagerInfoMapper;
import com.lxm.pojo.ManagerInfo;
import com.lxm.pojo.StuInfo;
import com.lxm.tools.Tools;

@Service
public class ManagerInfoService {
	@Autowired
	ManagerInfoMapper managerInfoMapper;
	
	private final static String xls = "xls";
	private final static String xlsx = "xlsx";
	
	public Map<String,Object> login(Map<String,String> args){
		Map<String,Object> map = new HashMap<>();
		
		try {
			
			System.out.println("pass=================================="+Tools.getMD5String(args.get("pass")));
			args.put("pass", Tools.getMD5String(args.get("pass")));
			ManagerInfo managerInfo = this.managerInfoMapper.getOne(args);
			map.put("role", "1");
			if(managerInfo != null) {
				map.put("msg", "managersuccess");
				map.put("info", managerInfo);
			}else {
				map.put("msg", "managererror");
			}
			
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return map;
	}



	public List<ManagerInfo> selectByCon(ManagerInfo info) {
		
		return this.managerInfoMapper.selectByCon(info);
	}



	public Map<String, String> searchDetail(Long stuId) {
		return this.managerInfoMapper.searchDetail(stuId);
	}



	@Transactional
	public Map<String, Object> updateTeachInfoFir(ManagerInfo managerInfo) throws NoSuchAlgorithmException {
		if(!managerInfo.getManagerPwd().equals("")) {
			managerInfo.setManagerPwd(Tools.getMD5String(managerInfo.getManagerPwd()));
		}
		int n = this.managerInfoMapper.updateTeachInfoFir(managerInfo);
		
		Map<String,Object> map = new HashMap<>();
		if(n==1) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		return map;
	}

		
		/**
		 * 查询已选择教师的学生
		 * @param managerInfo
		 * @return
		 */
	public Map<String, Object> searchSelect(ManagerInfo managerInfo) {
		Map<String,Object> map = new HashMap<>();
		
		List list = this.managerInfoMapper.searchSelect(managerInfo);
		String num=this.managerInfoMapper.selectedNum(managerInfo);
		num = num==null?"0":num;
		if(list != null) {
			map.put("msg", "success");
			map.put("info", list);
			map.put("num", num);
		}else {
			map.put("msg", "error");
			map.put("num", num);
		}
		
		return map;
	}



		public Map<String, Object> searchSelectByExample(Map<String,Object> managerInfo) {
			Map<String,Object> map = new HashMap<>();
			ManagerInfo info = new ManagerInfo();
			info.setManagerId(new BigDecimal((String)managerInfo.get("managerId")));
			String num=this.managerInfoMapper.selectedNum(info);
			num = num==null?"0":num;
			List<Map<String,Object>> list = this.managerInfoMapper.searchSelectByExample(managerInfo);
			if(list != null) {
				map.put("msg", "success");
				map.put("info", list);
				map.put("num", num);
			}else {
				map.put("msg", "error");
				map.put("num", num);
			}
			
			return map;
		}


		
		public Map<String, Object> addManagerRecord(MultipartFile file) throws NoSuchAlgorithmException {
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
	       List<ManagerInfo> info = new ArrayList<>();
	       if(list!=null) {
	      	 for(String temp[]:list) {
	      		ManagerInfo managerInfo = new ManagerInfo(); 
	      		 for(int i = 0;i<temp.length;i++) {
	      			managerInfo.setManagerAccount(temp[0]);
	      			managerInfo.setManagerName(temp[1]);
	      			managerInfo.setManagerSex(temp[2]);
	      			managerInfo.setManagerTitle(temp[3]);
	      			managerInfo.setManagerCond(temp[4]);
	      			managerInfo.setManagerRatednum(temp[5]);
	      			managerInfo.setManagerMentortype(temp[6]);
	      			managerInfo.setManagerMajor(temp[7]);
	      			managerInfo.setManagerPwd(Tools.getMD5String(temp[0]));
	      		 }
	      		info.add(managerInfo);
	      	 }
	       }
	       int num = this.managerInfoMapper.addBatch(info);
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



	public Map<String, Object> searchAllTea() {
		Map<String,Object> map = new HashMap<>();
		List<ManagerInfo> list = this.managerInfoMapper.searchAllTea();
		if(list != null && list.size()!=0) {
			map.put("msg", "success");
			map.put("info", list);
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}



	public Map<String, Object> selectManager(BigDecimal managerId) {
		Map<String,Object> map = new HashMap<>();
		ManagerInfo info = this.managerInfoMapper.selectManager(managerId);
		if(info != null) {
			map.put("msg", "success");
			map.put("info", info);
		}else {
			map.put("msg", "error");
		}
		return map;
		
	}



	public Map<String, Object> updateTeaInfoSecond(ManagerInfo managerInfo) {
		int num = this.managerInfoMapper.updateTeaInfoSecond(managerInfo);
		Map<String,Object> map  =new HashMap();
		if(num>0) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		return map;
	}



	public Map<String, Object> assignDuty(String type,String id) {
		Map<String,Object> map = new HashMap<>();
		ManagerInfo managerInfo = new ManagerInfo();
		managerInfo.setManagerType(type);
		managerInfo.setManagerId(new BigDecimal(id));
		int n = this.managerInfoMapper.assignDuty(managerInfo);
		if(n>0) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}



	public Map<String, Object> getType(ManagerInfo managerInfo) {
		Map<String,Object> map  = new HashMap<>();
		ManagerInfo info = this.managerInfoMapper.selectByPrimaryKey(managerInfo.getManagerId());
		if(info!=null) {
			map.put("msg", "success");
			map.put("info", info);
		}else {
			map.put("msg", "error");
		}
		return map;
	}



	public Map<String, Object> serachTeaByCon2(ManagerInfo managerInfo) {
		Map<String,Object> map = new  HashMap<>();
		List<ManagerInfo> list = this.managerInfoMapper.selectByCon(managerInfo);
		if(list != null && list.size()!=0) {
			map.put("msg", "success");
			map.put("info", list);
		}else {
			map.put("msg", "error");
		}
		return map;
	}



	public Map<String, Object> deleteOneTea(ManagerInfo managerInfo) {
		Map<String,Object> info = new HashMap<>();
		int n = this.managerInfoMapper.deleteOneTea(managerInfo);
		if(n>0) {
			info.put("msg", "success");
		}else {
			info.put("msg", "error");
		}
		return info;
	}



	public Map<String, Object> addOneTea(ManagerInfo managerInfo) throws NoSuchAlgorithmException {
		Map<String,Object> info = new HashMap<>();
		managerInfo.setManagerPwd(Tools.getMD5String(managerInfo.getManagerAccount()));
		int n = this.managerInfoMapper.addOneTea(managerInfo);
		if(n>0) {
			info.put("msg", "success");
		}else {
			info.put("msg", "error");
		}
		return info;
	}
			
}
