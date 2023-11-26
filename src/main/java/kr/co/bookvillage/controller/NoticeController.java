package kr.co.bookvillage.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.bookvillage.dto.NoticeDto;
import kr.co.bookvillage.service.NoticeService;
import lombok.RequiredArgsConstructor;

@RequestMapping(value="/support")
@RequiredArgsConstructor
@Controller
public class NoticeController {
	 
	private final NoticeService noticeService;
	  
	@GetMapping("/list.do")
	public String list( ) {
		return "support/list";
	}
	
	@GetMapping("/write.form")
	public String write( ) {
		return "support/write";
	}
	@PostMapping("/add.do")
	 public String add(MultipartHttpServletRequest multipartRequest
             , RedirectAttributes redirectAttributes) throws Exception {
		boolean addResult = noticeService.addNotice(multipartRequest);
		redirectAttributes.addFlashAttribute("addResult", addResult);
		return "redirect:/support/list.do";
	}
	
	@ResponseBody
	@GetMapping(value="/getList.do", produces="application/json")
	public Map<String, Object> getList(HttpServletRequest request){
		return noticeService.getNoticeList(request);
	}

    @GetMapping("/faq.do")
	public String faqlist( ) {
		return "support/faq";
	}
	

}
