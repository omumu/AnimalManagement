package com.model;

public class Show {
	private Integer showId;
	private String showTitle;
	private Integer showStars;
	private Integer showUser;
	private String showFileName;
	public Integer getShowId() {
		return showId;
	}
	public void setShowId(Integer showId) {
		this.showId = showId;
	}
	public String getShowTitle() {
		return showTitle;
	}
	public void setShowTitle(String showTitle) {
		this.showTitle = showTitle;
	}
	public Integer getShowStars() {
		return showStars;
	}
	public void setShowStars(Integer showStars) {
		this.showStars = showStars;
	}
	public Integer getShowUser() {
		return showUser;
	}
	public void setShowUser(Integer showUser) {
		this.showUser = showUser;
	}
	public String getShowFileName() {
		return showFileName;
	}
	public void setShowFileName(String showFileName) {
		this.showFileName = showFileName;
	}
	private String userName;
	private Integer likeState;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Integer getLikeState() {
		return likeState;
	}
	public void setLikeState(Integer likeState) {
		this.likeState = likeState;
	}
	@Override
	public String toString() {
		return "Show [showId=" + showId + ", showTitle=" + showTitle + ", showStars=" + showStars + ", showUser="
				+ showUser + ", showFileName=" + showFileName + ", userName=" + userName + ", likeState=" + likeState
				+ "]";
	}
	
}
