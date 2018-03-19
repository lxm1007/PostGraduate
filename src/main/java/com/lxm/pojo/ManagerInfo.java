package com.lxm.pojo;

import java.math.BigDecimal;

public class ManagerInfo {
    private BigDecimal managerId;

    private String managerName;

    private String managerTel;

    private String managerType;

    private String managerAccount;

    private String managerPwd;

    private String managerCond;

    private String managerTitle;

    private String managerDetail;

    private String managerRatednum;

    private String managerSelected;

    private String managerState;
    
    private String managerSex;
    
    private String managerMentortype;
    
    private String managerMajor;
    
    
    
    public String getManagerMajor() {
		return managerMajor;
	}

	public void setManagerMajor(String managerMajor) {
		this.managerMajor = managerMajor;
	}

	public String getManagerMentortype() {
		return managerMentortype;
	}

	public void setManagerMentortype(String managerMentortype) {
		this.managerMentortype = managerMentortype;
	}

	public String getManagerSex() {
		return managerSex;
	}

	public void setManagerSex(String managerSex) {
		this.managerSex = managerSex;
	}

	public String getManagerState() {
		return managerState;
	}

	public void setManagerState(String managerState) {
		this.managerState = managerState;
	}

	public BigDecimal getManagerId() {
        return managerId;
    }

    public void setManagerId(BigDecimal managerId) {
        this.managerId = managerId;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }

    public String getManagerTel() {
        return managerTel;
    }

    public void setManagerTel(String managerTel) {
        this.managerTel = managerTel;
    }

    public String getManagerType() {
        return managerType;
    }

    public void setManagerType(String managerType) {
        this.managerType = managerType;
    }

    public String getManagerAccount() {
        return managerAccount;
    }

    public void setManagerAccount(String managerAccount) {
        this.managerAccount = managerAccount;
    }

    public String getManagerPwd() {
        return managerPwd;
    }

    public void setManagerPwd(String managerPwd) {
        this.managerPwd = managerPwd;
    }

    public String getManagerCond() {
        return managerCond;
    }

    public void setManagerCond(String managerCond) {
        this.managerCond = managerCond;
    }

    public String getManagerTitle() {
        return managerTitle;
    }

    public void setManagerTitle(String managerTitle) {
        this.managerTitle = managerTitle;
    }

    public String getManagerDetail() {
        return managerDetail;
    }

    public void setManagerDetail(String managerDetail) {
        this.managerDetail = managerDetail;
    }

    public String getManagerRatednum() {
        return managerRatednum;
    }

    public void setManagerRatednum(String managerRatednum) {
        this.managerRatednum = managerRatednum;
    }

    public String getManagerSelected() {
        return managerSelected;
    }

    public void setManagerSelected(String managerSelected) {
        this.managerSelected = managerSelected;
    }

	@Override
	public String toString() {
		return "ManagerInfo [managerId=" + managerId + ", managerName=" + managerName + ", managerTel=" + managerTel
				+ ", managerType=" + managerType + ", managerAccount=" + managerAccount + ", managerPwd=" + managerPwd
				+ ", managerCond=" + managerCond + ", managerTitle=" + managerTitle + ", managerDetail=" + managerDetail
				+ ", managerRatednum=" + managerRatednum + ", managerSelected=" + managerSelected + ", managerState="
				+ managerState + ", managerSex=" + managerSex + ", managerMentortype=" + managerMentortype
				+ ", managerMajor=" + managerMajor + "]";
	}
    
    
}