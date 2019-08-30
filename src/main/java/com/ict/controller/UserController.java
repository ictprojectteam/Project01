package com.ict.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.MVO;
import com.ict.service.RecipeCVO;
import com.ict.service.RecipePaging;
import com.ict.service.RecipeVO;
import com.ict.service.TVO;

@Controller
public class UserController {
	@Autowired
	private DAO dao;
	
	@RequestMapping(value = "login")
	public ModelAndView getLogin() {
		ModelAndView mv = new ModelAndView("login");
		
		return mv;
	}
	
	@RequestMapping(value = "goLogin", method = RequestMethod.POST)
	public ModelAndView goLogin(MVO mvo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MVO r_mvo = dao.getLogin(mvo);
		if (r_mvo != null) {
			session.setAttribute("mvo", r_mvo);
			if (dao.chkAdmin(r_mvo) > 0) {
				mv.setViewName("redirect:home");
				session.setAttribute("admin", dao.chkAdmin(r_mvo));
			} else {
				mv.setViewName("redirect:/");
			}
		} else {
			mv.setViewName("loginfail");
		}
		return mv;
	}
	
	@RequestMapping("join")
	public ModelAndView goJoin(HttpSession session) {
		ModelAndView mv = new ModelAndView("join");
		session.setAttribute("res", 1);
		return mv;
	}
	
	@RequestMapping("join_ok")
	public ModelAndView getInsert(MVO mvo, HttpSession session) {
		ModelAndView mv;
		try {
			dao.getJoin(mvo);
			mv = new ModelAndView("redirect:login");
			session.setAttribute("res", 1);
		} catch (Exception e) {
			mv = new ModelAndView("join");
			session.setAttribute("res", 0);
		}
		return mv;
	}
	
	@RequestMapping("check_login")
	public ModelAndView checkLogin() {
		return new ModelAndView("check_login");
	}
	
	@RequestMapping("updateprofile")
	public ModelAndView goCheck(MVO mvo) {
		ModelAndView mv = new ModelAndView();
		if (mvo != null) {
			try {
				if (dao.getLogin(mvo) != null) {
					mv.setViewName("updateprofile");
					return mv;
				} else {
					mv.setViewName("loginfail");
					return mv;
				}
			} catch (Exception e) {
				mv.setViewName("inappropriate");
				return mv;
			}
		} else {
			mv.setViewName("inappropriate");
			return mv;
		}
	}
	@RequestMapping("prf_img_up")
	@ResponseBody
	public String Prf_Img_Up(HttpSession session, String main_image) {
		MVO mvo = (MVO)session.getAttribute("mvo");
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_idx", mvo.getM_idx());
		map.put("prf_img", main_image);
		dao.getPrf_img_up(map);
		mvo.setPrf_img(main_image);
		session.setAttribute("mvo", mvo);
		return "talk";
	}
	
	@RequestMapping("updEmail")
	@ResponseBody
	public String updateEmail(MVO mvo, HttpSession session) {
		int chk = dao.chkEmail(mvo);
		MVO r_mvo = (MVO)session.getAttribute("mvo");
		if(chk > 0) {
			return "duplicate";
		} else {
			int result = dao.updateEmail(mvo);
			if(result > 0) {
				r_mvo.setEmail(mvo.getEmail());
				session.setAttribute("mvo", r_mvo);
				return "1";
			} else {
				return "0";
			}
		}
	}
	
	@RequestMapping("updName")
	@ResponseBody
	public String updateName(MVO mvo, HttpSession session) {
		int chk = dao.chkName(mvo);
		MVO r_mvo = (MVO)session.getAttribute("mvo");
		if(chk > 0) {
			return "duplicate";
		} else {
			int result = dao.updateName(mvo);
			if(result > 0) {
				r_mvo.setName(mvo.getName());
				session.setAttribute("mvo", mvo);
				return "1";
			} else {
				return "0";
			}
		}
	}
	
	@RequestMapping("pwchk")
	@ResponseBody
	public String chkPw(MVO mvo, HttpSession session) {
		mvo.setId(((MVO)session.getAttribute("mvo")).getId());
		int chk = dao.chkPw(mvo);
		return String.valueOf(chk);
	}
	
	@RequestMapping("updPw")
	@ResponseBody
	public String updatePw(MVO mvo) {
		int result = dao.updatePw(mvo);
		return String.valueOf(result);
	}
	
	@RequestMapping("logout")
	public ModelAndView getLogout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		if((MVO)(request.getSession().getAttribute("mvo")) != null) {
			if (dao.chkAdmin((MVO)request.getSession().getAttribute("mvo")) > 0) {
				mv.setViewName("redirect:m");
			} else {
				String str = request.getHeader("REFERER");
				str = str.substring(str.lastIndexOf("/") + 1, str.length());
				if (str.equals("")) str = "/";
				mv.setViewName("redirect:" + str);
			}
		}
		else {
			mv.setViewName("redirect:/");
		}
		request.getSession().removeAttribute("mvo");
		request.getSession().removeAttribute("admin");
		return mv;
	}
	
	@RequestMapping("myRecipe")
	public ModelAndView getMyHome(HttpSession session){
		ModelAndView mv = new ModelAndView("myrecipe");
		MVO mvo = (MVO)session.getAttribute("mvo");
		mv.addObject("mvo", mvo);
		return mv;
	}
	
	@RequestMapping(value = "myRecipeList", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getRecipeList(RecipeVO rvo, HttpSession session) {
		StringBuffer res = new StringBuffer();
		rvo.setM_idx(((MVO)session.getAttribute("mvo")).getM_idx());
		RecipePaging rp = new RecipePaging(10, 0, rvo.getcPage());
		rvo.setBegin(String.valueOf(rp.getBegin()));
		rvo.setEnd(String.valueOf(rp.getEnd()));
		List<RecipeVO> rlist = dao.myRecipeList(rvo);
		for (RecipeVO k : rlist) {
			res.append("<div class='each-recipe'><img src='" + k.getMain_image() + "' class='image' onclick='view(" + k.getR_idx() + ")'><div class='recipe-content'>")
			.append("<div class='recipe-title' onclick='view(" + k.getR_idx() + ")'>" + k.getRecipe_title() + "</div><div class='recipe-info'>")
			.append("<span class='recipe-regdate'><i class='far fa-calendar-alt'></i>" + k.getRegdate().substring(0, 16) + "</span>")
			.append("<span class='recipe-view'><i class='fas fa-eye'></i>" + k.getHit()+ "</span>")
			.append("<span class='recipe-com'><i class='fas fa-comment-alt'></i>" + k.getCount() + "</span></div>")
			.append("<div class='recipe-button' onclick='edit(" + k.getR_idx() + ")'><span class='edit'><i class='fas fa-edit'></i>수정</span></div></div></div>");
		}
		return res.toString();
	}
	
	@RequestMapping("myReview")
	public ModelAndView getMyReview(HttpSession session){
		ModelAndView mv = new ModelAndView("myreview");
		MVO mvo = (MVO)session.getAttribute("mvo");
		mv.addObject("mvo", mvo);
		return mv;
	}
	
	@RequestMapping("myComent")
	public ModelAndView getMyComent(HttpSession session){
		ModelAndView mv = new ModelAndView("mycoment");
		MVO mvo = (MVO)session.getAttribute("mvo");
		mv.addObject("mvo", mvo);
		return mv;
	}
	
	@RequestMapping(value = "myCommentList", produces = "application/text; charset=utf8")
	@ResponseBody
	public String getCommentList(RecipeCVO rcvo, HttpSession session) {
		StringBuffer res = new StringBuffer();
		if (rcvo.getSep().equals("1")) {
			rcvo.setM_idx(((MVO)session.getAttribute("mvo")).getM_idx());
			RecipePaging rp = new RecipePaging(dao.countWriteComment(rcvo), rcvo.getcPage());
			rcvo.setBegin(String.valueOf(rp.getBegin()));
			rcvo.setEnd(String.valueOf(rp.getEnd()));
			List<RecipeCVO> clist = dao.myWriteComment(rcvo);
			for (RecipeCVO k : clist) {
				res.append("<div class='each-com' onclick='view(" + k.getR_idx() + ")'><div class='main-image'><img src='" + k.getMain_image() + "'></div><div class='recipe-title'>" + k.getRecipe_title() + "</div>")
				.append("<div class='recipe-name'>By " + k.getName() + "</div><div class='comment'><div class='com-content'>" + k.getContent() + "</div><div class='com-date'>" + k.getRegdate() + "</div></div></div>");
			}
		} else {
			rcvo.setM_idx(((MVO)session.getAttribute("mvo")).getM_idx());
			RecipePaging rp = new RecipePaging(dao.countGetComment(rcvo), rcvo.getcPage());
			rcvo.setBegin(String.valueOf(rp.getBegin()));
			rcvo.setEnd(String.valueOf(rp.getEnd()));
			List<RecipeCVO> clist = dao.myGetComment(rcvo);
			for (RecipeCVO k : clist) {
				res.append("<div class='each-com' onclick='view(" + k.getR_idx() + ")'><div class='main-image'><img src='" + k.getMain_image() + "'></div><div class='recipe-title'>" + k.getRecipe_title() + "</div>")
				.append("<div class='comment'><div class='comment-name'>" + k.getName() + "</div><div class='com-content'>" + k.getContent() + "</div><div class='com-date'>" + k.getRegdate() + "</div></div></div>");
			}
		}
		return res.toString();
	}
	
	@RequestMapping("myTalk")
	public ModelAndView getMyTalk(TVO tvo, HttpSession session){
		ModelAndView mv = new ModelAndView("mytalk");
		
		RecipePaging tp = new RecipePaging(10, dao.countMyTalk(((MVO)session.getAttribute("mvo")).getM_idx()), tvo.getcPage()); 
		tvo.setBegin(String.valueOf(tp.getBegin()));
		tvo.setEnd(String.valueOf(tp.getEnd()));
		tvo.setM_idx(((MVO)session.getAttribute("mvo")).getM_idx());
		
		mv.addObject("tlist", dao.myTalkList(tvo));
		mv.addObject("tp", tp);
		return mv;
	}
	
	@RequestMapping("myReport")
	public ModelAndView getMyInquires(HttpSession session){
		ModelAndView mv = new ModelAndView("myreport");
		mv.addObject("qlist", dao.reportList(((MVO)session.getAttribute("mvo")).getM_idx()));
		return mv;
	}
	
	@RequestMapping("myPrf_update")
	public ModelAndView getMyPrf_update(HttpSession session){
		ModelAndView mv = new ModelAndView("myprf_update");
		MVO mvo = (MVO)session.getAttribute("mvo");
		mv.addObject("mvo", mvo);
		return mv;
	}
}
