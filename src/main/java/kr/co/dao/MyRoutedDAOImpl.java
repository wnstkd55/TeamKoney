package kr.co.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.HeartVO;
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
	public List<MyrouteVO> mproute(String userId) throws Exception{
		return sqlSession.selectList("myroute.mplist",userId);
	}
	
	@Override
	public MyrouteVO read(int mr_id) throws Exception{
		return sqlSession.selectOne("myroute.read",mr_id);
	}
	
	@Override
	public void delete(int mr_id) throws Exception {
		
		sqlSession.delete("myroute.delete", mr_id);
	}
	@Override
	public void viewcount(int mr_id) throws Exception {
		sqlSession.update("myroute.viewcount", mr_id);
	}
	
	@Override
	public void replycount(int mr_id) throws Exception{
		sqlSession.update("myroute.updateReplyCount",mr_id);
	}
	
	@Override
    public HeartVO findLike(Integer mr_id, String userId) {
        Map map = new HashMap();
        map.put("mr_id", mr_id);
        map.put("userId", userId);
        return sqlSession.selectOne("myroute.findLike", map);
    }
    @Override
    public int likePush(Integer mr_id, String userId) {
        Map map = new HashMap();
        map.put("mr_id", mr_id);
        map.put("userId", userId);
        return sqlSession.update("myroute.likePush", map);
    }
    @Override
    public int likeCancel(Integer mr_id, String userId) {
        Map map = new HashMap();
        map.put("mr_id", mr_id);
        map.put("userId", userId);
        return sqlSession.update("myroute.likeCancel", map);
    }
    @Override
    public int likeCntUp(Integer mr_id) {
        return sqlSession.update("myroute.likeCntUp", mr_id);
    }
    @Override
    public int likeCntDown(Integer mr_id) {
        return sqlSession.update("myroute.likeCntDown", mr_id);
    }
	
}
