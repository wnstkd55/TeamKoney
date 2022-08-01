package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.MyRouteDAO;
import kr.co.vo.HeartVO;
import kr.co.vo.MyrouteVO;

@Service
public class MyRouteServiceImpl implements MyRouteService {
	
	@Inject
	private MyRouteDAO dao;

	// my_route 저장
	@Override
	public void saveTour(MyrouteVO myrouteVO) throws Exception {
		dao.saveTour(myrouteVO);
		
	}
	
	@Override
	public List<MyrouteVO> mrlist() throws Exception {
		return dao.myroute();
	}
	
	// 게시물 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public MyrouteVO read(int mr_id) throws Exception {
		dao.viewcount(mr_id);
		dao.replycount(mr_id);
		return dao.read(mr_id);
	}
	
	 //좋아요 누를경우
    @Transactional(rollbackFor = Exception.class)
    public int likesPush(Integer mr_id, String userId){
    	dao.likePush(mr_id,userId);
        return dao.likeCntUp(mr_id);
    }
    //좋아요 취소할 경우
    @Transactional(rollbackFor = Exception.class)
    public int likesCancel(Integer mr_id, String userId){
    	dao.likeCancel(mr_id,userId);
        return dao.likeCntDown(mr_id);
    }
    @Override
    public HeartVO findLike(Integer mr_id, String userId){
        return dao.findLike(mr_id,userId);
    }


}
