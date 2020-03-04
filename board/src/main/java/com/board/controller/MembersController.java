package com.board.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.board.service.FileUploadService;
import com.board.service.MembersService;

@Controller
@SessionAttributes
@RequestMapping("/members/*")
public class MembersController {

	@Inject
	private MembersService memService;

	@Autowired
	BCryptPasswordEncoder passEncoder;

	/* 19.11.18 ver2 add st */
	@Autowired
	FileUploadService fileUploadService;

	/* 19.11.18 ver2 add End */

	// 회원가입
	@RequestMapping(value = "/createId", method = RequestMethod.GET)
	public void getCreateId() throws Exception {

	}

	// 회원가입
	@RequestMapping(value = "/createId", method = RequestMethod.POST)
	public String postCreateId(MembersVO vo,
			@RequestParam(value = "file1", required = true, defaultValue = "") MultipartFile file,FileManagerVO fvo) throws Exception {

		/* System.out.println("call POST START"); */

		// 11.18 ver2 test st

		/*
		 * file들어오는지 테스트하던거 System.out.println("file = "+file); if(file.equals("")) {
		 * System.out.println("file null"); }else if(file.isEmpty() == true) {
		 * System.out.println("file null empyty");
		 * 
		 * }else if(file.getBytes() == null) { System.out.println("file null betBytes");
		 * }
		 */

		if (!(file.isEmpty() == true)) {
			/* String url = fileUploadService.restore(file); */
			fvo.setWriter(vo.getUserName());
			fvo.setWriterId(vo.getUserId());
			String url = fileUploadService.restore2(file,fvo);
			vo.setUserImg(url);
		} else {
			/* vo.setUserImg("/fileupload/2019101824630990.jpg"); */
			vo.setUserImg("/fileupload/201911202135766.png");
		}
		// 11.18 ver2 test end

		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);
		vo.setUserPass(pass);

		memService.createId(vo);
		/* System.out.println("back POST End"); */
		return "redirect:/";
	}

	// 로그인

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MembersVO vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		MembersVO login = memService.login(vo);
		System.out.println("test = " + vo.getUserPass() + " Encoding pass = " + passEncoder.encode(vo.getUserPass()));

		if (login == null) {
			System.out.println("Error");
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);

			return "redirect:/";

		} else {

			System.out.println(login);
		}

		// 실제비밀번호 암호화된 비밀번호 비교
		boolean passMatch = passEncoder.matches(vo.getUserPass(), login.getUserPass());
		System.out.println("vo = " + vo.getUserPass());
		System.out.println("vo2 = " + login.getUserPass());

		System.out.println(passMatch);

		/*
		 * if (login == null) {
		 * 
		 * }
		 */

		if (login != null && passMatch) {
			MembersVO imgck = memService.ckimg(login);
			if(imgck != null) {
				session.setAttribute("member", login);				
				System.out.println("dfd"+login);
			}else {
				login.setUserImg("/fileupload/201911202135766.png");
				session.setAttribute("member", login);				
				System.out.println("임시 회원 이미지");
			}
			
			session.setAttribute("member", login);
			
			System.out.println("dfd"+login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}

		System.out.println(login.getMemType());

		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		System.out.println("Call Controller Logout.Get St");
		session.invalidate();
		System.out.println("Call Controller Logout.Get End");
		return "redirect:/";
	}

	// 정보수정
	@RequestMapping(value = "/mem_modify", method = RequestMethod.GET)
	public void getModify() throws Exception {

	}

	// 정보수정
	@RequestMapping(value = "/mem_modify", method = RequestMethod.POST)
	public String postModify(MembersVO vo, HttpSession session,
			@RequestParam(value = "file1", required = true, defaultValue = "") MultipartFile file,FileManagerVO fvo) throws Exception {

		//
		
		MembersVO member = (MembersVO) session.getAttribute("member");

		if (!(file.isEmpty() == true)) {
			/* String url = fileUploadService.restore(file); */
			fvo.setWriter(vo.getUserName());
			fvo.setWriterId(vo.getUserId());
			String url = fileUploadService.restore2(file,fvo);
			vo.setUserImg(url);
		} else {
			/* vo.setUserImg("/fileupload/2019101824630990.jpg"); */
			/* vo.setUserImg("/fileupload/201911202135766.png"); */
			System.out.println(member.getUserImg());
			vo.setUserImg(member.getUserImg());
		}
		
		if(vo.getUserPass().equals("")) {
			System.out.println("no modify password");
			vo.setUserPass(member.getUserPass());
			
		}else {
			String inputPass = vo.getUserPass();
			String pass = passEncoder.encode(inputPass);
			vo.setUserPass(pass);
		}

		//

		

		memService.modify(vo);
		session.invalidate();

		return "redirect:/";
	}

	// 탈퇴
	@RequestMapping(value = "/mem_delete", method = RequestMethod.GET)
	public void getDelete() throws Exception {

	}

	// 탈퇴
	@RequestMapping(value = "/mem_delete", method = RequestMethod.POST)
	public String postDelete(MembersVO vo, HttpSession session, RedirectAttributes rttr) throws Exception {

		MembersVO member = (MembersVO) session.getAttribute("member");

		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);

		boolean passMatch = passEncoder.matches(vo.getUserPass(), member.getUserPass());

		if (!(passMatch)) {
			rttr.addFlashAttribute("msg", false);
			System.out.println("Error password");
			return "redirect:/members/mem_delete";
		}

		vo.setUserPass(pass);

		memService.delete(vo);
		session.invalidate();

		return "redirect:/";
	}

	// 회원 확인

	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String postIdCheck(HttpServletRequest req) throws Exception {

		String userId = req.getParameter("userId");
		MembersVO idCheck = memService.idCheck(userId);

		String result = "0";

		if (idCheck != null) {
			result = "1";
		}

		return result;
	}

	// 회원 패스워드확인

	@ResponseBody
	@RequestMapping(value = "/PwCheck", method = RequestMethod.POST)
	public String postPwCheck(MembersVO vo, HttpServletRequest req, HttpSession session) throws Exception {

		MembersVO member = (MembersVO) session.getAttribute("member");

		String userPw = req.getParameter("userPw");
		/* String inputPass = vo.getUserPass(); */
		/* String pass = passEncoder.encode(inputPass); */

		System.out.println(userPw);

		/* String pass = passEncoder.encode(userPw); */

		/* System.out.println(pass); */

		String result = "0";

		System.out.println();

		boolean passMatch = passEncoder.matches(userPw, member.getUserPass());

		if (!(passMatch)) {

			System.out.println("Error password");
			result = "1";
		}

		/*
		 * String userId = req.getParameter("userId"); MembersVO idCheck =
		 * memService.idCheck(userId);
		 */

		/* String result = "0"; */
		/*
		 * if (idCheck != null) { result = "1"; }
		 */

		return result;
	}

	// Find Password -1

	@RequestMapping(value = "/findUser", method = RequestMethod.GET)
	public void getFindUser() throws Exception {
		
	}

	@RequestMapping(value = "/findUser", method = RequestMethod.POST)
	public String postFindUser(MembersVO vo, RedirectAttributes rttr, HttpSession session) throws Exception {

		System.out.println("Call Controller FindUser");
		System.out.println(vo);

		if (vo.getUserId() == "") {

			System.out.println("findid");
			MembersVO ck2 = memService.findId(vo);
			System.out.println(ck2);

			if (ck2 != null) {
				System.out.println("id회원정보 일치");
				/* session.setAttribute("member",vo); */
				rttr.addFlashAttribute("id", ck2);
				/* return "redirect:/members/findUser"; */
			} else {
				System.out.println("id회원정보 없음");
				rttr.addFlashAttribute("msgg", false);
				/* return "redirect:/"; */
			}

		} else {

			MembersVO ck = memService.findUser(vo);
			if (ck != null) {
				System.out.println("회원정보 일치");
				session.setAttribute("member", vo);
				session.setAttribute("ck", true);
				System.out.println("rttr ID SEND " + vo.getUserId());
				/* return "redirect:/members/findPass"; */
				return "redirect:/members/findUser";
			} else {
				System.out.println("회원정보 없음");
				rttr.addFlashAttribute("msg", false);
				session.setAttribute("ck", false);
			}

			/* System.out.println("back POST End"); */

		}
		return "redirect:/members/findUser";
	}

	// Find Password -2

	@RequestMapping(value = "/findPass", method = RequestMethod.GET)
	public void getFindPass() throws Exception {

	}

	@RequestMapping(value = "/findPass", method = RequestMethod.POST)
	public String postFindPass(MembersVO vo, HttpSession session) throws Exception {

		System.out.println("Call Controller FindPass");
		System.out.println("id = " + vo.getUserId() + " New Pass = " + vo.getUserPass());

		String inputPass = vo.getUserPass();
		String pass = passEncoder.encode(inputPass);

		vo.setUserPass(pass);
		System.out.println("UserId = " + vo.getUserId());
		System.out.println("BCrypt Pass = " + vo.getUserPass());

		memService.findPass(vo);

		//session.invalidate();

		/* System.out.println("back POST End"); */
		/* return "redirect:/"; */
		session.setAttribute("ckk", true);
		return "redirect:/members/findPass";
	}

	/* 19.11.22 ver2 emailCheck add */
	@ResponseBody
	@RequestMapping(value = "/emailCheck", method = RequestMethod.POST)
	public String postEmailCheck(HttpServletRequest req) throws Exception {

		String email = req.getParameter("email");
		MembersVO emailCheck = memService.emailCheck(email);

		String result = "0";

		if (emailCheck != null) {
			result = "1";
		}

		return result;
	}

}
