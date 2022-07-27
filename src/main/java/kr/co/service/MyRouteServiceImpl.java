package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.MyRouteDAO;
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

}
