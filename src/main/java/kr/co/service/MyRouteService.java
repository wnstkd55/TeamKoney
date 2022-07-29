package kr.co.service;

import java.util.List;

import kr.co.vo.MyrouteVO;

public interface MyRouteService {
	// my_toute 저장
	public void saveTour(MyrouteVO myrouteVO) throws Exception;

	MyrouteVO read(int mr_id) throws Exception;

	List<MyrouteVO> mrlist() throws Exception;

}
