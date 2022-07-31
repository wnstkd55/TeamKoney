package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.UsersDAO;
import kr.co.vo.UsersVO;

@Service
public class UserServiceImpl implements UserService {

	@Inject UsersDAO dao;
	
	@Override
	public void register(UsersVO vo) throws Exception {
		dao.register(vo);
	}

	@Override
	public UsersVO login(UsersVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public void userUpdate(UsersVO vo) throws Exception {
		dao.userUpdate(vo);
	}

	@Override
	public void userDelete(UsersVO vo) throws Exception {
		dao.userDelete(vo);
	}

	@Override
	public int passChk(UsersVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}

	@Override
	public int idChk(UsersVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}

	//관리자 회원삭제
	@Override
	public void userDrop(UsersVO vo) throws Exception {
		dao.userDrop(vo);
	}

	// 회원 lsit
	@Override
	public List<UsersVO> adminlist() throws Exception {
		return dao.adminlist();
	}

}