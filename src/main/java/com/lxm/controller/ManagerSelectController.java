package com.lxm.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxm.dao.ManagerSelectMapper;
import com.lxm.pojo.ManagerSelect;
import com.lxm.services.ManagerSelectService;

@Controller
public class ManagerSelectController {

	
	@Autowired
	ManagerSelectMapper managerSelectMapper;
	@Autowired
	ManagerSelectService managerSelectService;
	
	@RequestMapping("/selectOneStu")
	@ResponseBody
	public Map<String,Object> selectOneStu(ManagerSelect managerSelect){
	
		return this.managerSelectService.selectOneStu(managerSelect);
		}
}
