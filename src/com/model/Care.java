package com.model;

import java.math.BigDecimal;

public class Care {
	private Integer careId;
	private String careDesc;
	private Integer careTime;
	private Integer careUser;
	private Integer careState;
	private String carePhone;
	private String careUserRealName;
	private String careStartDate;
	private BigDecimal carePrice;
	
	
	public String getCareStartDate() {
		return careStartDate;
	}
	public void setCareStartDate(String careStartDate) {
		this.careStartDate = careStartDate;
	}
	public BigDecimal getCarePrice() {
		return carePrice;
	}
	public void setCarePrice(BigDecimal carePrice) {
		this.carePrice = carePrice;
	}
	public String getCareUserRealName() {
		return careUserRealName;
	}
	public void setCareUserRealName(String careUserRealName) {
		this.careUserRealName = careUserRealName;
	}
	public Integer getCareId() {
		return careId;
	}
	public void setCareId(Integer careId) {
		this.careId = careId;
	}
	public String getCareDesc() {
		return careDesc;
	}
	public void setCareDesc(String careDesc) {
		this.careDesc = careDesc;
	}
	public Integer getCareTime() {
		return careTime;
	}
	public void setCareTime(Integer careTime) {
		this.careTime = careTime;
	}
	public Integer getCareUser() {
		return careUser;
	}
	public void setCareUser(Integer careUser) {
		this.careUser = careUser;
	}
	public Integer getCareState() {
		return careState;
	}
	public void setCareState(Integer careState) {
		this.careState = careState;
	}
	public String getCarePhone() {
		return carePhone;
	}
	public void setCarePhone(String carePhone) {
		this.carePhone = carePhone;
	}
	@Override
	public String toString() {
		return "Care [careId=" + careId + ", careDesc=" + careDesc + ", careTime=" + careTime + ", careUser=" + careUser
				+ ", careState=" + careState + ", carePhone=" + carePhone + "]";
	}
	
}
