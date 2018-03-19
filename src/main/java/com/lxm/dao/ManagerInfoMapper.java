package com.lxm.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.lxm.pojo.ManagerInfo;
public interface ManagerInfoMapper {

    int deleteByPrimaryKey(BigDecimal managerId);

    int insert(ManagerInfo record);

    int insertSelective(ManagerInfo record);

    ManagerInfo selectByPrimaryKey(BigDecimal managerId);

    int Selective(ManagerInfo record);

    int updateByPrimaryKey(ManagerInfo record);

	ManagerInfo getOne(Map<String, String> args);
	

	List<ManagerInfo> selectByCon(ManagerInfo info);

	Map<String, String> searchDetail(@Param("stuId")Long stuId);

	int updateTeachInfoFir(ManagerInfo managerInfo);

	int updateStateByPrimary(ManagerInfo managerInfo);

	List<Map<String,Object>> searchSelect(ManagerInfo managerInfo);
	
	String selectedNum(ManagerInfo info);

	List<Map<String, Object>> searchSelectByExample(Map<String,Object> managerInfo);

	int updateNum(ManagerInfo managerInfo);

	int addBatch(List<ManagerInfo> info);

	List<ManagerInfo> searchAllTea();

	ManagerInfo selectManager(BigDecimal managerId);

	int updateTeaInfoSecond(ManagerInfo managerInfo);

	int assignDuty(ManagerInfo managerInfo);

	int deleteOneTea(ManagerInfo managerInfo);

	int addOneTea(ManagerInfo managerInfo);

}