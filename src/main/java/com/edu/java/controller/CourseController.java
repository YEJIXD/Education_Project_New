package com.edu.java.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.java.biz.AdminBiz;
import com.edu.java.biz.CourseBiz;
import com.edu.java.dto.CourseDto;
import com.edu.java.dto.Criteria;
import com.edu.java.dto.PageDto;

@Controller
public class CourseController {
	private static final Logger logger = LoggerFactory.getLogger(CourseController.class);
	
	@Inject
	CourseBiz courseBiz;
	
	@Autowired
	AdminBiz adminBiz;
	
	/* Course List */
	@RequestMapping(value="/courseList.do", method=RequestMethod.GET)
	public ModelAndView courseList(PageDto dto
								 , @Param("title") String searchType
								 , @Param("") String keyword
								 , @RequestParam(defaultValue="1") int page) throws Exception{
		logger.info("course LIST PAGE");
		ModelAndView mav = new ModelAndView();
		
		// Search
		List<CourseDto> list = courseBiz.courseList(dto);
		mav.setViewName("/admin/adminCourseList");
		mav.addObject("list", list);
				
		System.out.println(list);

		// Paging
		Criteria cri = new Criteria();
		
		dto.setCri(cri);
		dto.setTotal(adminBiz.getTotal(dto.getKeyword()));
		
		mav.addObject("dto", new PageDto(cri, dto.getTotal()));
		mav.setViewName("/edu_Application/courseList");
			
		return mav;
	}
	
	/* Course Detail */
	@RequestMapping(value="courseDetail.do", method=RequestMethod.GET)
	public ModelAndView courseDetail(@RequestParam("c_no") int c_no) throws Exception{
		logger.info("course Detail Page");
		ModelAndView mav = new ModelAndView("jsonView");
		CourseDto dto = courseBiz.selectOne(c_no);
		
		mav.addObject("dto", dto);
		mav.setViewName("/edu_Application/courseDetail");
		
		return mav;
	}
	
	/* 교육 신청 확인 FORM */
	@RequestMapping(value="/appForm.do", method=RequestMethod.GET)
	public String appForm() {
		logger.info("APP FORM PAGE");
		
		return "/edu_Application/appForm";
	}
	/* 교육 신청 */
	@RequestMapping(value="/appInsert.do", method=RequestMethod.POST)
	public ModelAndView appInsert(@RequestBody CourseDto dto, HttpSession session) throws Exception{
		logger.info("App Insert Res");
		ModelAndView mav = new ModelAndView("jsonView");
		int resultCode = 0;
		
		try {
			HashMap<String, Object> user = (HashMap<String, Object>) session.getAttribute("USER");
			
			if(user == null) {
				resultCode = 10;
			}else {
				String userName = String.valueOf(user.get("user_name"));
				String userEmail = String.valueOf(user.get("user_email"));
				courseBiz.courseAppInsert(dto);
			}
		} catch (Exception e) {
			logger.trace(e.getMessage());
			e.printStackTrace();
		}finally {
			mav.addObject("resultCode", resultCode);
		}
		System.out.println(dto.toString());
		mav.addObject("msg", "교육 신청 완료");
		
		return mav;
	}
	
	/*
	 * @RequestMapping("/courseUpdateRes.do") public String
	 * courseUpdateRes(CourseDto dto) throws Exception{
	 * logger.info("course Update Res"); courseBiz.courseUpdateRes(dto);
	 * 
	 * return "/edu_Application/courseDetail"; }
	 */
	 
}
