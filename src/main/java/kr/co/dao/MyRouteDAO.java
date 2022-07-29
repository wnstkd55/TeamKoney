package kr.co.dao;

import java.util.List;

import kr.co.vo.MyrouteVO;

public interface MyRouteDAO {
	public void saveTour(MyrouteVO myrouteVO) throws Exception;

	List<MyrouteVO> myroute() throws Exception;

	MyrouteVO read(int mr_id) throws Exception;

	void viewcount(int mr_id) throws Exception;
}
