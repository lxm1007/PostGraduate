package com.lxm.dao;

import com.lxm.pojo.StuSelected;
import com.lxm.pojo.StuSelectedExample;
import java.math.BigDecimal;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StuSelectedMapper {
    long countByExample(StuSelectedExample example);

    int deleteByExample(StuSelectedExample example);

    int deleteByPrimaryKey(BigDecimal chooseId);

    int insert(StuSelected record);

    int insertSelective(StuSelected record);

    List<StuSelected> selectByExample(StuSelectedExample example);

    StuSelected selectByPrimaryKey(BigDecimal chooseId);

    int updateByExampleSelective(@Param("record") StuSelected record, @Param("example") StuSelectedExample example);

    int updateByExample(@Param("record") StuSelected record, @Param("example") StuSelectedExample example);

    int updateByPrimaryKeySelective(StuSelected record);

    int updateByPrimaryKey(StuSelected record);
}