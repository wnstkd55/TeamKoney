package kr.co.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.UsersVO;

public interface UserService {
	
	// 회원가입
	void register(UsersVO vo, MultipartHttpServletRequest mpRequest) throws Exception;
	
	// 로그인
	public UsersVO login(UsersVO vo) throws Exception;
	
	// 회원정보수정
	public void userUpdate(UsersVO vo) throws Exception;
	
	// 회원탈퇴
	public void userDelete(UsersVO vo) throws Exception;
	
	// 패스워드 체크
	public int passChk(UsersVO vo) throws Exception;
	
	// 아이디 중복 체크
	public int idChk(UsersVO vo) throws Exception;

	void userDrop(UsersVO vo) throws Exception;

	List<UsersVO> adminlist() throws Exception;

}
