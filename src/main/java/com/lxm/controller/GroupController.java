package com.lxm.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxm.dao.GroupInfoMapper;
import com.lxm.pojo.GroupInfo;
import com.lxm.services.GroupInfoService;

@Controller
public class GroupController {

	@Autowired
	GroupInfoMapper groupInfoMapper;
	@Autowired
	GroupInfoService groupInfoService;
	
	/**
	 * 将信息插入到group表
	 * @return
	 */
	@RequestMapping("/updateGroupInfo")
	@ResponseBody
	public Map<String,Object> updateGroupInfo(GroupInfo groupInfo){
		return this.groupInfoService.updateGroupInfo(groupInfo);
	}
	/**
	 * 查询所有分组信息
	 * @return
	 */
	@RequestMapping("/serachGroupInfo")
	@ResponseBody
	public Map<String,Object> serachGroupInfo(GroupInfo groupInfo){
		return this.groupInfoService.serachGroupInfo(groupInfo);
	}
	/**
	 * 按组别查询最后一条
	 * @return
	 */
	@RequestMapping("/serachGroup")
	@ResponseBody
	public Map<String,Object> serachGroup(GroupInfo groupInfo){
		return this.groupInfoService.serachGroup(groupInfo);
	}
	
}
