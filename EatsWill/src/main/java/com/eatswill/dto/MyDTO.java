package com.eatswill.dto;

import org.springframework.web.multipart.MultipartFile;

public class MyDTO {
	
	// orderMain 컬럼
	private String orderCode;
	private String userId;
	private String oAmount;
	private String orderDate;
	private String shopCode;
	private String request;
	private String orderStatus;
	
	
	// Review 테이블 컬럼
	private String ceoContent; // 사장이 댓 작성시 원 댓글
	private int reNum; // 리뷰 번호
	private int reScore; // 별점
	private String reContent; // 리뷰 내용
	private String reCreated; // 리뷰 작성일
	private String reImg; // 리뷰 이미지
	
	private MultipartFile uploadfile;
	
	
	// 그 외 필요한 데이터
	private String shopName;
	private String menuName;
	private String shopImg;
	private double shopScore;
	private int reCnt;
	private int reStar;
	private String ceoReContent;
	private int cnt;
	private String ceoId;
	
	//--------------getter/setter
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String orderCode) {
		this.orderCode = orderCode;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getoAmount() {
		return oAmount;
	}
	public void setoAmount(String oAmount) {
		this.oAmount = oAmount;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getShopCode() {
		return shopCode;
	}
	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getCeoContent() {
		return ceoContent;
	}
	public void setCeoContent(String ceoContent) {
		this.ceoContent = ceoContent;
	}
	public int getReNum() {
		return reNum;
	}
	public void setReNum(int reNum) {
		this.reNum = reNum;
	}
	public int getReScore() {
		return reScore;
	}
	public void setReScore(int reScore) {
		this.reScore = reScore;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getReCreated() {
		return reCreated;
	}
	public void setReCreated(String reCreated) {
		this.reCreated = reCreated;
	}
	public String getShopImg() {
		return shopImg;
	}
	public void setShopImg(String shopImg) {
		this.shopImg = shopImg;
	}
	public String getReImg() {
		return reImg;
	}
	public void setReImg(String reImg) {
		this.reImg = reImg;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public double getShopScore() {
		return shopScore;
	}
	public void setShopScore(double shopScore) {
		this.shopScore = shopScore;
	}
	public int getReCnt() {
		return reCnt;
	}
	public void setReCnt(int reCnt) {
		this.reCnt = reCnt;
	}
	public String getCeoReContent() {
		return ceoReContent;
	}
	public void setCeoReContent(String ceoReContent) {
		this.ceoReContent = ceoReContent;
	}
	public int getReStar() {
		return reStar;
	}
	public void setReStar(int reStar) {
		this.reStar = reStar;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getCeoId() {
		return ceoId;
	}
	public void setCeoId(String ceoId) {
		this.ceoId = ceoId;
	}

	
}
