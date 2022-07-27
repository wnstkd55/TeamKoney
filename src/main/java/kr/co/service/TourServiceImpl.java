package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.dao.TourDAO;
import kr.co.vo.CityVO;
import kr.co.vo.TourVO;

@Service
public class TourServiceImpl implements TourService{
	
	@Inject
	private TourDAO dao;
	
	// 축제 목록 조회
	@Override
	public List<TourVO> tourlist() throws Exception {
		
		return dao.tourlist();
	}
	
	@Override
	public List<TourVO> citytour() throws Exception{
		return dao.citytour();
	}
	
	// 축제 조회
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public TourVO tourinfo(String t_name) throws Exception {
		return dao.tourinfo(t_name);
	}
	
	@Override
	public List<CityVO> cityname() throws Exception{
		return dao.cityname();
	}
	
	
}
