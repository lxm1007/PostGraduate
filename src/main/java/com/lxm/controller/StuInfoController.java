package com.lxm.controller;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.lxm.dao.ManagerInfoMapper;
import com.lxm.dao.StuInfoMapper;
import com.lxm.pojo.StuInfo;
import com.lxm.services.ManagerInfoService;
import com.lxm.services.StuInfoService;
/**
 * 用户相关操作
 * @author lxm
 *
 */
@Controller

//@SessionAttributes(value= {"loginfo","managerloginfo"}) 改用session.setAttribute
public class StuInfoController {
	@Autowired
	StuInfoMapper stuInfoMapper;
	@Autowired
	StuInfoService stuInfoService;
	@Autowired
	ManagerInfoMapper managerInfoMapper;
	@Autowired
	ManagerInfoService managerInfoService;
	
	/**
	 * 根据用户名和密码登录
	 * service层负责对密码进行处理
	 * @param stuinfo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/login")
	public Map<String,Object> login(@RequestBody Map<String,String> arrgs,Model model,HttpSession session){
		String role = arrgs.get("role");	
		if(role.equals("2")) {
		Map<String,Object> map =this.stuInfoService.login(arrgs);
		if(session.getAttribute("managerloginfo")!=null) {
			session.removeAttribute("managerloginfo");
			
		}

		session.setAttribute("loginfo", map);
		return map;		
		}else if(role.equals("1")) {
			Map<String,Object> map =this.managerInfoService.login(arrgs);
			if(session.getAttribute("loginfo")!=null) {
				session.removeAttribute("loginfo");	
			}

			session.setAttribute("managerloginfo", map);
			return map;
		}
		
		else return null;
	}
	
	/**
	 * 登录成功后跳转到首页
	 * 其中身份信息存到session中
	 * 不在这进行处理（为了安全）
	 * @param session
	 * @return
	 */
	@RequestMapping("/loginSuccess")
	public String getAllInfo(HttpSession session) {
		System.out.println(session.getAttribute("loginfo"));
		System.out.println(session.getAttribute("managerloginfo"));
		Map<String,Object> map1 = (Map<String,Object>)session.getAttribute("loginfo");
		Map<String,Object> map2 = (Map<String,Object>)session.getAttribute("managerloginfo");
		if(map1 != null||map2 != null) {
			return "main";
		}
		else {
			return "forward:index.jsp";
		}
		
	}
	/**
	 * 跳转到修改密码页
	 * @return
	 */
	@RequestMapping("/forgot")
	public String changePwd() {
		return "changePwd";
	}
	
	
	/***
	 * 查询待修改密码人员是否存在
	 * @param stuInfo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/searchStu")
	public Map<String,Object> searchStu(StuInfo stuInfo) {
		return this.stuInfoService.getOne(stuInfo);
	}
	
	/**
	 * 密码重置
	 * @param pwd
	 * @param rePwd
	 * @param stuId
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/updatePwd")
	public Map<String,Object> updatePwd(String pwd,String rePwd,String stuId){
		Map<String,Object> map = new HashMap();
		map.put("pwd", pwd);
		map.put("rePwd", rePwd);
		map.put("stuId", stuId);
		return this.stuInfoService.updatePwd(map);
	}
	/**
	 * 检测用户名是否可用
	 * @param stuInfo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/searchAccount")
	public Map<String,Object> searchAccount(StuInfo stuInfo){
		return this.stuInfoService.getAccount(stuInfo);
	}
	/**
	 * 查找用户输入学号是否正确
	 * @param stuInfo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/searchCandidate")
	public Map<String,Object> stuCandidate(StuInfo stuInfo) {
		return this.stuInfoService.searchCandidate(stuInfo);
	}
	
	/**
	 * 用户注册
	 * @param stuInfo
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/register")
	public Map<String,Object> register(StuInfo stuInfo){
		System.out.println(stuInfo);
		return this.stuInfoService.register(stuInfo);
		
	}
	@RequestMapping("/updateInfo")
	public String updateInfo() {
		return "showInfo";
	}
	
	@RequestMapping("/upload") 
	@ResponseBody
	public Map<String,String> upload(HttpServletRequest request,MultipartFile file) throws IllegalStateException, IOException{
		Map<String,String[]> map = request.getParameterMap();
		
		System.out.println("参数为"+map.keySet());
		String path = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\postgraduate\\"+file.getOriginalFilename();
		//String path="D:\\oxygen_project\\postgraduate\\src\\main\\webapp\\"+file.getOriginalFilename();
        
        File newFile=new File(path);
        //通过CommonsMultipartFile的方法直接写文件（注意这个时候）
        file.transferTo(newFile);  
        
		return this.stuInfoService.fistUpdate(map);
	}
	
	@RequestMapping("/updateType")
	@ResponseBody
	public Map<String,Object> updateType(StuInfo stuinfo,Model model) {
		Map<String,Object> map =new HashMap<>();
		try{
			this.stuInfoMapper.updateType(stuinfo);
			
			
			map.put("info", this.stuInfoMapper.selectByPrimaryKey(stuinfo.getStuId()));
			model.addAttribute("loginfo", map);
		}catch (Exception e) {
			System.out.println(e);
		}
		return map;
		
	}
	@RequestMapping("/seachTea")
	public String searchTea() {
		return "searchTea";
	}
	
	@RequestMapping("/updateStuMangerId")
	@ResponseBody
	public Map<String,String> updateStuMangerId(StuInfo stuInfo){
		return this.stuInfoService.updateStuMangerId(stuInfo);
	}
	@RequestMapping("/searchInfo")
	public String searchInfo(Model model,HttpSession session){
		Long stuId= Long.parseLong(((StuInfo)((Map)session.getAttribute("loginfo")).get("info")).getStuId().toString());
	
		Map<String,String> map = this.managerInfoService.searchDetail(stuId);
		model.addAttribute("teacherinfo", map);
		return "searchInfo";
	}
	
	/**
	 * 根据学生id 查询学生基本信息
	 * @param stuinfo
	 * @return
	 */
	@RequestMapping("/selectStuInfo")
	@ResponseBody
	public Map<String,Object> selectStuInfo(StuInfo stuinfo){
		return this.stuInfoService.selectStuInfo(stuinfo);
	}
	/**
	 * 查询报考的相关信息
	 * @return
	 */
	@RequestMapping("/showFirtstScore")
	public String showFirtstScore() {
		return "showFirtstScore";
	}
	/**
	 * 下载附件
	 * @param stuInfo
	 * @return
	 */
	@RequestMapping("/downloadExtra")
	public String downloadExtra(StuInfo stuInfo) {
		return "forward:"+stuInfo.getStuCandidate()+".zip";
	}
	/***
	 * 查询所有学生信息
	 * @return
	 */
	@RequestMapping("/searchAllStu")
	@ResponseBody
	public Map<String,Object> selectAll() {
		return this.stuInfoService.selectAll();
	}
	/**
	 * 删除一个学生信息
	 * @param stuInfo
	 * @return
	 */
	@RequestMapping("/deleteOneStu")
	@ResponseBody
	public Map<String,Object> deleteOneStu(StuInfo stuInfo) {
		return this.stuInfoService.deleteOneStu(stuInfo);
	}
	
	/**
	 * 学生信息展示页
	 * @return
	 */
	@RequestMapping("/updateStuInfo")
	public String searchAllStu() {
		return "showAllStu";
	}
	
	/**
	 * 按条件查询学生
	 * @param stuInfo
	 * @return
	 */
	@RequestMapping("/searchAllStuByExample")
	@ResponseBody
	public Map<String,Object> searchAllStuByExample(String stuName,String stuTel){
		
		return  this.stuInfoService.searchAllStuByExample(stuName,stuTel);
	}
	/**
	 * 研究生助理修改学生信息
	 * @param stuInfo
	 * @return
	 */
	@RequestMapping("/updateStuInfoByTea")
	@ResponseBody
	public Map<String,Object> updateStuInfoByTea(StuInfo stuInfo){
		
		return this.stuInfoService.updateStuInfoByTea(stuInfo);
	}
	
	/**
	 *教师添加学生信息 
	 * @param stuInfo
	 * @return
	 */
	@RequestMapping("/addOneByTea")
	@ResponseBody
	public Map<String,Object> addOneByTea(StuInfo stuInfo){
		System.out.println("**************"+stuInfo+"************************");
		return this.stuInfoService.addOneByTea(stuInfo);	
	}

	/**
	 * 修改所有的学生状态为-1
	 *
	 * @return
	 */
	@RequestMapping("/deleteAllStu")
	@ResponseBody
	public Map<String,Object> deleteAllStu(){
		return this.stuInfoService.deleteAllStu();
	}
	
	
	@RequestMapping("/searchAllStuByTea")
	@ResponseBody
	public Map<String,Object> selectAllByTea() {
		return this.stuInfoService.selectAllByTea();
	}
	/**
	 * 添加一个分组
	 * @param map
	 * @return
	 */
	@RequestMapping("/addOneGroup")
	@ResponseBody
	public Map<String,Object> addOneGroup(@RequestBody Map<String,Object> map) {
		return this.stuInfoService.addOneGroup(map);
	}
	/**
	 * 显示所有已经分好的组
	 * @return
	 */
	@RequestMapping("/allGroup")
	public String allGroup() {
		return "allGroup";
	}
	/**
	 * 查询所有分组
	 * @return
	 */
	@RequestMapping("/showAllGroup")
	@ResponseBody
	public Map<String,Object> showAllGroup() {
		
		return this.stuInfoService.showAllGroup();
	}
	/**
	 * 显示当前分组所有人员
	 * @return
	 */
	@RequestMapping("/showGroupStu")
	public String showGroupStu(String groupNum,Model model) {
		model.addAttribute("group", groupNum);
		return "showGroupStu";
	}
	/**
	 * 跳转到解除关系查询界面
	 * 
	 * @return
	 */
	@RequestMapping("/emptyTea")
	public String emptyTea() {
		return "emptyTea";
	}
	/**
	 * 按照考号和姓名查询
	 * @param info
	 * @return
	 */
	@RequestMapping("/searchStuAndTea")
	@ResponseBody
	public Map<String,Object> searchStuAndTea(@RequestBody Map<String,Object> info) {
		return this.stuInfoService.searchStuAndTea(info);
	}
	/**
	 * 清空对应的教师id 解除关系
	 * @param stuInfo
	 * @return
	 */
	@RequestMapping("/emptyTeaId")
	@ResponseBody
	public Map<String,Object> emptyTeaId(StuInfo stuInfo){
		return this.stuInfoService.emptyTeaId(stuInfo);
	}
	/**
	 * 跳转到上传复试成绩界面
	 * @return
	 */
	@RequestMapping("/addReTestScore")
	public String addReTestScore(String type,Model model) {
		model.addAttribute("type", type);
		if(type.equals("1")) {

		return "addReTestScore";			
		}else {
			return "addReTestScore2";
		}
	}
	/**
	 * 添加复试成绩
	 * @param stuInfo
	 * @return
	 */
	@RequestMapping("/addReTestScore2")
	@ResponseBody
	public Map<String,Object> addREtestScore(StuInfo stuInfo){
		
		return this.stuInfoService.addReTestScore(stuInfo);
	}
	/**
	 * 查询学生成绩
	 * @param stuInfo
	 * @return
	 */
	@RequestMapping("/searchStuAndScore")
	@ResponseBody
	public Map<String,Object> searchStuAndScore(@RequestBody Map<String,Object> stuInfo){
		
		return this.stuInfoService.searchStuAndScore(stuInfo);
	
	}
	/**
	 * 退出登录
	 * @param requst
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginfo");
		session.removeAttribute("managerloginfo");
		return "forward:index.jsp";
	}
	/**
	 * 拒绝已选择自己的学生
	 * @param info
	 * @return
	 */
	@RequestMapping("/cancleSelect")
	@ResponseBody
	public Map<String,Object>cancleSelect(StuInfo info){
		return this.stuInfoService.cancleSelect(info);
	}
	/**
	 * 解除学生的分组状态
	 * @return
	 */
	@RequestMapping("/updateStuState")
	@ResponseBody
	public Map<String,Object> updateStuState(StuInfo stuInfo){
		return this.stuInfoService.updateStuState(stuInfo);
	}
	
	/**
	 * 查询当前学生状态是否为1
	 * @param stuInfo
	 * @return
	 */
	@RequestMapping("/checkStuState")
	@ResponseBody
	public Map<String,Object> checkStuState(StuInfo stuInfo){
		return this.stuInfoService.checkStuState(stuInfo);
	}
}
