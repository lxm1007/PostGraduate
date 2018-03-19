package com.lxm.controller;

import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxm.dao.ManagerInfoMapper;
import com.lxm.pojo.ManagerInfo;
import com.lxm.services.ManagerInfoService;
import com.lxm.services.SyscodeService;
/***
 * 教师相关操作
 * @author lxm
 *
 */
@Controller
public class ManagerInfoController {

	@Autowired
	ManagerInfoMapper manageInfoMapper;
	@Autowired
	ManagerInfoService managerInfoService;
	@Autowired
	SyscodeService syscodeService;

	/**
	 * 查询所有教师
	 * @param info
	 * @param model
	 * @return
	 */
	@RequestMapping("/serachTeaByCon")
	@ResponseBody
	public List<ManagerInfo> serachTeaByCon(ManagerInfo info,Model model){
		
		return this.managerInfoService.selectByCon(info);
	
	}
	
	@RequestMapping("/updateTeacherInfo")
	public String updateTeacherInfo() {
		return "showTeachInfo";
	}
	@RequestMapping("/updateTeachInfoFir")
	@ResponseBody
	public Map<String,Object> updateTeachInfoFir(ManagerInfo managerInfo) throws NoSuchAlgorithmException{
		return this.managerInfoService.updateTeachInfoFir(managerInfo);
	}
	
	@RequestMapping("/showSelect")
	public String showSelect() {
		return "showSelect";
	}
	/***
	 * 刚进入页面查询学生名单
	 * @param managerInfo
	 * @return
	 */
	@RequestMapping("/searchSelect")
	@ResponseBody
	public Map<String,Object> searchSelect(ManagerInfo managerInfo) {
		
		
		return this.managerInfoService.searchSelect(managerInfo);
	}
	/**
	 * 按条件查询学生名单
	 * @param managerInfo
	 * @return
	 */
	@RequestMapping("/searchSelectByExample")
	@ResponseBody
	public Map<String,Object> searchSelectByExample(@RequestBody Map<String,Object> managerInfo){
		return this.managerInfoService.searchSelectByExample(managerInfo);
	}
	/**
	 * 初试成绩上传
	 * @return
	 */
	@RequestMapping("/upload1")
	public String upload1() {
		return "upload1";
	}
	
	@RequestMapping("/template1")
	public String getTemplate1() {
		return "forward:计算机学院研究生初试成绩模板.xlsx";
	}
	/**
	 * 上传教师信息
	 * @return
	 */
	@RequestMapping("/uploadManagerInfo")
	public String uploadManagerInfo() {
		
		return "uploadManagerInfo";
	}
	/**
	 * 下载教师信息模板
	 * @return
	 */
	@RequestMapping("/template2")
	public String getTemplate2() {
		return "forward:计算机学院研究生导师信息模板.xlsx";
	}
	/**
	 * 修改复试科目和对应成绩所占的百分比
	 * @return
	 */
	@RequestMapping("/updateSub")
	public String updateSub() {
		return "updateSub";
	}
	/**
	 * 查询当前复试科目及所占百分比
	 * @return
	 */
	@RequestMapping("/selectSub")
	@ResponseBody
	public Map<String,Object> selectSub() {
		return this.syscodeService.selectSub();
				
	}
	/**
	 * 
	 * @return
	 */
	@RequestMapping("/updateSysCode")
	@ResponseBody
	public  Map<String,Object> updateSysCode(String reSub1,String reSub2,String reSub1Val,String reSub2Val){
		return this.syscodeService.updateSysCode( reSub1,reSub2, reSub1Val, reSub2Val);
	}
	
	

	/**
	 * 修改教师信息界面
	 * @return
	 */
	
	@RequestMapping("/updateTeaInfo")
	public String updateTeaInfo() {
		return "showAllTea";
	}
	
	/**
	 * 查询所有教师
	 * @return
	 */
	@RequestMapping("/searchAllTea")
	@ResponseBody
	public Map<String,Object> searchAllTea(){
		return this.managerInfoService.searchAllTea();
	}
	
	/**
	 * 按照教师号查询
	 * @param managerInfo
	 * @return
	 */
	@RequestMapping("/selectManager")
	@ResponseBody
	public Map<String,Object> selectManager(ManagerInfo managerInfo){
		
		return this.managerInfoService.selectManager(managerInfo.getManagerId());
	}
	
	/**
	 *管理员修改学生信息 
	 * @param managerInfo
	 * @return
	 */
	@RequestMapping("/updateTeaInfoSecond")
	@ResponseBody
	public Map<String,Object> updateTeaInfoSecond(ManagerInfo managerInfo){
		return this.managerInfoService.updateTeaInfoSecond(managerInfo);
	}
	/***
	 * 学生分组
	 * @return
	 */
	@RequestMapping("/divide")
	public String divide() {
		return "divide";
	}
	
	/**
	 * 跳转到分配账户界面
	 * @param type
	 * @param model
	 * @return
	 */
	@RequestMapping("/assign")
	public String assign(String type,Model model) {
		model.addAttribute("type", type);
		return "assign";
	}
	/**
	 * 分配教师账号
	 * @param type
	 * @return
	 */
	@RequestMapping("/assignDuty")
	@ResponseBody
	public Map<String,Object> assignDuty(String type,String id){
		return this.managerInfoService.assignDuty(type,id);
	}
	/***
	 * 查询老师状态
	 * @param managerInfo
	 * @return
	 */
	@RequestMapping("/getType")
	@ResponseBody
	public Map<String,Object> getType(ManagerInfo managerInfo) {
		return this.managerInfoService.getType(managerInfo);
	}
	
	/**
	 * 按条件查询
	 * @param managerInfo
	 * @return
	 */
	@RequestMapping("/serachTeaByCon2")
	@ResponseBody
	public Map<String,Object> serachTeaByCon2(ManagerInfo managerInfo){
		
		return this.managerInfoService.serachTeaByCon2(managerInfo);
	}
	/**
	 * 删除教师信息
	 * @param managerInfo
	 * @return
	 */
	@RequestMapping("/deleteOneTea")
	@ResponseBody
	public Map<String,Object> deleteOneTea(ManagerInfo managerInfo){
		return this.managerInfoService.deleteOneTea(managerInfo);
	}
	
	/**
	 * 添加教师信息
	 * @param managerInfo
	 * @return
	 * @throws NoSuchAlgorithmException 
	 */
	@RequestMapping("/addOneTea")
	@ResponseBody
	public  Map<String,Object> addOneTea(ManagerInfo managerInfo) throws NoSuchAlgorithmException{
		
		return this.managerInfoService.addOneTea(managerInfo);
	}
}
