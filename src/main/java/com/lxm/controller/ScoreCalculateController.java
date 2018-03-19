package com.lxm.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lxm.services.StuInfoService;

@Controller
public class ScoreCalculateController {

	@Autowired
	StuInfoService stuInfoService;
	
	/**
	 * 跳转到计算成绩页面
	 * @return
	 */
	@RequestMapping("/calculateScore")
	public String calculateScore() {
		return "calculateScore";
	}
	/**
	 * 展示所有成绩
	 * @return
	 */
	@RequestMapping("/showAllScore")
	@ResponseBody
	public Map<String,Object> showAllScore(){
		return this.stuInfoService.showAllScore();
	}
	
	
}
