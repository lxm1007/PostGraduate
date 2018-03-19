package com.lxm.services;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lxm.dao.SyscodeMapper;

@Service
public class SyscodeService {

	@Autowired
	SyscodeMapper syscodeMapper;
	
	public Map<String,Object> selectSub(){
		Map<String,Object> map = new HashMap<>();
		List<Map<String,Object>> info = this.syscodeMapper.selectSub();
		List<Map<String,Object>> info2 = this.syscodeMapper.selectSubVal();
		if(info2 != null) {
			info.addAll(info2);
			map.put("info", info);
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		return map;
	}

	public Map<String, Object> updateSysCode(String reSub1, String reSub2, String reSub1Val, String reSub2Val) {
		Map<String,Object> map = new HashMap<>();
		map.put("reSub1",reSub1);
		map.put("reSub2",reSub2);
		map.put("reSub1Val",reSub1Val);
		map.put("reSub2Val",reSub2Val);
		int n =  this.syscodeMapper.updateSysCode(map);
		
		if(n>=-1) {
			map.put("msg", "success");
		}else {
			map.put("msg", "error");
		}
		return map;
	}
	
}
