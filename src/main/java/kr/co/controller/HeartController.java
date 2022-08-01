package kr.co.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.MyRouteService;
import kr.co.vo.HeartVO;

@Controller
@RequestMapping("/mrview/*")
public class HeartController {
	
	@Inject
	MyRouteService mrservice;
	
	 @ResponseBody 
	    @RequestMapping(method = RequestMethod.POST, value = "/click")
	    public int heartClick(@RequestBody HeartVO dto){
	        HeartVO likeCheck = mrservice.findLike(dto.getMr_id(),dto.getUserId());
	        if(likeCheck == null){
	        	mrservice.likesPush(dto.getMr_id(),dto.getUserId());
	            return 0;
	        }else {
	        	mrservice.likesCancel(dto.getMr_id(),dto.getUserId());
	            return 1;
	        }
	    }
	
}
