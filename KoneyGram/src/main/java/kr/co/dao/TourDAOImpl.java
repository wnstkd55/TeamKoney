package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.CityVO;
import kr.co.vo.TourVO;

@Repository
public class TourDAOImpl implements TourDAO{
	
	@Inject
	private SqlSession sql;
	
	// 축제 목록 조회
	@Override
	public List<TourVO> tourlist() throws Exception{
		return sql.selectList("TourMapper.tourlist");
	}
	
	@Override
	public List<TourVO> citytour() throws Exception{
		return sql.selectList("TourMapper.citytour");
	}
	
	@Override
	public TourVO tourinfo(String t_name) throws Exception{
		return sql.selectOne("TourMapper.tourinfo",t_name);
	}
	@Override
	public List<CityVO> cityname() throws Exception{
		return sql.selectList("TourMapper.cityname");
	}
}
