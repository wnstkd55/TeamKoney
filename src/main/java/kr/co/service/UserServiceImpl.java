package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.UsersDAO;
import kr.co.util.FileUtils;
import kr.co.vo.UsersVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private FileUtils fileUtils;
	
	@Inject UsersDAO dao;
	
	@Override
	public void register(UsersVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			dao.insertFile(list.get(i));
		}
		
		dao.register(vo);
	}

	@Override
	public UsersVO login(UsersVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public void userUpdate(UsersVO vo, MultipartHttpServletRequest mpRequest) throws Exception {
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(vo, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			dao.insertFile(list.get(i));
		}
		
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