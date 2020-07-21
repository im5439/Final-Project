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

	// 회원 가입
	public void insertCustom(CustomDTO dto) {

		sessionTemplate.insert("customMapper.insertCustom", dto);
	}

	public boolean selectCustom(String id) {

		String custom = sessionTemplate.selectOne("customMapper.selectCustom", id);

		// 아이디가 존재하면 false 출력
		if (custom != null && !custom.equals("")) {
			return false;
		}

		// 아이디가 없으면 통과
		return true;
	}

	// 회원 수정
	public void updateCustom(CustomDTO dto) {

		sessionTemplate.update("customMapper.updateCustom", dto);

	}

	// 회원 탈퇴
	public void deleteCustom(String id) {

		sessionTemplate.delete("customMapper.deleteCustom", id);

	}

	// 회원 탈퇴시 비번 확인
	public boolean checkPw(String id, String pw) {

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("id", id);
		params.put("pw", pw);

		CustomDTO custom = sessionTemplate.selectOne("customMapper.checkIdPw", params);

		// 아이디 패스워드가 일치하지않으면 false 출력
		if (custom == null) {
			return false;
		}

		// 일치한다면 통과
		return true;
	}

	// 회원 수정 이후 세션도 같이 업데이트
	public CustomDTO renewSession(String id) {

		CustomDTO custom = sessionTemplate.selectOne("customMapper.renewSession", id);

		return custom;
	}

	// 아이디 찾기
	public CustomDTO tryId(String name, String email) {

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("user", "USERNAME");
		params.put("id", name);
		params.put("email", email);

		CustomDTO custom = sessionTemplate.selectOne("customMapper.tryIdPw", params);

		return custom;
	}

	// 비밀번호 찾기
	public CustomDTO tryPw(String id, String email) {

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("user", "USERID");
		params.put("id", id);
		params.put("email", email);

		CustomDTO custom = sessionTemplate.selectOne("customMapper.tryIdPw", params);

		return custom;
	}

	// 로그인 시 세션 정보 가져오기
	public CustomDTO checkIdPw(String id, String pw) {

		HashMap<String, Object> params = new HashMap<String, Object>();

		params.put("id", id);
		params.put("pw", pw);

		CustomDTO custom = sessionTemplate.selectOne("customMapper.checkIdPw", params);

		return custom;
	}

	// 주문표 개수
	public String countCart(String id) {

		String cnt = sessionTemplate.selectOne("customMapper.countCart", id);

		return cnt;
	}
	
	// 주문표 내역(이동용)
	public String cartOpen(String id) {

		String cnt = sessionTemplate.selectOne("customMapper.cartOpen", id);

		return cnt;
	}

	// 주문 목록 리스트
	public List<MyDTO> getBuyList(String userId) {

		List<MyDTO> lists = sessionTemplate.selectList("customMapper.getBuyList", userId);

		return lists;
	}

	// 주문 취소
	public void myOrderCancel(String orderCode) {
		sessionTemplate.update("customMapper.myOrderCancel", orderCode);
	}

	// review 작성 시에 가게 정보 출력
	public MyDTO getReadData(String orderCode) {

		MyDTO dto = sessionTemplate.selectOne("customMapper.getReadReviewData", orderCode);

		return dto;
	}

	// review num 최대값
	public int getMaxReNum() {
		int maxReNum = 0;
		maxReNum = sessionTemplate.selectOne("customMapper.maxReNum");

		return maxReNum;
	}

	// review insert
	public void reviewInsert(MyDTO dto) {
		sessionTemplate.insert("customMapper.reviewInsert", dto);
	}

	// 나의 리뷰 개수 확인
	public int getMyReviewCnt(String userId) {
		int myReviewCnt = 0;
		myReviewCnt = sessionTemplate.selectOne("customMapper.myReviewCnt", userId);

		return myReviewCnt;
	}

	// 나의 리뷰 리스트
	public List<MyDTO> getMyReviewList(String userId) {
		List<MyDTO> lists = sessionTemplate.selectList("customMapper.getMyReviewList", userId);

		return lists;
	}

	// review delete
	public void reviewDelete(int renum) {
		sessionTemplate.delete("customMapper.reviewDelete", renum);
	}

	// 찜 매장 리스트
	public List<MyDTO> getHeartList(String userId) {
		List<MyDTO> lists = sessionTemplate.selectList("customMapper.getHeartList", userId);

		return lists;
	}
}
