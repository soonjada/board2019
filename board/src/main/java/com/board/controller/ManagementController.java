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
import com.board.domain.PageMaker;
import com.board.domain.QnAReVO;
import com.board.domain.QnAVO;
import com.board.domain.ReplyVO;
import com.board.domain.SearchCriteria;
import com.board.service.BoardService;
import com.board.service.FileUploadService;
import com.board.service.ManagementService;
import com.board.service.MembersService;
import com.board.service.QnAReService;
import com.board.service.ReplyService;

@Controller
@SessionAttributes
@RequestMapping("/management/*")
public class ManagementController {

	@Inject
	private ManagementService MgService;

	@Inject
	private QnAReService MgQService;

	@Inject
	private ReplyService repService;

	@Inject
	private BoardService Service;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	/* 19.11.18 ver2 add st */
	@Autowired
	FileUploadService fileUploadService;

	/* 19.11.18 ver2 add End */

	// 회원가입
	@RequestMapping(value = "/memberMG", method = RequestMethod.GET)
	public void getCreateId(@ModelAttribute("scri") SearchCriteria scri, Model model, HttpSession session)
			throws Exception {

		List list = MgService.listmember();
		model.addAttribute("list", list);

		/*
		 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri); //
		 * pageMaker.setTotalCount(service.listCount());
		 * pageMaker.setTotalCount(service.countSearch(scri));
		 * model.addAttribute("pageMaker", pageMaker);
		 */

	}

	@RequestMapping(value = "/userMG", method = RequestMethod.GET)
	public void getuserMG(@RequestParam("userId") String userId, Model model, HttpSession session) throws Exception {

		MembersVO vo = MgService.viewmember(userId);

		if (vo.getMemType().equals("0")) {
			vo.setMemType("일반회원");
		} else if (vo.getMemType().equals("1")) {
			vo.setMemType("일반관리자");
		} else if (vo.getMemType().equals("2")) {
			vo.setMemType("최고관리자");
		}

		model.addAttribute("view", vo);

		List list = MgService.boardmember(userId);
		model.addAttribute("list", list);

		/*
		 * PageMaker pageMaker = new PageMaker(); pageMaker.setCri(scri); //
		 * pageMaker.setTotalCount(service.listCount());
		 * pageMaker.setTotalCount(service.countSearch(scri));
		 * model.addAttribute("pageMaker", pageMaker);
		 */

	}

	@RequestMapping(value = "/userMG", method = RequestMethod.POST)
	public String postuserMG(@RequestParam("level") String memType, MembersVO vo) throws Exception {

		vo.setMemType(memType);

		System.out.println("controller vo = " + vo);

		System.out.println(memType);

		MgService.level(vo);

		return "redirect:/management/memberMG";

	}

	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public void getqnalist(Model model, HttpSession session, QnAVO vo) throws Exception {

		List list = MgService.qnalist();
		model.addAttribute("list", list);

	}

	@RequestMapping(value = "/viewqnaMG", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception {

		QnAVO vo = MgService.viewqna(bno);
		model.addAttribute("view", vo);

		//
		List<QnAReVO> replyList = MgQService.qnareList(bno);

		System.out.println(replyList.toString());
		model.addAttribute("replyList", replyList);

		if (replyList.isEmpty()) {
			System.out.println("null");
			model.addAttribute("reck", false);
		}

		//
	}

	@RequestMapping(value = "/viewqnaMG", method = RequestMethod.POST)
	public String replyWrite(QnAVO vo, QnAReVO rvo, Model model, HttpSession session) throws Exception {

		// 문의 댓글작성
		MgQService.qnareWrite(rvo);

		// 글작성 체크

		vo.setBno(rvo.getBno());
		vo.setResult("1");
		System.out.println(vo);
		MgService.viewqnaMG(vo);

		return "redirect:/management/viewqnaMG?bno=" + rvo.getBno();
	}

	@RequestMapping(value = "/deleteqnareMG", method = RequestMethod.GET)
	public void getreplyDelete(@RequestParam("bno") int bno, @RequestParam("rno") int rno, HttpSession session,
			Model model) throws Exception {

		QnAVO vo = MgService.viewqna(bno);
		model.addAttribute("view", vo);

	}

	@RequestMapping(value = "/deleteqnareMG", method = RequestMethod.POST)
	public String replyDelete(QnAReVO rvo, QnAVO vo) throws Exception {

		// rvo.setRno(rno);

		// 문의 댓글작성
		MgQService.qnareDelete(rvo);

		// 글작성 체크

		vo.setBno(rvo.getBno());
		vo.setResult("0");
		System.out.println(vo);
		MgService.viewqnaMG(vo);

		return "redirect:/management/viewqnaMG?bno=" + rvo.getBno();
	}

	@RequestMapping(value = "/fileMG", method = RequestMethod.GET)
	public void getfileMG(Model model, HttpSession session, FileManagerVO vo) throws Exception {

		List list = MgService.filelist();

		model.addAttribute("list", list);

	}

	@RequestMapping(value = "/fileviewMG", method = RequestMethod.GET)
	public void getfileviewMG(@RequestParam("no") int no, Model model) throws Exception {

		FileManagerVO vo = MgService.fileview(no);

		model.addAttribute("view", vo);
		model.addAttribute("url", "/fileupload/" + vo.getSaveFileName());

	}

	// 글 목록 + 페이징 + 검색
	@RequestMapping(value = "/listMG", method = RequestMethod.GET)
	public void listPage(@ModelAttribute("scri") SearchCriteria scri, Model model, HttpSession session)
			throws Exception {

		List list = Service.listSearch(scri);
		model.addAttribute("list", list);

		Object loginInfo = session.getAttribute("member");

		if (loginInfo == null) {
			model.addAttribute("msg", false);

		}

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		// pageMaker.setTotalCount(service.listCount());
		pageMaker.setTotalCount(Service.countSearch(scri));
		model.addAttribute("pageMaker", pageMaker);
	}

	// 게시물 조회
	@RequestMapping(value = "/viewMG", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, @ModelAttribute("scri") SearchCriteria scri, Model model,
			HttpSession session) throws Exception {

		Object loginInfo = session.getAttribute("member");
		System.out.println("loginfo = " + loginInfo);
		if (loginInfo == null) {
			model.addAttribute("msg2", false);

		}

		BoardVO vo = Service.view(bno);
		System.out.println(vo);

		if (!(vo.getImgUrl() == null)) {
			String savename[] = vo.getImgUrl().split("/");

			System.out.println(savename[2]);
			FileManagerVO fvo = MgService.fileName(savename[2]);
			/* model.addAttribute("delete", true); */
			if (fvo == null) {
				vo.setImgUrl("/fileupload/2019111725626795.png");
				model.addAttribute("delete", false);

			} else {
				long size = fvo.getFileSize() / 1024;

				fvo.setFileSize(size);
				model.addAttribute("filename", fvo);
			}
		}

		model.addAttribute("view", vo);

		Object vi = session.getAttribute("visit" + bno);

		/*
		 * System.out.println("if vi St ");
		 * 
		 * if(vi==null) { System.out.println("vi is null, first visit page");
		 * session.setAttribute("visit"+bno, bno); Service.viewCnt(bno); }else
		 * if(!(vi.equals(bno))) {
		 * 
		 * session.setAttribute("visit"+bno, bno);
		 * System.out.println("before vi different "); Service.viewCnt(bno); }
		 * System.out.println("if vi end ");
		 */

		List<ReplyVO> replyList = repService.replyList(bno);

		System.out.println(replyList.toString());

		model.addAttribute("replyList", replyList);

	}

	@RequestMapping(value = "/modifyMG", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model, HttpSession session) throws Exception {

		Object loginInfo = session.getAttribute("member");

		if (loginInfo == null) {
			model.addAttribute("msg2", false);

		}

		BoardVO vo = Service.view(bno);

		System.out.println("get img" + vo.getImgUrl());

		if (vo.getImgUrl() == null) {
			System.out.println("no Img");
			session.setAttribute("img" + bno, "");
		} else {
			System.out.println("have Img");
			session.setAttribute("img" + bno, vo.getImgUrl());
		}

		model.addAttribute("view", vo);
	}

	// 게시물 수정
	@RequestMapping(value = "/modifyMG", method = RequestMethod.POST)
	public String postModify(@RequestParam(value = "imgck", defaultValue = "false") boolean imgck,
			@RequestParam("bno") int bno, BoardVO vo,
			@RequestParam(value = "file1", required = true, defaultValue = "") MultipartFile file, HttpSession session,
			FileManagerVO fvo) throws Exception {

		/*  */
		System.out.println("imgck" + imgck);

		String img = (String) session.getAttribute("img" + bno);
		System.out.println("modify before img state = " + img);

		if (img.equals("")) {
			// 기존 img 없을때
			if (!(file.isEmpty() == true)) {
				fvo.setWriter(vo.getWriter());
				fvo.setWriterId(vo.getWriterId());
				String url = fileUploadService.restore2(file, fvo);
				vo.setImgUrl(url);
			} else {
				vo.setImgUrl("");

			}
		} else {
			// 기존 img있을때
			if (!(file.isEmpty() == true)) {
				/* String url = fileUploadService.restore(file); */
				fvo.setWriter(vo.getWriter());
				fvo.setWriterId(vo.getWriterId());
				String url = fileUploadService.restore2(file, fvo);
				vo.setImgUrl(url);
			} else {
				if (imgck == true) {
					// img 제거

					vo.setImgUrl("");
				} else {
					vo.setImgUrl(img);
				}

			}
		}

		/*  */

		Service.modify(vo);

		return "redirect:/management/viewMG?bno=" + vo.getBno();
	}
	
	
	@RequestMapping(value = "/replymodifyMG", method = RequestMethod.GET)
	public void getreplymodifyMG(@RequestParam("rno") int rno, Model model, HttpSession session) throws Exception {

		Object loginInfo = session.getAttribute("member");

		if (loginInfo == null) {
			model.addAttribute("msg2", false);

		}
		System.out.println("remorno"+rno);
		ReplyVO vo = MgService.replymodifyview(rno);
		System.out.println("end");

		model.addAttribute("view", vo);
	}

	// 게시물 수정
	@RequestMapping(value = "/replymodifyMG", method = RequestMethod.POST)
	public String postreplymodifyMG(ReplyVO vo) throws Exception {

		/*  */
		System.out.println("replymodigyMG CT");
		System.out.println(vo);
		MgService.replymodify(vo);

		return "redirect:/management/viewMG?bno=" + vo.getBno();
	}

}
