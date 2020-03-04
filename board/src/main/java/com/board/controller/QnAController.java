package com.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.BoardVO;
import com.board.domain.FileManagerVO;
import com.board.domain.MembersVO;
import com.board.domain.QnAReVO;
import com.board.domain.QnAVO;
import com.board.domain.ReplyVO;
import com.board.domain.SearchCriteria;
import com.board.service.FileUploadService;
import com.board.service.MembersService;
import com.board.service.QnAReService;
import com.board.service.QnAService;

@Controller
@SessionAttributes
@RequestMapping("/qna/*")
public class QnAController {

	@Inject
	private QnAService qnaService;
	
	@Inject
	private QnAReService qnareService;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	/* 19.11.18 ver2 add st */
	@Autowired
	FileUploadService fileUploadService;

	/* 19.11.18 ver2 add End */

	// 회원가입
	@RequestMapping(value = "/createQnA", method = RequestMethod.GET)
	public void getCreateId() throws Exception {

	}

	// 회원가입
	@RequestMapping(value = "/createQnA", method = RequestMethod.POST)
	public String postCreateId(QnAVO vo,
			@RequestParam(value = "file1", required = true, defaultValue = "") MultipartFile file,FileManagerVO fvo) throws Exception {


		if (!(file.isEmpty() == true)) {
			/* String url = fileUploadService.restore(file); */
			fvo.setWriter(vo.getWriter());
			fvo.setWriterId(vo.getWriterId());
			String url = fileUploadService.restore2(file, fvo);
			vo.setImg(url);
		} else {
			
			  vo.setImg("");
			 
		}
		// 

		qnaService.createQnA(vo);
		/* System.out.println("back POST End"); */
		return "redirect:/";
	}

	@RequestMapping(value = "/adminList", method = RequestMethod.GET)
	public void getList(QnAVO vo,Model model, HttpSession session) throws Exception {

		List list = null;
		MembersVO member = (MembersVO) session.getAttribute("member");
		
		
		
		vo.setWriterId(member.getUserId());
		System.out.println("admign ck id = "+vo.getWriterId());
		list = qnaService.adminqna(vo);
		
		model.addAttribute("list", list);
		System.out.println(list);
	}
	
	
	@RequestMapping(value = "/viewqna", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model)
			throws Exception {	
		
		QnAVO vo = qnaService.viewqna(bno); 
		model.addAttribute("view", vo);	
		
		List<QnAReVO> replyList = qnareService.qnareList(bno);
		  
		  System.out.println(replyList.toString());
		 
		  model.addAttribute("replyList", replyList);
	}

	

}
