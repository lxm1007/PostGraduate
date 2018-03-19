package com.lxm.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxm.dao.GroupInfoMapper;
import com.lxm.dao.StuInfoMapper;
import com.lxm.pojo.GroupInfo;
import com.lxm.pojo.StuInfo;

@Service
public class GroupInfoService {

	@Autowired
	GroupInfoMapper groupInfoMapper;
	@Autowired
	StuInfoMapper stuInfoMapper;
	
	public Map<String, Object> updateGroupInfo(GroupInfo groupInfo) {
		Map<String,Object> map = new HashMap<>();
		int n = this.groupInfoMapper.insert(groupInfo);
		if(n>0) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		
		return map;
	}

	public Map<String, Object> serachGroupInfo(GroupInfo groupInfo) {
		Map<String,Object> map = new HashMap<>();
		
		Map<String,Object> info1= this.groupInfoMapper.serachGroupInfo(groupInfo);
		StuInfo stuInfo = new StuInfo();
		stuInfo.setStuState("9"+groupInfo.getGroupNum());
		List<Map<String,Object>> info2= this.stuInfoMapper.serachGroupstu(stuInfo);
		if(info1!=null&&info2!=null) {
			map.put("msg", "success");
			map.put("info", info1);
			map.put("stuInfo", info2);
		}else {
			map.put("msg", "error");
		}
		return map;
	}

	public Map<String, Object> serachGroup(GroupInfo groupInfo) {
		Map<String,Object> map = new HashMap<>();
		Map<String,Object> info = this.groupInfoMapper.serachGroupInfo(groupInfo);
		if(info != null && info.size()!=0) {
			map.put("msg", "success");
			map.put("info", info);
		}else {
			map.put("msg", "error");
		}
		return map;
	}
	
	
	
}
