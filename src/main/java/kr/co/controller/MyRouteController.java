package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.MrReplyService;
import kr.co.service.MyRouteService;
import kr.co.service.UserService;
import kr.co.vo.HeartVO;
import kr.co.vo.MrReplyVO;
import kr.co.vo.MyrouteVO;

@Controller
@RequestMapping("/myroute/*")
public class MyRouteController {
	
	@Inject
	MyRouteService mrservice;
	
	@Inject
	UserService userservice;
	
	@Autowired
	@Lazy
	MrReplyService mrrservice;
	
	
	private static final Logger logger = LoggerFactory.getLogger(MyRouteController.class);
	
	//전체 유저 일정보기
	@RequestMapping(value="/mrlist", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("list");

		model.addAttribute("list", mrservice.mrlist());
		model.addAttribute("userlist", userservice.userlist());
		
		return "myroute/mrlist";
		
	}
	
	//나의 일정 보기
	@RequestMapping(value="/mplist", method = RequestMethod.GET)
	public String mplist(Model model, @RequestParam("userId") String userId) throws Exception{

		model.addAttribute("mplist", mrservice.mplist(userId));
		
		return "myroute/mplist";
		
	}
	
	// 게시판 조회
	@RequestMapping(value = "/mrview", method = RequestMethod.GET)
	public String read(MyrouteVO mrVO, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", mrservice.read(mrVO.getMr_id()));
		model.addAttribute("reply",new MrReplyVO());
		model.addAttribute("ru", mrrservice.finduser());
		
		return "myroute/mrview";
	}
	
	//일정 삭제
		@RequestMapping(value = "/mrdelete", method = RequestMethod.GET)
		public String delete(@RequestParam("mr_id") int mr_id) throws Exception{
			logger.info("delete");
			
			mrservice.delete(mr_id);
			
			return "redirect:/myroute/mrlist";
		}
	
	
	
	  @ResponseBody
	  
	  @RequestMapping(method = RequestMethod.POST, value = "/mrview/click") public int
	  heartClick(@RequestBody HeartVO dto){ HeartVO likeCheck =
	  mrservice.findLike(dto.getMr_id(),dto.getUserId()); if(likeCheck == null){
	  mrservice.likesPush(dto.getMr_id(),dto.getUserId()); return 0; }else {
	  mrservice.likesCancel(dto.getMr_id(),dto.getUserId()); return 1; } }
	 
	
}
