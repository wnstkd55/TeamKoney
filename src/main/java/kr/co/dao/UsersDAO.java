package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.UsersVO;

public interface UsersDAO {
	// 회원가입
	public void register(UsersVO vo) throws Exception;
	
	// 로그인
	public UsersVO login(UsersVO vo) throws Exception;
	
	// 회원정보수정
	public void userUpdate(UsersVO vo) throws Exception;
	
	// 회원탈퇴
	public void userDelete(UsersVO vo) throws Exception;
	
	// 패스워드 체크
	public int passChk(UsersVO vo) throws Exception;
	
	// 아이디 중복체크
	public int idChk(UsersVO vo) throws Exception;

	void userDrop(UsersVO vo) throws Exception;

	List<UsersVO> adminlist() throws Exception;

	void insertFile(Map<String, Object> map) throws Exception;
	
	public void updateFile(Map<String, Object> map) throws Exception;
	
}
