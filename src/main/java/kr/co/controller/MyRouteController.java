package kr.co.controller;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.MyRouteService;
import kr.co.vo.MyrouteVO;

@Controller
@RequestMapping("/myroute/*")
public class MyRouteController {
	
	@Inject
	MyRouteService mrservice;
	
	private static final Logger logger = LoggerFactory.getLogger(MyRouteController.class);
	
	@RequestMapping(value="/mrlist", method = RequestMethod.GET)
	public String list(Model model) throws Exception{
		logger.info("list");

		model.addAttribute("list", mrservice.mrlist());
		
		return "myroute/mrlist";
		
	}
	
	// 게시판 조회
	@RequestMapping(value = "/mrview", method = RequestMethod.GET)
	public String read(MyrouteVO mrVO, Model model) throws Exception{
		logger.info("read");
		
		model.addAttribute("read", mrservice.read(mrVO.getMr_id()));
		
		return "myroute/mrview";
	}
	
}
