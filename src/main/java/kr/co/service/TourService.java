package kr.co.service;

import java.util.List;

import kr.co.vo.CityVO;
import kr.co.vo.TourVO;

public interface TourService {

	List<TourVO> tourlist() throws Exception;

	List<TourVO> citytour() throws Exception;

	TourVO tourinfo(String t_name) throws Exception;


	List<CityVO> cityname() throws Exception;

}
