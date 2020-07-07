package com.eatswill.dto;

import org.springframework.web.multipart.MultipartFile;

public class MyDTO {
	
	// orderMain �÷�
	private String orderCode;
	private String userId;
	private int oAmount;
	private String orderDate;
	private String shopCode;
	private String request;
	private String orderStatus;
	
	
	// Review ���̺� �÷�
	private int pNum; // ������ �� �ۼ��� �� ���
	private int reNum; // ���� ��ȣ
	private int reScore; // ����
	private String reContent; // ���� ����
	private String reCreated; // ���� �ۼ���
	private String reImg; // ���� �̹���
	
	private MultipartFile uploadfile;

	
	// �� �� �ʿ��� ������
	private String shopName;
	private String menuName;
	private String shopImg;
	
	
	
	
	
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
	public int getoAmount() {
		return oAmount;
	}
	public void setoAmount(int oAmount) {
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
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
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
	
	
}
