package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.MyrouteVO;

@Repository
public class MyRoutedDAOImpl implements MyRouteDAO {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void saveTour(MyrouteVO myrouteVO) throws Exception {
		sqlSession.insert("TourMapper.saveroute",myrouteVO);

	}

}
