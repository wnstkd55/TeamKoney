package kr.co.service;

import java.util.List;

import kr.co.vo.HeartVO;
import kr.co.vo.MyrouteVO;

public interface MyRouteService {
	// my_toute 저장
	public void saveTour(MyrouteVO myrouteVO) throws Exception;

	MyrouteVO read(int mr_id) throws Exception;

	List<MyrouteVO> mrlist() throws Exception;

	HeartVO findLike(Integer mr_id, String userId);
	
	int likesPush(Integer mr_id, String userId); //좋아요 버튼클릭
	
	int likesCancel(Integer mr_id, String userId); //좋아요버튼취소
}
