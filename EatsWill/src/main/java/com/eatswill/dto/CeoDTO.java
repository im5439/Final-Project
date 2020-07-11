package com.eatswill.dto;

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
	private String oderCode; //�ֹ��ڵ�
	private String pnum; // ���� ��۹�ȣ
	private String renum; // ��� ��ȣ(pk)
	private String reScore; // ����
	private String reContent; // ���� ����
	private String reCreated; // ���� �ۼ���
	private String reImg; // ���� �̹���
	//=======================
	
	private String userId;
	private String menuName;

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
		return " "+shopAddr2;
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
	public MultipartFile getUploadfile() {
		return uploadfile;
	}
	public void setUploadfile(MultipartFile uploadfile) {
		this.uploadfile = uploadfile;
	}
	public String getShopCreated() {
		return shopCreated;
	}
	public void setShopCreated(String shopCreated) {
		this.shopCreated = shopCreated;
	}
	public String getOderCode() {
		return oderCode;
	}
	public void setOderCode(String oderCode) {
		this.oderCode = oderCode;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	
	
	
}
