package com.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.Mapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.FileManagerVO;
import com.board.domain.PageMaker;
import com.board.domain.ReplyVO;
import com.board.domain.SearchCriteria;
import com.board.service.BoardService;
import com.board.service.FileUploadService;
import com.board.service.ManagementService;
import com.board.service.ReplyService;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	@Autowired
	private ReplyService repService;
	
	@Autowired
	private ManagementService MGService;
	
	/* 19.11.18 ver2 add st*/
	@Autowired
	FileUploadService fileUploadService;
	
	/* 19.11.18 ver2 add End*/

	/*
	 * @Inject private ReplyService repService;
	 */

	// 게시물 조회
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception {

		List list = null;
		list = service.list();
		model.addAttribute("list", list);
	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWirte(HttpSession session,Model model) throws Exception {
		
		Object loginInfo = session.getAttribute("member");
		System.out.println(loginInfo);
		
		if(loginInfo == null) {
			model.addAttribute("msg2",false);
		}
	}

	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String posttWirte(BoardVO vo,@RequestParam(value="file1" ,required=true,defaultValue ="") MultipartFile file,FileManagerVO fvo
			,@RequestParam(value = "writerType", defaultValue= "false") boolean writerType) throws Exception {
		
		/*  */
		
		if(writerType==true) {
			vo.setWriterType("1");
		}else {
			vo.setWriterType("0");
			vo.setBoardPass("");
		}
		
		System.out.println(vo.getWriterType());
		System.out.println(vo.getBoardPass());
		
		if(!(file.isEmpty()==true)) {
			
			fvo.setWriter(vo.getWriter());
			fvo.setWriterId(vo.getWriterId());
			String url = fileUploadService.restore2(file,fvo);
			vo.setImgUrl(url);
		}else {
			vo.setImgUrl("");
			
		}
		/*  */
		
		System.out.println("write"+vo);
		
		service.write(vo);

		return "redirect:/board/listSearch";
	}

	// 게시물 조회
	/*
	 * @RequestMapping(value = "/view", method = RequestMethod.GET) public void
	 * getView(@RequestParam("bno") int bno, @ModelAttribute("scri") SearchCriteria
	 * scri, Model model, HttpSession session) throws Exception {
	 * 
	 * Object loginInfo = session.getAttribute("member");
	 * System.out.println("loginfo = "+loginInfo); if(loginInfo == null) {
	 * model.addAttribute("msg2",false);
	 * 
	 * }
	 * 
	 * BoardVO vo = service.view(bno);
	 * 
	 * service.viewCnt(bno);
	 * 
	 * 
	 * model.addAttribute("view", vo); model.addAttribute("scri", scri);
	 * 
	 * 
	 * System.out.println("controller ST");
	 * 
	 * List<ReplyVO> replyList = repService.replyList(bno);
	 * 
	 * System.out.println(replyList.toString());
	 * 
	 * model.addAttribute("replyList", replyList);
	 * 
	 * System.out.println("controller End");
	 * 
	 * }
	 */
	
	/* 19.11.21 ver2 수정 조회수증가 방지 시작*/
	// 게시물 조회
		@RequestMapping(value = "/view", method = RequestMethod.GET)
		public void getView(@RequestParam("bno") int bno, @ModelAttribute("scri") SearchCriteria scri, Model model, HttpSession session)
				throws Exception {
			
			Object loginInfo = session.getAttribute("member");
			System.out.println("loginfo = "+loginInfo);
			if(loginInfo == null) {
				model.addAttribute("msg2",false);
				
			}
			
			BoardVO vo = service.view(bno);
			System.out.println(vo);
			
			if(!(vo.getImgUrl()==null)) {
				String savename[] = vo.getImgUrl().split("/");
				
				System.out.println(savename[2]);
				FileManagerVO fvo = MGService.fileName(savename[2]);
			/* model.addAttribute("delete", true); */
				if(fvo==null) {
					vo.setImgUrl("/fileupload/2019111725626795.png");
					model.addAttribute("delete", false);
					
					
				}else {
					long size = fvo.getFileSize()/1024;
					
					fvo.setFileSize(size);
					model.addAttribute("filename", fvo);	
				}
			}
			
			
			
			
		
			model.addAttribute("view", vo);
			
			
			
			Object vi = session.getAttribute("visit"+bno);			
			
			System.out.println("if vi St ");
			
			if(vi==null) {
				System.out.println("vi is null, first visit page");
				session.setAttribute("visit"+bno, bno);	
				service.viewCnt(bno);
			}else if(!(vi.equals(bno))) {
				
				session.setAttribute("visit"+bno, bno);
				System.out.println("before vi different ");
				service.viewCnt(bno);
			}
			System.out.println("if vi end ");			
			
			
			
			List<ReplyVO> replyList = repService.replyList(bno);
			  
			  System.out.println(replyList.toString());
			 
			  model.addAttribute("replyList", replyList);

		}
	
		/* 19.11.21 ver2 수정 조회수증가 방지 끝*/

	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model, HttpSession session) throws Exception {
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg2",false);
			
		}

		BoardVO vo = service.view(bno);
		
		System.out.println("get img"+vo.getImgUrl());
		
		if(vo.getImgUrl()==null) {
			System.out.println("no Img");
			session.setAttribute("img"+bno, "");
		}else {
			System.out.println("have Img");
			session.setAttribute("img"+bno, vo.getImgUrl());
		}

		model.addAttribute("view", vo);
	}

	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(@RequestParam(value = "imgck", defaultValue= "false") boolean imgck,@RequestParam("bno") int bno,BoardVO vo,@RequestParam(value="file1" ,required=true,defaultValue ="") MultipartFile file,HttpSession session, FileManagerVO fvo) throws Exception {
		
		/*  */
		System.out.println("imgck"+imgck);
		
		
		
		String img = (String) session.getAttribute("img"+bno);
		System.out.println("modify before img state = "+img);
		
		if(img.equals("")) {
			//기존 img 없을때
			if(!(file.isEmpty()==true)) {
				fvo.setWriter(vo.getWriter());
				fvo.setWriterId(vo.getWriterId());
				String url = fileUploadService.restore2(file,fvo);
				vo.setImgUrl(url);
			}else {
				vo.setImgUrl("");
				
			}
		}else {
			//기존 img있을때
			if(!(file.isEmpty()==true)) {
				/* String url = fileUploadService.restore(file); */
				fvo.setWriter(vo.getWriter());
				fvo.setWriterId(vo.getWriterId());
				String url = fileUploadService.restore2(file,fvo);
				vo.setImgUrl(url);
			}else {
				if(imgck==true) {
					//img 제거
					
					vo.setImgUrl("");
				}else {
					vo.setImgUrl(img);
				}
				
				
			}
		}
		
		
		
		/*  */

		service.modify(vo);

		return "redirect:/board/view?bno=" + vo.getBno();
	}

	// 글 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public void getDelete(@RequestParam("bno") int bno, Model model,HttpSession session) throws Exception {
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg2",false);
			
		}
		 
		BoardVO vo = service.view(bno);

		model.addAttribute("view", vo);

	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String postDelete(BoardVO vo) throws Exception {
		
		service.delete(vo);
		return "redirect:/board/listSearch";
	}

	// 게시물 조회
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, Criteria cri) throws Exception {

		List list;
		list = service.listPage(cri);
		model.addAttribute("list", list);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount());
		model.addAttribute("pageMaker", pageMaker);
	}

	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/listSearch", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model, HttpSession session) throws Exception {

		List list = service.listSearch(scri);
		model.addAttribute("list", list);
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg",false);
			
		}

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		// pageMaker.setTotalCount(service.listCount());
		pageMaker.setTotalCount(service.countSearch(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	////////////////// ReplyController ////////////

	// 댓글 작성

	@RequestMapping(value = "/view", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo,Model model, HttpSession session) throws Exception {
		
		
		/*
		 * Object loginInfo = session.getAttribute("member");
		 * 
		 * if(loginInfo == null) { model.addAttribute("msg",false);
		 * System.out.println("loginInfo false"); }else {
		 * System.out.println("loginInfo true"); }
		 */
		
		

		System.out.println("replywrite call");
		/*
		 * if(vo.getWriter()=="") { System.out.println("Null"); return
		 * "redirect:/board/view?bno=" + vo.getBno(); }
		 */
		System.out.println(vo);
		repService.replywrite(vo);
		System.out.println("retrun controller replywrite");

		return "redirect:/board/view?bno=" + vo.getBno();
	}
	
	
	@RequestMapping(value = "/replyWrite", method = RequestMethod.POST)
	public String test(ReplyVO vo,Model model, HttpSession session) throws Exception {
		
		
		/*
		 * Object loginInfo = session.getAttribute("member");
		 * 
		 * if(loginInfo == null) { model.addAttribute("msg",false);
		 * System.out.println("loginInfo false"); }else {
		 * System.out.println("loginInfo true"); }
		 */
		
		
		System.out.println("test");
		System.out.println("replywrite call");
		/*
		 * if(vo.getWriter()=="") { System.out.println("Null"); return
		 * "redirect:/board/view?bno=" + vo.getBno(); }
		 */
		System.out.println(vo);
		repService.replywrite(vo);
		System.out.println("retrun controller replywrite");

		return "redirect:/board/view?bno=" + vo.getBno();
	}

	// 글 삭제

	@RequestMapping(value = "/replyDelete", method = RequestMethod.GET)
	public void getReplyDelete(@RequestParam("bno") int bno,@RequestParam("writer") String writer, Model model,HttpSession session) throws Exception {
		
		Object loginInfo = session.getAttribute("member");
		
		if(loginInfo == null) {
			model.addAttribute("msg2",false);
		}
		BoardVO vo = service.view(bno);

		model.addAttribute("view", vo);
		model.addAttribute("writer", writer);

	}

	@RequestMapping(value = "/replyDelete", method = RequestMethod.POST)
	public String postReplyDelete(ReplyVO vo) throws Exception {

		System.out.println("rep Delete Cont Start");
		System.out.println(vo);
		repService.replyDelete(vo);

		System.out.println("rep Delete Cont End");
		return "redirect:/board/view?bno=" + vo.getBno();
	}

}