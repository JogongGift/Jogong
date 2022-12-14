package bit.data.controller;



import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import bit.data.dto.FaqCategoryDto;
import bit.data.dto.FaqDto;
import bit.data.dto.NoticeDto;
import bit.data.dto.QnaCategoryDto;
import bit.data.dto.QnaDto;
import bit.data.service.CscenterServiceInter;

@Controller
@RequestMapping("/cscenter")
public class CscenterController {

	@Autowired
	CscenterServiceInter csService;
	
	@GetMapping("/faq")
	public String faq(Model model,HttpServletRequest request) {
			String num= request.getParameter("num");
			if(num==null) {
				num = "1";
			}
			
			if (num.equals("1")) {
				List<NoticeDto> notice=csService.getAllNotice();
				model.addAttribute("notice",notice);
			}
			List<FaqDto> list1=csService.getFaqByNum(Integer.parseInt(num));
			List<FaqCategoryDto> faqCa=csService.getFaqCategory();
			String category=csService.selFaqCategory(Integer.parseInt(num));
			model.addAttribute("list",list1);
			model.addAttribute("faqCa", faqCa);
			model.addAttribute("category",category);
			model.addAttribute("num",num);
	
		return "/bit/cscenter/faqform";
	}

	@GetMapping("/faq/search")
	public String faqsearch(Model model,HttpServletRequest request) {
			String searchword= request.getParameter("searchword");
			List<FaqDto> list3=csService.getSearchFaq(searchword);
			int totalcount=csService.getTcFaq(searchword);
			model.addAttribute("list3",list3);
			model.addAttribute("totalcount", totalcount);
			model.addAttribute("searchword", searchword);

		return "/bit/cscenter/faqsearch";
	}
	@GetMapping("/notice")
	public String faqnotice(Model model,HttpServletRequest request) {
		List<NoticeDto> notice=csService.getAllNotice();
		model.addAttribute("notice",notice);

		return "/bit/cscenter/notice";
	}
	
	   @GetMapping("/qnaform")
	   public String qnaform(Model model) {
	         
	      List<QnaCategoryDto> list=csService.selQnaCategory();
	      //System.out.println(list.size());
	      model.addAttribute("list",list);
	         
	      return "/bit/cscenter/qnaform";
	   }
	   
	   
	   
	   @PostMapping("/qnainsert")
	   public ModelAndView insert(QnaDto dto, HttpServletRequest request, MultipartFile upload, Model model)
	   {
	      // ????????? ?????? + ?????? ??????
	      String path = request.getSession().getServletContext().getRealPath("/resources/upload");
//	      System.out.println("upload path : " + path);
	      
	      // ?????? ?????? ??? + ??????
	      String originFileName = upload.getOriginalFilename();
//	      System.out.println("originFileName : " + originFileName);

	      
	      try {
	    	  //upload ???????????? ?????????
	    	  if(!upload.isEmpty()) {
	    	  
	    		  upload.transferTo(new File(path + "/" +originFileName));
	    		  
	    		  dto.setImageUrl(originFileName);
	    		  
    		  //upload ???????????? ????????????
	    	  }else {
	    		  
	    		  dto.setImageUrl(null);
	    	  }
	    	  
	    	  
	      } catch (IllegalStateException e) {
	    	  // TODO Auto-generated catch block
	          e.printStackTrace();
	      } catch (IOException e) {
	    	  // TODO Auto-generated catch block
	    	  e.printStackTrace();
	      }

	      
	      String qnaStatus="???????????????";
	      dto.setQnaStatus(qnaStatus);
	        
	      // db??? insert : service??? insertQna??? dto??? ??????
	      csService.insertQna(dto);
	      
	      
	      ModelAndView mv = new ModelAndView();
          mv.setViewName("/alert/alert");
          mv.addObject("msg1", "????????? ?????????????????????.");
          mv.addObject("msg2", "??? ?????????????????? ???????????????.");
          mv.addObject("url", "/jogong/mypage/qna");
          return mv;
	      
	   }
	   
	
}