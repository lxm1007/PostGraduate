package com.lxm.services;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Conditional;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lxm.dao.ManagerInfoMapper;
import com.lxm.dao.ManagerSelectMapper;
import com.lxm.dao.StuInfoMapper;
import com.lxm.pojo.ManagerInfo;
import com.lxm.pojo.ManagerSelect;
import com.lxm.pojo.StuInfo;

/**
 * 教师选择学生
 * @author lxm
 *
 */
@Service
public class ManagerSelectService {

	@Autowired
	ManagerInfoMapper managerInfoMapper;
	@Autowired
	StuInfoMapper stuInfoMapper;
	@Autowired
	ManagerSelectMapper managerSelectMapper;
	
	@Transactional
	public Map<String,Object> selectOneStu(ManagerSelect managerSelect){
		managerSelect.setSelectTime(new Date());
		managerSelect.setSelectType("1");
	Map<String,Object> map = new HashMap<>();
	//1.将选择记录添加到记录表
	int num1 = this.managerSelectMapper.insert(managerSelect);
	ManagerInfo managerInfo = new ManagerInfo();
	StuInfo stuInfo = new StuInfo();
	//2.将已选择人数加1
	managerInfo.setManagerId(managerSelect.getManagerId());
	int num2 = this.managerInfoMapper.updateNum(managerInfo);
	//3.修改学生状态
	stuInfo.setStuId(managerSelect.getStuId());
	int num3 = this.stuInfoMapper.changeStuType(stuInfo);
	//4.查询当前选择人数
	ManagerInfo managerInfo2 = this.managerInfoMapper.selectByPrimaryKey(managerInfo.getManagerId());
	if(num1==1&&num2==1&&num3==1) {
		map.put("msg", "success");
		map.put("info", managerInfo2);
	}else {
		map.put("msg", "error");
	}
	
	return map;
	}

}
