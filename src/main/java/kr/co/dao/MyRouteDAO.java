package kr.co.dao;

import java.util.List;

import kr.co.vo.HeartVO;
import kr.co.vo.MyrouteVO;

public interface MyRouteDAO {
	public void saveTour(MyrouteVO myrouteVO) throws Exception;

	List<MyrouteVO> myroute() throws Exception;

	MyrouteVO read(int mr_id) throws Exception;

	void viewcount(int mr_id) throws Exception;

	void replycount(int mr_id) throws Exception;

	HeartVO findLike(Integer mr_id, String userId);

	int likePush(Integer mr_id, String userId);

	int likeCancel(Integer mr_id, String userId);

	int likeCntUp(Integer mr_id);

	int likeCntDown(Integer mr_id);
}
