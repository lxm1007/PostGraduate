package com.lxm.dao;

import com.lxm.pojo.Syscode;
import com.lxm.pojo.SyscodeExample;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface SyscodeMapper {
    long countByExample(SyscodeExample example);

    int deleteByExample(SyscodeExample example);

    int deleteByPrimaryKey(BigDecimal sysId);

    int insert(Syscode record);

    int insertSelective(Syscode record);

    List<Syscode> selectByExample(SyscodeExample example);

    Syscode selectByPrimaryKey(BigDecimal sysId);

    int updateByExampleSelective(@Param("record") Syscode record, @Param("example") SyscodeExample example);

    int updateByExample(@Param("record") Syscode record, @Param("example") SyscodeExample example);

    int updateByPrimaryKeySelective(Syscode record);

    int updateByPrimaryKey(Syscode record);

	List<Map<String, Object>> selectSub();

	List<Map<String, Object>> selectSubVal();

	int updateSysCode(@Param("map")Map<String,Object> map);

	List<Map<String, Object>> selectPercent();
}