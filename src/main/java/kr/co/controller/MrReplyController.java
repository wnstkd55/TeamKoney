package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.service.MrReplyService;
import kr.co.vo.MrReplyVO;

@RestController
@RequestMapping("/mrview/*")
public class MrReplyController {
	
	@Autowired
	@Lazy
	private MrReplyService mrreplyservice;
	
	@RequestMapping(value = "/mrrlist/{mr_bno}", method = RequestMethod.POST)
	public List<MrReplyVO> mrlist(@PathVariable int mr_bno) throws Exception{
		List<MrReplyVO> mrlist = mrreplyservice.list(mr_bno);
		
		return mrlist;
	}
	
	@RequestMapping(value = "/mrwrite/{mr_bno}/{mr_writer}/{mr_content}", method = RequestMethod.POST)
	public Map<String,Object> mrwrite(@PathVariable int mr_bno, @PathVariable String mr_writer,
			@PathVariable String mr_content){
		Map<String,Object> map = new HashMap<String,Object>();
		
		try {
			MrReplyVO mrvo = new MrReplyVO();
			mrvo.setMr_bno(mr_bno);
			mrvo.setMr_writer(mr_writer);
			mrvo.setMr_content(mr_content);
			mrreplyservice.writeMr(mrvo);
			
			map.put("result", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
	
	@RequestMapping(value = "/mrupdate/{mr_no}/{mr_content}", method = RequestMethod.POST)
	public Map<String,Object> mrupdate(@PathVariable int mr_no,
			@PathVariable String mr_content){
		Map<String,Object> map = new HashMap<String,Object>();
		
		try {
			MrReplyVO mrvo = new MrReplyVO();
			mrvo.setMr_no(mr_no);
			mrvo.setMr_content(mr_content);
			mrreplyservice.updateMr(mrvo);
			
			map.put("result", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
	
	@RequestMapping(value = "/mrdelete/{mr_no}", method = RequestMethod.POST)
	public Map<String,Object> mrdelete(@PathVariable int mr_no){
		Map<String,Object> map = new HashMap<String,Object>();
		
		try {
			MrReplyVO mrvo = new MrReplyVO();
			mrvo.setMr_no(mr_no);
			mrreplyservice.deleteMr(mrvo);
			
			map.put("result", "success");
			
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
}
