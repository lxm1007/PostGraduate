package com.lxm.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class StuSelected {
    private BigDecimal chooseId;

    private BigDecimal stuId;

    private BigDecimal managerId;

    private Date chooseDate;

    private String chooseType;

    public BigDecimal getChooseId() {
        return chooseId;
    }

    public void setChooseId(BigDecimal chooseId) {
        this.chooseId = chooseId;
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

    public Date getChooseDate() {
        return chooseDate;
    }

    public void setChooseDate(Date chooseDate) {
        this.chooseDate = chooseDate;
    }

    public String getChooseType() {
        return chooseType;
    }

    public void setChooseType(String chooseType) {
        this.chooseType = chooseType;
    }
}