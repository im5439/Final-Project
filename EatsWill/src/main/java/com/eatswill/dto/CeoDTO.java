package com.eatswill.dto;

import org.springframework.web.multipart.MultipartFile;

public class CeoDTO {

	//����� ȸ������ ========
	private String ceoId; // ����� ���̵�
	private String ceoName; // ����� �̸�
	private String ceoPw; // ����� ��й�ȣ
	private String ceoEmail; // ����� �̸���
	//=======================
	
	//�����߰�===============
	private int shopCode; //�����ڵ�
	private String shopName; //�����
	private String category; //ī�װ�
	private String shopAddr; //�����ּ�
	private String shopAddr1;
	private String shopAddr2;
	private String shopTel; //������ȭ��ȣ
	private String timeCode; //
	private String shopImg; //�����̹���
	private String franchise; //��������������
	
	private MultipartFile uploadfile;
	//=======================

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
	public int getShopCode() {
		return shopCode;
	}
	public void setShopCode(int shopCode) {
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
	
	
	
}
