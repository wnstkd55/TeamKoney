package kr.co.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.MyRouteService;
import kr.co.vo.MyrouteVO;
import kr.co.vo.UsersVO;

@Controller
@RequestMapping("/tours/*")
public class TourController {
	
	private static final Logger logger = LoggerFactory.getLogger(TourController.class);
	
	@Autowired
	MyRouteService routeService;
	
	  @RequestMapping(value="/tour", method = RequestMethod.GET)
	  public String city(Model m) throws Exception{
		  
		  return "tours/tour";
	  }
	  
		
		
		@RequestMapping(value = "/makesche",method = RequestMethod.GET)
		public String register (Model m) throws Exception {
		    return "tours/makesche";
		}
		
		
		  @RequestMapping(value = "/makesche", method = RequestMethod.POST) 
		  public String saveroute(MyrouteVO myroutevo) {
			  
		  
			  return "redirect:";
		  }
		  
			@RequestMapping(value ="/tours/saveTour", method = RequestMethod.GET)
			public void getRoute() throws Exception{
				logger.info("getRoute");
				
			}
			
			
			@RequestMapping(value = "/tours/saveTour", method = RequestMethod.POST)
			public String saveTour(MyrouteVO myrouteVO) throws Exception{
				logger.info("saveTour");
				routeService.saveTour(myrouteVO);
				
				return "redirect:/tours/tour";
			}
	
}
