package kr.co.dao;

import java.util.List;

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
	
	@Override
	public List<MyrouteVO> myroute() throws Exception {
		
		return sqlSession.selectList("myroute.myroutelist");
	}
	
	@Override
	public MyrouteVO read(int mr_id) throws Exception{
		return sqlSession.selectOne("myroute.read",mr_id);
	}
	
	@Override
	public void viewcount(int mr_id) throws Exception {
		sqlSession.update("myroute.viewcount", mr_id);
	}
	
	@Override
	public void replycount(int mr_id) throws Exception{
		sqlSession.update("myroute.updateReplyCount",mr_id);
	}

}
