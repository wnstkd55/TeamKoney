package kr.co.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.UsersVO;

@Repository
public class UsersDAOImpl implements UsersDAO{

	@Inject SqlSession sql;
	
	@Override
	public void register(UsersVO vo) throws Exception {
		sql.insert("userMapper.register", vo);
	}

	@Override
	public UsersVO login(UsersVO vo) throws Exception {
		return sql.selectOne("userMapper.login", vo);
	}

	@Override
	public void userUpdate(UsersVO vo) throws Exception {
		sql.update("userMapper.userUpdate", vo);
	}

	@Override
	public void userDelete(UsersVO vo) throws Exception {
		sql.delete("userMapper.userDelete", vo);
	}

	@Override
	public int passChk(UsersVO vo) throws Exception {
		int result = sql.selectOne("userMapper.passChk", vo);
		return result;
	}

	@Override
	public int idChk(UsersVO vo) throws Exception {
		int result = sql.selectOne("userMapper.idChk", vo);
		return result;
	}

	// 관리자 회원삭제
	@Override
	public void userDrop(UsersVO vo) throws Exception {
		sql.delete("userMapper.userDrop", vo);
		
	}
	
	//관리자 list
	@Override
	public List<UsersVO> adminlist() throws Exception {
		return sql.selectList("userMapper.adminlist");
	}
	
	// 프로필 사진 업로드
	@Override
	public void insertFile(Map<String, Object> map) throws Exception {
		sql.insert("userMapper.insertFile", map);
	}
	
	// 프로필 사진 수정
	@Override
	public void updateFile(Map<String, Object> map) throws Exception {
		sql.update("userMapper.updateFile", map);
	}
	
	//유저리스트
	@Override
	public List<UsersVO> userlist() throws Exception{
		return sql.selectList("userMapper.userlist");
	}
	
}