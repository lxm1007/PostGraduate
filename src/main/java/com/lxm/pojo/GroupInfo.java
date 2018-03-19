package com.lxm.pojo;

import java.math.BigDecimal;

public class GroupInfo {
    private BigDecimal groupId;

    private String groupNum;

    private String groupTime;

    private String groupPlace;

    private String groupTea;

    public BigDecimal getGroupId() {
        return groupId;
    }

    public void setGroupId(BigDecimal groupId) {
        this.groupId = groupId;
    }

    public String getGroupNum() {
        return groupNum;
    }

    public void setGroupNum(String groupNum) {
        this.groupNum = groupNum;
    }

    public String getGroupTime() {
        return groupTime;
    }

    public void setGroupTime(String groupTime) {
        this.groupTime = groupTime;
    }

    public String getGroupPlace() {
        return groupPlace;
    }

    public void setGroupPlace(String groupPlace) {
        this.groupPlace = groupPlace;
    }

    public String getGroupTea() {
        return groupTea;
    }

    public void setGroupTea(String groupTea) {
        this.groupTea = groupTea;
    }
}