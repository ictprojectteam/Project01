package com.ict.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.EventVO;
import com.ict.service.MVO;
import com.ict.service.MemberPaging;
import com.ict.service.QVO;
import com.ict.service.QnAPaging;
import com.ict.service.RecipeCVO;
import com.ict.service.RecipePaging;
import com.ict.service.RecipeVO;

@Controller
public class AdminController {
	@Autowired
	private DAO dao;
	
	@RequestMapping("admin_event")
	public ModelAndView adminEvent() {
		ModelAndView mv = new ModelAndView("a_event");
		return mv;
	}

	@RequestMapping(value = "home")
	public ModelAndView getAdmin() {
		ModelAndView mv = new ModelAndView("admin");
		List<MVO> list = dao.getList();
		mv.addObject("list", list);
		List<RecipeVO> r_list = dao.getRecipeList(1, 5);
		mv.addObject("r_list", r_list);
		List<QVO> q_list = dao.getQList();
		mv.addObject("q_list", q_list);
		return mv;
	}
	
	@RequestMapping(value = "a_recipe")
	public ModelAndView geta_recipe() {
		ModelAndView mv = new ModelAndView("a_recipe");
		return mv;
	}
	
	@RequestMapping(value = "admin_rlist", produces = "application/text; charset=utf8")
	@ResponseBody
	public String geta_recipe(HttpServletRequest request, RecipeVO rvo) {
		StringBuffer res = new StringBuffer();
		Calendar today = Calendar.getInstance();
		if (rvo.getEndt() == null) rvo.setEndt(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		today.add(Calendar.MONTH, -1);
		if (rvo.getStart() == null)	rvo.setStart(new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		int count = dao.a_countRecipe(rvo);
		RecipePaging rp = new RecipePaging(10, count, rvo.getcPage());
		rvo.setBegin(String.valueOf(rp.getBegin()));
		rvo.setEnd(String.valueOf(rp.getEnd()));
		List<RecipeVO> rlist = dao.aRecipeList(rvo);
		if (rlist.size() > 0) {
			for (RecipeVO k : rlist) {
				String cond = "승인대기";
				if(k.getA_permission().equals("1")) cond = "승인완료";
				String type = "일반";
				if (k.getRecipe_video() != null && !k.getRecipe_video().equals("")) type = "영상";
				res.append("<div class='each-content' onclick='view(" + k.getR_idx() + ")'><div class='body-content'>" + k.getR_idx() + "</div><div class='body-content'>" + 
						k.getName() + "</div><div class='body-content'>" + k.getId() + "</div><div class='body-content'>" + k.getEmail() + "</div><div class='body-content'>" + 
						k.getRecipe_title() + "</div><div class='body-content'>" + type + "</div><div class='body-content'>" + k.getRegdate().substring(0, 10));
				if(cond.equals("승인완료")) {
					res.append("</div><div class='body-content comp'>" + cond + "</div></div>");
				} else {
					res.append("</div><div class='body-content waiting'>" + cond + "</div></div>");
				}
			}
		} else {
			res.append("원하는 정보가 존재하지 않습니다.");
		}
		return res.toString();
	}
	
	@RequestMapping(value = "admin_rpage", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String test(RecipeVO rvo) {
		StringBuffer res = new StringBuffer();
		Calendar today = Calendar.getInstance();
		if (rvo.getEndt() == null) rvo.setEndt(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		today.add(Calendar.MONTH, -1);
		if (rvo.getStart() == null)	rvo.setStart(new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		int count = dao.a_countRecipe(rvo);
		RecipePaging rp = new RecipePaging(10, count, rvo.getcPage());
		
		if (rp.getBeginBlock() <= rp.getPagePerBlock()) {
			res.append("<span class='disable'> 이전으로 </span>");
		} else {
			res.append("<span class='pre-block'> 이전으로 </span");
		}
		
		for (int i = rp.getBeginBlock(); i < rp.getEndBlock() + 1; i++) {
			if (i == rp.getNowPage()) {
				res.append("<span class='now'>" + i + "</span>");
			} else {
				res.append("<span class='page' onclick='move_page(" + i + ")'>" + i + "</span>");
			}
		}
		
		if (rp.getEndBlock() >= rp.getTotalPage()) {
			res.append("<span class='disable'> 다음으로 </span>");
		} else {
			res.append("<span class='next-block'> 다음으로 </span>");
		}
		return res.toString();
	}
	
	@RequestMapping(value = "a_membership")
	public ModelAndView geta_member() {
		ModelAndView mv = new ModelAndView("a_membership");
		return mv;
	}
	
	@RequestMapping(value = "admin_mlist", produces = "application/text; charset=utf8")
	@ResponseBody
	public String geta_member(HttpServletRequest request, MVO mvo) {
		StringBuffer res = new StringBuffer();
		Calendar today = Calendar.getInstance();
		if (mvo.getEndt() == null) mvo.setEndt(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		today.add(Calendar.MONTH, -6);
		if (mvo.getStart() == null)	mvo.setStart(new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		int count = dao.a_countMember(mvo);
		MemberPaging mp = new MemberPaging(10, count, mvo.getcPage());
		mvo.setBegin(String.valueOf(mp.getBegin()));
		mvo.setEnd(String.valueOf(mp.getEnd()));
		List<MVO> mlist = dao.aMemberList(mvo);
		if (mlist.size() > 0) {
			for (MVO k : mlist) {
				res.append("<div class='each-content' onclick='view(" + k.getM_idx() + ")'><div class='body-content'>" + k.getM_idx() +
						"</div><div class='body-content'>" + k.getName() + "</div><div class='body-content'>" + k.getEmail() +
						"</div><div class='body-content'>" + k.getId() +  "</div><div class='body-content'>" + k.getGender() + 
						"</div><div class='body-content'>" + k.getRegdate()+ "</div></div>");
			}
		} else {
			res.append("원하는 정보가 존재하지 않습니다.");
		}
		return res.toString();
	}
	
	@RequestMapping(value = "admin_mpage", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String test(MVO mvo) {
		StringBuffer res = new StringBuffer();
		Calendar today = Calendar.getInstance();
		if (mvo.getEndt() == null) mvo.setEndt(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		today.add(Calendar.MONTH, -1);
		if (mvo.getStart() == null)	mvo.setStart(new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		int count = dao.a_countMember(mvo);
		MemberPaging mp = new MemberPaging(10, count, mvo.getcPage());
		
		if (mp.getBeginBlock() <= mp.getPagePerBlock()) {
			res.append("<span class='disable'> 이전으로 </span>");
		} else {
			res.append("<span class='pre-block'> 이전으로 </span");
		}
		
		for (int i = mp.getBeginBlock(); i < mp.getEndBlock() + 1; i++) {
			if (i == mp.getNowPage()) {
				res.append("<span class='now'>" + i + "</span>");
			} else {
				res.append("<span class='page' onclick='move_page(" + i + ")'>" + i + "</span>");
			}
		}
		
		if (mp.getEndBlock() >= mp.getTotalPage()) {
			res.append("<span class='disable'> 다음으로 </span>");
		} else {
			res.append("<span class='next-block'> 다음으로 </span>");
		}
		return res.toString();
	}
	
	@RequestMapping(value = "a_write_recipe")
	public ModelAndView getAdminWriteRecipe() {
		return new ModelAndView("a_write_recipe");
	}
	
	@RequestMapping(value = "admin_accept", method = RequestMethod.GET)
	public ModelAndView admin_status_accept(@RequestParam String r_idx) {
		ModelAndView mv = new ModelAndView("redirect: a_recipe");
		dao.getAdminAccept(r_idx);
		return mv;
	}
	
	@RequestMapping("admin_view_one_recipe")
	public ModelAndView get_admin_view_one_recipe(@RequestParam String r_idx) {
		ModelAndView mv = new ModelAndView("admin_view_one_recipe");
		RecipeVO rvo = dao.getAdminOneRecipe(r_idx);
		mv.addObject("rvo", rvo);
		return mv;
	}
	
	@RequestMapping("admin_view_one_member")
	public ModelAndView get_admin_view_one_member(@RequestParam String m_idx) {
		ModelAndView mv = new ModelAndView("admin_view_one_member");
		MVO mvo = dao.getAdminOneMember(m_idx);
		mv.addObject("mvo", mvo);
		return mv;
	}
	
	@RequestMapping("admin_qna")
	public ModelAndView qna(QVO qvo) {
		ModelAndView mv = new ModelAndView("a_qna");
		String sel = qvo.getName_idx();
		if(qvo.getName() == null || qvo.getName().equals("")) {
		} else {
			if (sel.equals("id")) {
				qvo.setId(qvo.getName());
				qvo.setName("");
			} else if (sel.equals("name")) {
				qvo.setName(qvo.getName());
			} else if (sel.equals("m_idx")) {
				qvo.setM_idx(qvo.getName());
				qvo.setName("");
			}
		}
		Calendar today = Calendar.getInstance();
		if (qvo.getEndt() == null) qvo.setEndt(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		today.add(Calendar.MONTH, -1);
		if (qvo.getStart() == null)	qvo.setStart(new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		if (qvo.getcPage() == null) qvo.setcPage("");
		QnAPaging qp = new QnAPaging(dao.getQCount(qvo), qvo.getcPage());
		qvo.setBegin(String.valueOf(qp.getBegin()));
		qvo.setEnd(String.valueOf(qp.getEnd()));
		List<QVO> q_list = dao.getQList(qvo);
		for (QVO k : q_list) {
			k.setRegdate(k.getRegdate().substring(0, 10));
			if (k.getStatus().equals("0")) {
				k.setStatus("처리 대기중");
			} else {
				k.setStatus("처리 완료");
			}
		}
		mv.addObject("q_list", q_list);
		mv.addObject("qp", qp);
		return mv;
	}
	
	@RequestMapping(value = "qna_detail", produces = "application/text; charset=utf8")
	@ResponseBody
	public String qnaDetail(RecipeCVO rcvo) {
		StringBuffer res = new StringBuffer();
		rcvo = dao.qnaDetail(rcvo);
		if (rcvo == null) return res.append("<div>삭제된 댓글입니다.</div>").toString();
		res.append("<div>작성자 : " + rcvo.getName() + "</div><div>아이디 : " + rcvo.getId() + "</div><div>내용 : " + rcvo.getContent_() + "</div>")
		.append("<div><button onclick='com_del(" + rcvo.getR_c_idx() + ")'>댓글 삭제</button><button onclick='location.href=\"view_recipe?rno=" + rcvo.getR_idx() + "\"'>글 확인하기</button></div>");
		return res.toString();
	}
	
	@RequestMapping("admin_complete")
	public ModelAndView compQnA(QVO qvo) {
		ModelAndView mv = new ModelAndView("redirect: admin_qna");
		dao.compQnA(qvo);
		return mv;
	}
	
	@RequestMapping(value = "a_manager")
	public ModelAndView geta_manager() {
		ModelAndView mv = new ModelAndView("a_manager");
		return mv;
	}
	
	@RequestMapping("admin_reg_event")
	public ModelAndView regEvent() {
		ModelAndView mv = new ModelAndView("a_reg_event");
		return mv;
	}
	
	@RequestMapping("a_reg_event")
	public ModelAndView regEvent(EventVO evo, HttpSession session) {
		ModelAndView mv = new ModelAndView("a_event");
		evo.setM_idx(((MVO)session.getAttribute("mvo")).getM_idx());
		try {
			evo.setE_start(new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(evo.getE_start())));
			evo.setE_end(new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("yyyy-MM-dd").parse(evo.getE_end())));
		} catch (ParseException e) {
		}
		evo.setE_regdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date(Calendar.getInstance().getTimeInMillis())));
		dao.insertEvent(evo);
		return mv;
	}
	
	/* 운영자 리스트
	 * 
	 * 	
	@RequestMapping(value = "admin_oplist", produces = "application/text; charset=utf8")
	@ResponseBody
	public String geta_manager(HttpServletRequest request, MVO mvo) {
		StringBuffer res = new StringBuffer();
		Calendar today = Calendar.getInstance();
		if (mvo.getEndt() == null) mvo.setEndt(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		today.add(Calendar.MONTH, -6);
		if (mvo.getStart() == null)	mvo.setStart(new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		int count = dao.a_countMember(mvo);
		MemberPaging mp = new MemberPaging(10, count, mvo.getcPage());
		mvo.setBegin(String.valueOf(mp.getBegin()));
		mvo.setEnd(String.valueOf(mp.getEnd()));
		List<MVO> mlist = dao.aMemberList(mvo);
		if (mlist.size() > 0) {
			for (MVO k : mlist) {
				res.append("<div class='each-content' onclick='view(" + k.getM_idx() + ")'><div class='body-content'>" + k.getM_idx() +
						"</div><div class='body-content'>" + k.getName() + "</div><div class='body-content'>" + k.getEmail() +
						"</div><div class='body-content'>" + k.getId() +  "</div><div class='body-content'>" + k.getGender() + 
						"</div><div class='body-content'>" + k.getRegdate()+ "</div></div>");
			}
		} else {
			res.append("원하는 정보가 존재하지 않습니다.");
		}
		return res.toString();
	}
	
	@RequestMapping(value = "admin_mpage", produces = "application/text; charset=utf-8")
	@ResponseBody
	public String test(MVO mvo) {
		StringBuffer res = new StringBuffer();
		Calendar today = Calendar.getInstance();
		if (mvo.getEndt() == null) mvo.setEndt(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		today.add(Calendar.MONTH, -1);
		if (mvo.getStart() == null)	mvo.setStart(new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		int count = dao.a_countMember(mvo);
		MemberPaging mp = new MemberPaging(10, count, mvo.getcPage());
		
		if (mp.getBeginBlock() <= mp.getPagePerBlock()) {
			res.append("<span class='disable'> 이전으로 </span>");
		} else {
			res.append("<span class='pre-block'> 이전으로 </span");
		}
		
		for (int i = mp.getBeginBlock(); i < mp.getEndBlock() + 1; i++) {
			if (i == mp.getNowPage()) {
				res.append("<span class='now'>" + i + "</span>");
			} else {
				res.append("<span class='page' onclick='move_page(" + i + ")'>" + i + "</span>");
			}
		}
		
		if (mp.getEndBlock() >= mp.getTotalPage()) {
			res.append("<span class='disable'> 다음으로 </span>");
		} else {
			res.append("<span class='next-block'> 다음으로 </span>");
		}
		return res.toString();
	}
	
	*/
}
