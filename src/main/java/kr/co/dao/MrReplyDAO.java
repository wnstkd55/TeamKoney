package kr.co.dao;

import java.util.List;

import kr.co.vo.Criteria;
import kr.co.vo.MrReplyVO;

public interface MrReplyDAO {

	List<MrReplyVO> list(int mr_bno) throws Exception;

	void writeMr(MrReplyVO mrvo) throws Exception;

	void updateMr(MrReplyVO mrvo) throws Exception;

	void deleteMr(MrReplyVO mrvo) throws Exception;

	List<MrReplyVO> finduser() throws Exception;

	
}
