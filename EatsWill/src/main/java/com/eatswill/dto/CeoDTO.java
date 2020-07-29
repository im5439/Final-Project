package com.eatswill.dto;


import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CeoDTO {

	//����� ȸ������ ========
	private String ceoId; // ����� ���̵�(pk)
	private String ceoName; // ����� �̸�
	private String ceoPw; // ����� ��й�ȣ
	private String ceoEmail; // ����� �̸���
	//=======================
	
	//�����߰�===============
	private String shopCode; //�����ڵ�(pk)
	private String shopName; //�����
	private String category; //ī�װ�
	private String shopAddr; //�����ּ�
	private String shopAddr1;
	private String shopAddr2;
	private String shopTel; //������ȭ��ȣ
	private String timeCode; //
	private String shopImg; //�����̹���
	private String franchise; //��������������
	private String shopCreated;
	
	private MultipartFile uploadfile;
	//=======================
	
	//����===================
	private String orderCode; //�ֹ��ڵ�
	private String pnum; // ���� ��۹�ȣ
	private String renum; // ��� ��ȣ(pk)
	private String reScore; // ����
	private String reContent; // ���� ����
	private String reCreated; // ���� �ۼ���
	private String reImg; // ���� �̹���
	private String ceoContent; // ����� ����

	private String userId; // ����� ���̵�
	private int reviewCount; // ���� ����
	//=======================
	
	//�޴��߰�===============
	private String menuCode;
	private String menuName;
	private String menuPrice;
	private String menuImg;
	private String part;
	private MultipartFile uploadfile2;
	//=======================
	
	//�ֹ�Ȯ��===============
	private String oamount;
	private String orderDate;
	private String request;
	private String orderStatus;
	private String userTel;
	private String deliveryAddr1;
	private String deliveryAddr2;
	private List<OrderDTO> orderDetail;
	private int osCount100;
	private int osCount200;
	//=======================
	
	//����===================
	private String orderDay;
	private String sumDay;
	//=======================
	
	private String codeName;
	
	public String getCeoId() {
		return ceoId;
	}
	public void setCeoId(String ceoId) {
		this.ceoId = ceoId;
	}
	public String getCeoName() {
		return ceoName;
	}
	public void setCeoName(String ceoName) {
		this.ceoName = ceoName;
	}
	public String getCeoPw() {
		return ceoPw;
	}
	public void setCeoPw(String ceoPw) {
		this.ceoPw = ceoPw;
	}
	public String getCeoEmail() {
		return ceoEmail;
	}
	public void setCeoEmail(String ceoEmail) {
		this.ceoEmail = ceoEmail;
	}
	public String getShopCode() {
		return shopCode;
	}
	public void setShopCode(String shopCode) {
		this.shopCode = shopCode;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getShopAddr() {
		return shopAddr;
	}
	public void setShopAddr(String shopAddr) {
		this.shopAddr = shopAddr;
	}
	public String getShopAddr1() {
		return shopAddr1;
	}
	public void setShopAddr1(String shopAddr1) {
		this.shopAddr1 = shopAddr1;
	}
	public String getShopAddr2() {
		return " " + shopAddr2;
	}
	public void setShopAddr2(String shopAddr2) {
		this.shopAddr2 = shopAddr2;
	}
	public String getShopTel() {
		return shopTel;
	}
	public void setShopTel(String shopTel) {
		this.shopTel = shopTel;
	}
	public String getTimeCode() {
		return timeCode;
	}
	public void setTimeCode(String timeCode) {
		this.timeCode = timeCode;
	}
	public String getShopImg() {
		return shopImg;
	}
	public void setShopImg(String shopImg) {
		this.shopImg = shopImg;
	}
	public String getFranchise() {
		return franchise;
	}
	public void setFranchise(String franchise) {
		this.franchise = franchise;
	}
	public String getShopCreated() {
		return shopCreated;
	}
	public void setShopCreated(String shopCreated) {
		this.shopCreated = shopCreated;
	}
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuPrice() {
		return menuPrice;
	}
	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	public String getMenuImg() {
		return menuImg;
	}
	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public MultipartFile getUploadfile2() {
		return uploadfile2;
	}
	public void setUploadfile2(MultipartFile uploadfile2) {
		this.uploadfile2 = uploadfile2;
	}
	public String getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(String oderCode) {
		this.orderCode = oderCode;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getRenum() {
		return renum;
	}
	public void setRenum(String renum) {
		this.renum = renum;
	}
	public String getReScore() {
		return reScore;
	}
	public void setReScore(String reScore) {
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
	public String getReImg() {
		return reImg;
	}
	public void setReImg(String reImg) {
		this.reImg = reImg;
	}
	public String getCeoContent() {
		return ceoContent;
	}
	public void setCeoContent(String ceoContent) {
		this.ceoContent = ceoContent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getOamount() {
		return oamount;
	}
	public void setOamount(String oamount) {
		this.oamount = oamount;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
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
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getDeliveryAddr1() {
		return deliveryAddr1;
	}
	public void setDeliveryAddr1(String deliveryAddr1) {
		this.deliveryAddr1 = deliveryAddr1;
	}
	public String getDeliveryAddr2() {
		return " " + deliveryAddr2;
	}
	public void setDeliveryAddr2(String deliveryAddr2) {
		this.deliveryAddr2 = deliveryAddr2;
	}
	public List<OrderDTO> getOrderDetail() {
		return orderDetail;
	}
	public void setOrderDetail(List<OrderDTO> orderDetail) {
		this.orderDetail = orderDetail;
	}
	public int getOsCount100() {
		return osCount100;
	}
	public void setOsCount100(int osCount100) {
		this.osCount100 = osCount100;
	}
	public int getOsCount200() {
		return osCount200;
	}
	public void setOsCount200(int osCount200) {
		this.osCount200 = osCount200;
	}
	public String getOrderDay() {
		return orderDay;
	}
	public void setOrderDay(String orderDay) {
		this.orderDay = orderDay;
	}
	public String getSumDay() {
		return sumDay;
	}
	public void setSumDay(String sumDay) {
		this.sumDay = sumDay;
	}
	public String getCodeName() {
		return codeName;
	}
	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}
	
	
}
