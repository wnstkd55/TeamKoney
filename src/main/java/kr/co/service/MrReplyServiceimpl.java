package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.MrReplyDAO;
import kr.co.vo.Criteria;
import kr.co.vo.MrReplyVO;

@Service
public class MrReplyServiceimpl implements MrReplyService{
	
	@Autowired
	private MrReplyDAO dao;
	
	@Override
	public List<MrReplyVO> list(int mr_bno) throws Exception{
		return dao.list(mr_bno);
	}
	
	@Override
	public void writeMr(MrReplyVO mrvo) throws Exception{
		dao.writeMr(mrvo);
	}
	
	@Override
	public void updateMr(MrReplyVO mrvo) throws Exception{
		dao.updateMr(mrvo);
	}
	
	@Override
	public void deleteMr(MrReplyVO mrvo) throws Exception{
		dao.deleteMr(mrvo);
	}
	
}
