package com.lxm.dao;

import com.lxm.pojo.ManagerSelect;
import com.lxm.pojo.ManagerSelectExample;
import java.math.BigDecimal;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ManagerSelectMapper {
    long countByExample(ManagerSelectExample example);

    int deleteByExample(ManagerSelectExample example);

    int deleteByPrimaryKey(BigDecimal selectId);

    int insert(ManagerSelect record);

    int insertSelective(ManagerSelect record);

    List<ManagerSelect> selectByExample(ManagerSelectExample example);

    ManagerSelect selectByPrimaryKey(BigDecimal selectId);

    int updateByExampleSelective(@Param("record") ManagerSelect record, @Param("example") ManagerSelectExample example);

    int updateByExample(@Param("record") ManagerSelect record, @Param("example") ManagerSelectExample example);

    int updateByPrimaryKeySelective(ManagerSelect record);

    int updateByPrimaryKey(ManagerSelect record);
}