package com.lxm.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class ManagerSelect {
    private BigDecimal selectId;

    private BigDecimal stuId;

    private BigDecimal managerId;

    private Date selectTime;

    private String selectType;

    public BigDecimal getSelectId() {
        return selectId;
    }

    public void setSelectId(BigDecimal selectId) {
        this.selectId = selectId;
    }

    public BigDecimal getStuId() {
        return stuId;
    }

    public void setStuId(BigDecimal stuId) {
        this.stuId = stuId;
    }

    public BigDecimal getManagerId() {
        return managerId;
    }

    public void setManagerId(BigDecimal managerId) {
        this.managerId = managerId;
    }

    public Date getSelectTime() {
        return selectTime;
    }

    public void setSelectTime(Date selectTime) {
        this.selectTime = selectTime;
    }

    public String getSelectType() {
        return selectType;
    }

    public void setSelectType(String selectType) {
        this.selectType = selectType;
    }
}