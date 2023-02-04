package com.edu.java.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.java.CmmService;
import com.edu.java.service.AdminService;
import com.edu.java.dto.Criteria;
import com.edu.java.dto.PageDto;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

	@Autowired
	CmmService cmmService;

	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public ModelAndView adminMain(@RequestParam HashMap<String, Object> paramMap) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/admin/main");

		return mav;
	}

	@RequestMapping(value = "/adminNotice", method = RequestMethod.GET)
	public ModelAndView adminNotice() {
		ModelAndView mav = new ModelAndView();

		try {
			mav.addObject("list", adminService.noticeList());
			mav.setViewName("/admin/notice");
		} catch (Exception e) {
			log.debug("[ ERROR ] : admin notice");
			e.printStackTrace();
		}
		return mav;
	}

	@RequestMapping(value = "/inputNotice", method = RequestMethod.GET)
	public ModelAndView inputNotice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("inputNotice");
		
		return mav;
	}
	/*
	@RequestMapping(value="inputNoticeRes", method=RequestMethod.POST)
	public ModelAndView inputNoticeRes(NoticeDto dto, HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView("jsonview");
		mav.addObject("noticeList", adminService.inputNotice(dto));
		
		return mav;
	}

	@RequestMapping("/modifyNotice")
	public ModelAndView modifyNotice() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("modifyNotice");
		
		return mav;
	}

	@RequestMapping(value = "/deleteNotice", method = RequestMethod.GET)
	public ModelAndView deleteNotice(Model model, HttpServletRequest httpServletRequest) {
		ModelAndView mav = new ModelAndView();
		
		String[] chk = httpServletRequest.getParameterValues("RowCheck[]");
		int chk_length = chk.length;

		for (int i = 0; i < chk_length; i++) {
			adminService.deleteNotice(Integer.parseInt(chk[i]));
		}
		mav.setViewName("noticeList");

		return mav;
	}

	@RequestMapping(value = "/admin/qna", method = RequestMethod.GET)
	public ModelAndView adminQna(Model model) {
		ModelAndView mav = new ModelAndView();

		mav.addObject("list", adminService.getQna());
		mav.setViewName("/admin/qna");

		return mav;
	}
	
	@RequestMapping(value = "/admin/faq", method = RequestMethod.GET)
	public ModelAndView adminFaq() throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		mav.setViewName("/admin/faq");
		mav.addObject("list", adminService.getFaq());

		return mav;
	}

	@RequestMapping(value = "/inputFaq", method = RequestMethod.GET)
	public ModelAndView inputFaq() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("inputFaq");
		
		return mav;
	}

	@RequestMapping(value = "/inputFaqRes", method = RequestMethod.POST)
	public ModelAndView inputFaqRes() throws Exception {
		ModelAndView mav = new ModelAndView("jsonview");

		mav.setViewName("/community/faq");
		mav.addObject("list", adminService.faqList());

		return mav;
	}

	@RequestMapping("/modifyFaq")
	public String modifyFaq() {
		log.info("[ modifyFaq ]");
		return "/admin/modifyFaq";
	}

	@RequestMapping("/modifyFaqRes")
	public String modifyFaqRes() {
		log.info("[ modify Faq Res ]");
		return "";
	}

	@RequestMapping(value = "/deleteFaq", method = RequestMethod.GET)
	public String deleteFaq(Model model, HttpServletRequest httpServletRequest) {

		String[] chk = httpServletRequest.getParameterValues("RowCheck[]");
		int chk_length = chk.length;

		for (int i = 0; i < chk_length; i++) {
			adminService.deleteFaq(Integer.parseInt(chk[i]));
		}

		return "redirect:/faqList";
	}

	@RequestMapping("/subMenu")
	public String subMenu(Model model, String faq_category) {
		log.info("subMenu");

		String str = "";

		if (faq_category.equals("all")) {
			str = "전 체";
		} else if (faq_category.equals("education")) {
			str = "교 육";
		} else if (faq_category.equals("price")) {
			str = "비 용";
		} else if (faq_category.equals("site")) {
			str = "사이트";
		} else {
			str = "기 타";
		}
		model.addAttribute("faq_category", str);

		return "";
	}

	@RequestMapping(value = "/admin/courseList", method = RequestMethod.GET)
	public ModelAndView adminCourse(PageDto dto, @ModelAttribute("cri") Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		
		dto.setCri(cri);
		dto.setTotal(adminService.getTotalCount(dto.getKeyword()));

		mav.addObject("list", adminService.courseList(dto, cri));
		mav.addObject("dto", dto);
		mav.addObject("cri", cri);
		mav.setViewName("/admin/courseList");

		return mav;
	}

	@RequestMapping(value="/inputCourse", method=RequestMethod.GET)
	public String inputCourse() throws Exception {
		return "/admin/inputCourse";
	}

	@RequestMapping(value = "/inputCourseRes", method = RequestMethod.POST)
	public ModelAndView inputCourseRes(@RequestBody CourseDto dto, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		int resultCode = 0;

		try {
			// if(검사 ==1) { throw new Userexception 코드 200 이유 : 검사값이 맞지않아 }
			HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("USER");
			if (user == null) {
				resultCode = 10;
			} else {
				String UserName = String.valueOf(user.get("USER_NAME"));
				dto.setC_init_writer(UserName);
				adminService.inputCourse(dto);
			}
		} catch (Exception e) {
			log.debug(e.getMessage());
			e.printStackTrace();
		} finally {
			mav.addObject("resultCode", resultCode);
		}
		mav.addObject("msg", "교육 등록 완료");

		return mav;
	}

	@RequestMapping(value = "/modifyCourse", method = RequestMethod.GET)
	public ModelAndView modifyCourse(@RequestParam int c_no, @ModelAttribute("cri") Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("dto", adminService.courseDetail(c_no));
		mav.addObject("cri", cri); // page amount 값
		mav.setViewName("/admin/modifyCourse");

		return mav;
	}

	@RequestMapping(value = "modifyCourseRes", method = RequestMethod.POST)
	public ModelAndView modifyCourseRes(@RequestBody CourseDto dto, HttpSession session, @ModelAttribute("cri") Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		int resultCode = 0;

		try { // 로그인 되어있는 상태에서만 수정할 수 있도록 작성 
			HashMap<String, Object> User = (HashMap<String, Object>) session.getAttribute("USER");
			if (User == null) {
				resultCode = 10;
			} else {
				String UserName = String.valueOf(User.get("USER_NAME")); // String.valueOf 사용 -> User에서 USER_NAME
																			// 가져와서(get) UserName에 저장
				dto.setC_init_writer(UserName); // CourseDto의 c_init_writer에 UserName 저장
				adminService.modifyCourse(dto); // adminService(Service단)에서 adminCourseUpdate() 메서드 실행
				mav.addObject("cri", cri); // cri 객체로 page와 amount값 가지고 다니기
			}
		} catch (Exception e) {
			log.debug(e.getMessage());
			e.printStackTrace();
		} finally {
			mav.addObject("resultCode", resultCode);
			mav.addObject("cri", cri);
		}
		mav.addObject("msg", "교육 수정 완료");

		return mav;
	}

	@RequestMapping(value = "/deleteCourse", method = RequestMethod.POST)
	public ModelAndView deleteCourse(@RequestBody String param) throws Exception {
		// 1) form 보낼 때 사용하는 코드 => String 사용 + @RequestParam
		// adminService.adminCourseDelete(c_no);

		// 2) json으로 보낼 때 사용하는 코드 => ModelAndView 사용 + @RequestBody
		ModelAndView mav = new ModelAndView("jsonView");
		HashMap<String, Object> map = cmmService.jsonStringToHashMap(param);

		try {
			adminService.deleteCourse(Integer.valueOf(String.valueOf(map.get("c_no"))));
			mav.addObject("msg", "삭제 성공");
		} catch (Exception e) {
			log.debug("[ delete Course Error ]");
			e.printStackTrace();
		} finally {
			mav.addObject("mav", mav);
		}
		return mav;
	}

	@RequestMapping(value = "/admin/teacher", method = RequestMethod.GET)
	public ModelAndView adminTeacher(Model model) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/admin/teacher");
		mav.addObject("msg", "teacher");

		return mav;
	}

	@RequestMapping(value = "/admin/member")
	public ModelAndView adminMember(Model model) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/admin/member");
		mav.addObject("msg", "adminMember");

		return mav;
	}

	@RequestMapping(value = "/admin/getApplication", method = RequestMethod.GET)
	public ModelAndView adminApplication(PageDto dto, @ModelAttribute("cri") Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");
		dto.setCri(cri);
		dto.setTotal(adminService.getAppTotal(dto.getKeyword()));

		mav.addObject("list", adminService.appList(dto, cri));
		mav.addObject("dto", dto);
		mav.addObject("cri", cri);
		mav.setViewName("/admin/getApplication");

		return mav;
	}

	@RequestMapping(value = "/admin/getAppDetail", method = RequestMethod.GET)
	public ModelAndView appDetail(PageDto dto, @RequestParam("app_no") int app_no, @ModelAttribute("cri") Criteria cri) throws Exception {
		ModelAndView mav = new ModelAndView("jsonView");

		mav.addObject("dto", adminService.appDetail(app_no));
		mav.addObject("cri", cri);
		mav.setViewName("/admin/getAppDetail");

		return mav;
	}*/
}
