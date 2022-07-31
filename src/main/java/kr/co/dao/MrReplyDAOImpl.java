package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.MrReplyVO;

@Repository
public class MrReplyDAOImpl implements MrReplyDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<MrReplyVO> list(int mr_bno) throws Exception{
		return sqlSession.selectList("MrReply.mrlist", mr_bno);
	}
	
	@Override
	public void writeMr(MrReplyVO mrvo) throws Exception{
		sqlSession.insert("MrReply.mrinsert",mrvo);
	}
	
	@Override
	public void updateMr(MrReplyVO mrvo) throws Exception{
		sqlSession.insert("MrReply.mrupdate",mrvo);
	}
	
	@Override
	public void deleteMr(MrReplyVO mrvo) throws Exception{
		sqlSession.insert("MrReply.mrdelete",mrvo);
	}
}
