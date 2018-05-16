package com.lxm.dao;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import com.lxm.pojo.StuInfo;

public interface StuInfoMapper {


    int deleteByPrimaryKey(BigDecimal stuId);

    int insert(StuInfo record);

    int insertSelective(StuInfo record);

    StuInfo selectByPrimaryKey(BigDecimal stuId);


    int updateByPrimaryKeySelective(StuInfo record);

    int updateByPrimaryKey(StuInfo record);
    
    StuInfo stuLogin(Map<String,String> map);
    
    List<StuInfo> stuGetOne(StuInfo stuInfo);
    
    int updatePwd(Map<String,Object> map);

    StuInfo getAccount(StuInfo stuInfo);
    
    StuInfo getCandidate(StuInfo stuInfo);
    
    int register(StuInfo stuInfo);
    
    int  firstUpdate(Map<String,String> map);
    
    int updateType(StuInfo stuInfo);

	int updateStuMangerId(StuInfo stuInfo);

	StuInfo selectStuInfo(StuInfo stuInfo);

	int changeStuType(StuInfo stuInfo);

	int addBatch(List<StuInfo> list);

	List<StuInfo> selectAll();

	List<StuInfo> selectAllStuByExample(StuInfo stuInfo);

	int updateStuInfoByTea(StuInfo stuInfo);

	int updateState(BigDecimal stuId);

	int addOneByTea(StuInfo stuInfo);

	int deleteAllStu();

	List<StuInfo> selectAllByTea();

	int addOneGroup(Map<String, Object> stu);

	List<Map<String, Object>> showAllGroup();

	List<Map<String, Object>> serachGroupstu(StuInfo stuInfo);

	List<Map<String, Object>> searchStuAndTea(StuInfo info);

	int emptyTeaId(StuInfo stuInfo);

	int addReTestScore(StuInfo stuInfo);

	List<StuInfo> searchStuAndScore(StuInfo stuInfo);

	List<Map<String, Object>> showAllScore();

	int cancleSelect(StuInfo stuInfo);

	int updateStuState(StuInfo stuInfo);

	StuInfo checkStuState(StuInfo stuInfo);
}