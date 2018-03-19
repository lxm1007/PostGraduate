package com.lxm.pojo;

import java.math.BigDecimal;

public class Syscode {
    private BigDecimal sysId;

    private String fCode;

    private String fValue;

    public BigDecimal getSysId() {
        return sysId;
    }

    public void setSysId(BigDecimal sysId) {
        this.sysId = sysId;
    }

    public String getfCode() {
        return fCode;
    }

    public void setfCode(String fCode) {
        this.fCode = fCode;
    }

    public String getfValue() {
        return fValue;
    }

    public void setfValue(String fValue) {
        this.fValue = fValue;
    }
}