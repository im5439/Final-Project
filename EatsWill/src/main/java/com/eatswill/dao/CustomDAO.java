package com.eatswill.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.eatswill.dto.CustomDTO;
import com.eatswill.dto.MyDTO;

public class CustomDAO {

	private SqlSessionTemplate sessionTemplate;

	public void setSessionTemplate(SqlSessionTemplate sqlSessionTemplate) throws Exception {
		this.sessionTemplate = sqlSessionTemplate;
	}

	// ȸ�� ����
	public void insertCustom(CustomDTO dto) {

		sessionTemplate.insert("customMapper.insertCustom", dto);
	}

	public boolean selectCustom(String id) {

		String custom = sessionTemplate.selectOne("customMapper.selectCustom", id);

		// ���̵� �����ϸ� false ���
		if (custom != null && !custom.equals("")) {
			return false;
		}

		// ���̵� ������ ���
		return true;
	}

	// ȸ�� ����
	public void updateCustom(CustomDTO dto) {

		sessionTemplate.update("customMapper.updateCustom", dto);

	}

	// ȸ�� Ż��
	public void deleteCustom(String id) {

		sessionTemplate.delete("customMapper.deleteCustom", id);

	}

	// ȸ�� Ż��� ��� Ȯ��
	public boolean checkPw(String id, String pw) {

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("id", id);
		params.put("pw", pw);

		CustomDTO custom = sessionTemplate.selectOne("customMapper.checkIdPw", params);

		// ���̵� �н����尡 ��ġ���������� false ���
		if (custom == null) {
			return false;
		}

		// ��ġ�Ѵٸ� ���
		return true;
	}

	// ȸ�� ���� ���� ���ǵ� ���� ������Ʈ
	public CustomDTO renewSession(String id) {

		CustomDTO custom = sessionTemplate.selectOne("customMapper.renewSession", id);

		return custom;
	}

	// ���̵� ã��
	public CustomDTO tryId(String name, String email) {

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("user", "USERNAME");
		params.put("id", name);
		params.put("email", email);

		CustomDTO custom = sessionTemplate.selectOne("customMapper.tryIdPw", params);

		return custom;
	}

	// ��й�ȣ ã��
	public CustomDTO tryPw(String id, String email) {

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("user", "USERID");
		params.put("id", id);
		params.put("email", email);

		CustomDTO custom = sessionTemplate.selectOne("customMapper.tryIdPw", params);

		return custom;
	}

	// �α��� �� ���� ���� ��������
	public CustomDTO checkIdPw(String id, String pw) {

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("id", id);
		params.put("pw", pw);

		CustomDTO custom = sessionTemplate.selectOne("customMapper.checkIdPw", params);

		return custom;
	}

	// �ֹ�ǥ ����
	public String countCart(String id) {

		String cnt = sessionTemplate.selectOne("customMapper.countCart", id);

		return cnt;
	}
	
	// �ֹ�ǥ ����(�̵���)
	public String cartOpen(String id) {

		String cnt = sessionTemplate.selectOne("customMapper.cartOpen", id);

		return cnt;
	}

	// �ֹ� ��� ����Ʈ
	public List<MyDTO> getBuyList(String userId) {

		List<MyDTO> lists = sessionTemplate.selectList("customMapper.getBuyList", userId);

		return lists;
	}

	// �ֹ� ���
	public void myOrderCancel(String orderCode) {
		sessionTemplate.update("customMapper.myOrderCancel", orderCode);
	}

	// review �ۼ� �ÿ� ���� ���� ���
	public MyDTO getReadData(String orderCode) {

		MyDTO dto = sessionTemplate.selectOne("customMapper.getReadReviewData", orderCode);

		return dto;
	}

	// review num �ִ밪
	public int getMaxReNum() {
		int maxReNum = 0;
		maxReNum = sessionTemplate.selectOne("customMapper.maxReNum");

		return maxReNum;
	}

	// review insert
	public void reviewInsert(MyDTO dto) {
		sessionTemplate.insert("customMapper.reviewInsert", dto);
	}

	// ���� ���� ���� Ȯ��
	public int getMyReviewCnt(String userId) {
		int myReviewCnt = 0;
		myReviewCnt = sessionTemplate.selectOne("customMapper.myReviewCnt", userId);

		return myReviewCnt;
	}

	// ���� ���� ����Ʈ
	public List<MyDTO> getMyReviewList(String userId) {
		List<MyDTO> lists = sessionTemplate.selectList("customMapper.getMyReviewList", userId);

		return lists;
	}

	// review delete
	public void reviewDelete(int renum) {
		sessionTemplate.delete("customMapper.reviewDelete", renum);
	}

	// �� ���� ����Ʈ
	public List<MyDTO> getHeartList(String userId) {
		List<MyDTO> lists = sessionTemplate.selectList("customMapper.getHeartList", userId);

		return lists;
	}
}
