package com.ict.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.IIOException;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.DAO;
import com.ict.service.MVO;
import com.ict.service.Pageing;
import com.ict.service.QVO;
import com.ict.service.R_RankVO;
import com.ict.service.RecipeCVO;
import com.ict.service.RecipePaging;
import com.ict.service.RecipeVO;
import com.ict.service.TLVO;
import com.ict.service.TVO;
import com.ict.service.TalkCVO;

@Controller
public class MainController {
	@Autowired
	private DAO dao;
	@Autowired	
//	String cPage;
	
	@RequestMapping(value = "/")
	public ModelAndView getIndex() {
		ModelAndView mv = new ModelAndView("index");
		Map<String, String> listmap = new HashMap<String, String>();
		
		listmap.put("begin", "1");
		listmap.put("end", "8");
		listmap.put("a_permission", "1");
		
		List<RecipeVO> r_list = dao.getRecipeList(listmap);
		
		List<TVO> t_list = dao.getTalk_List();
		
		for (int i = 0; i < t_list.size(); i++) {
			if(t_list.get(i).getFile_name() != null) {
				String str = t_list.get(i).getFile_name();
				String[] s_arr = str.split(",");
				for (int j = 0; j < s_arr.length; j++) {
					t_list.get(i).getF_arr().add(s_arr[j]);
				}
			}
		}
		
		if (dao.chkDate() == null) {
			dao.insertVisitor(new SimpleDateFormat("yyyy-MM-dd").format(new Date(Calendar.getInstance().getTimeInMillis())));
		} else {
			dao.updateVisitor(new SimpleDateFormat("yyyy-MM-dd").format(new Date(Calendar.getInstance().getTimeInMillis())));
		}
		
		mv.addObject("t_list", t_list);
		
		mv.addObject("r_list", r_list);
		return mv;
	}

	@RequestMapping("month_visitor")
	@ResponseBody
	public String monthlyVisitor() {
		Calendar today = Calendar.getInstance();
		Map<String, String> vmap = new HashMap<String, String>();
		today.set(Calendar.DAY_OF_MONTH, 1);
		vmap.put("start", new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		today.set(Calendar.DAY_OF_MONTH, today.getActualMaximum(Calendar.DAY_OF_MONTH));
		vmap.put("endt", new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		return String.valueOf(dao.monthlyVisitor(vmap));
	}
	
	@RequestMapping("count_recipe")
	@ResponseBody
	public String countRecipe() {
		return String.valueOf(dao.countRecipe());
	}
	
	@RequestMapping("sum_hit")
	@ResponseBody
	public String sumHit() {
		return String.valueOf(dao.sumHit());
	}
	
	@RequestMapping(value = "m")
	public ModelAndView getAdminLogin() {
		ModelAndView mv = new ModelAndView("admin_login");
		
		return mv;
	}
	
	@RequestMapping("report")
	@ResponseBody
	public String report(QVO qvo, HttpServletRequest request) {
		String str = request.getHeader("REFERER");
		str = str.substring(str.lastIndexOf("/") + 1, str.length());
		qvo.setM_idx(((MVO)request.getSession().getAttribute("mvo")).getM_idx());
		qvo.setQ_def("의견제출");
		int res = dao.insertReport(qvo);
		return String.valueOf(res);
	}
	
	@RequestMapping("recipe")
	public ModelAndView getRecipe(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("recipe");
		String ca1 = request.getParameter("ca1");
		String ca2 = request.getParameter("ca2");
		String ca3 = request.getParameter("ca3");
		String ca4 = request.getParameter("ca4");
		String cPage = request.getParameter("cPage");
		String k = request.getParameter("k");
		
		if (ca1 == null) ca1 = "";
		if (ca2 == null) ca2 = "";
		if (ca3 == null) ca3 = "";
		if (ca4 == null) ca4 = "";
		if (cPage == null) cPage = "";
		if (k == null) k = "";
		mv.addObject("k", k);
		
		Map<String, String> listmap = new HashMap<String, String>();
		listmap.put("ca1", ca1);
		listmap.put("ca2", ca2);
		listmap.put("ca3", ca3);
		listmap.put("ca4", ca4);
		listmap.put("k", k);
		listmap.put("a_permission", "1");
		int count = dao.countRecipe(listmap);
		RecipePaging rp = new RecipePaging(count, cPage);
		
		listmap.put("begin", String.valueOf(rp.getBegin()));
		listmap.put("end", String.valueOf(rp.getEnd()));
		
		List<RecipeVO> r_list = dao.getRecipeList(listmap);
		mv.addObject("ca1", ca1);
		mv.addObject("ca2", ca2);
		mv.addObject("ca3", ca3);
		mv.addObject("ca4", ca4);
		mv.addObject("count", count);
		mv.addObject("r_list", r_list);
		mv.addObject("rp", rp);
		
		return mv;
	}
	
	@RequestMapping("view_recipe")
	public ModelAndView viewRecipe(@RequestParam String rno, HttpSession session) {
		ModelAndView mv = new ModelAndView("view_recipe");
		RecipeVO rvo = dao.viewRecipe(rno);
		if ((rvo.getA_permission().equals("0") || rvo.getSavepublic().equals("0")) && !(((MVO)session.getAttribute("mvo")).getId().equals("admin"))) {
			mv.setViewName("inappropriate");
			return mv;
		}
		rvo.setHit(Integer.parseInt(rvo.getHit()) + 1 + "");
		dao.recipeHitUpdate(rvo);
		R_RankVO rrvo = new R_RankVO();
		rrvo.setR_idx(rvo.getR_idx());
		rrvo.setR_date(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		if (dao.chkRank(rrvo) != null) {
			rrvo = dao.chkRank(rrvo);
			rrvo.setR_count(Integer.parseInt(rrvo.getR_count()) + 1 + "");
			dao.updateCount(rrvo);
		} else {
			dao.insertCount(rrvo);
		}
		mv.addObject("rvo", rvo);
		return mv;
	}
	
	@RequestMapping("inappropriate")
	public ModelAndView inappropriate() {
		return new ModelAndView("inappropriate");
	}
	
	@RequestMapping("write_recipe")
	public ModelAndView writeRecipe(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("mvo") != null) {
			mv.setViewName("write_recipe");
		} else {
			mv.setViewName("inappropriate");
		}
		return mv;
	}
	
	@RequestMapping(value = "save_recipe", method = RequestMethod.POST)
	public ModelAndView saveRecipe(HttpServletRequest request, RecipeVO rvo) {
		ModelAndView mv = new ModelAndView("redirect:recipe");
		Enumeration<String> enu = request.getParameterNames();
		List<String> paraname = new ArrayList<String>();
		List<String> packs = new ArrayList<String>();
		List<List<String>> materials = new ArrayList<List<String>>();
		List<String> orders = new ArrayList<String>();
		List<String> orderContents = new ArrayList<String>();
		List<String> finImages = new ArrayList<String>();
		while(enu.hasMoreElements()) {
			paraname.add(enu.nextElement());
		}
		for (String k : paraname) {
			if(k.matches("^ing-pack-\\d*$")) {
				if (request.getParameter(k) != "") {
					packs.add(request.getParameter(k));
				} else {
					packs.add("재료");
				}
				materials.add(new ArrayList<String>());
			}
			if(k.matches("^order-text-.*$")) {
				if(request.getParameter(k) != "") orders.add(request.getParameter(k));
			}
			if(k.matches("^recipe-each-name-.*$")) {
				String parano = k.replace("recipe-each-name-", "");
				if(request.getParameter(k) != "") materials.get(Integer.parseInt(parano.substring(0,1)) - 1).add("|" + request.getParameter(k));
			}
			if(k.matches("^recipe-each-quant-.*$")) {
				String parano = k.replace("recipe-each-quant-", "");
				if(request.getParameter(k) != "") materials.get(Integer.parseInt(parano.substring(0,1)) - 1).add(request.getParameter(k) + "|");
			}
			if(k.matches("^comp-image-val-.*$")) {
				if(request.getParameter(k) != "") finImages.add(request.getParameter(k));
			}
		}
		for (int i = 0; i < orders.size(); i++) {
			orderContents.add("|" + request.getParameter("order-text-" + (i + 1)) + ", " + request.getParameter("order-image-" + (i + 1)) + "|");
		}
		materials.removeIf(k -> k.size()==0);
		
		rvo.setM_idx(((MVO)request.getSession().getAttribute("mvo")).getM_idx());
		rvo.setPack(packs.toString());
		rvo.setMaterial(materials.toString());
		rvo.setOrderContent(orderContents.toString());
		rvo.setRegdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date(Calendar.getInstance().getTimeInMillis())));
		if(finImages.size() > 0) {
			rvo.setFinImage(finImages.toString());
		} else {
			rvo.setFinImage("[" + rvo.getMain_image() + "]");
		}
		if(rvo.getA_permission() == null || rvo.getA_permission().equals("")) rvo.setA_permission("0");
		
		dao.getInsert(rvo);
		return mv;
	}
	
	@RequestMapping("count_com")
	@ResponseBody
	public String recipeComCount(@RequestParam String r_idx) {
		return String.valueOf(dao.countRecipeComment(r_idx));
	}
	
	@RequestMapping("recipe_comwrite")
	@ResponseBody
	public String recipeComWrite(RecipeCVO rcvo, HttpSession session) {
		rcvo.setM_idx(((MVO)session.getAttribute("mvo")).getM_idx());
		return String.valueOf(dao.getInsert(rcvo));
	}
	
	@RequestMapping(value = "recipe_comlist", produces = "application/text; charset=utf8")
	@ResponseBody
	public String recipeComList(@RequestParam String r_idx, HttpSession session) {
		List<RecipeCVO> rcvo = dao.getCommentList(r_idx);
		String res = "";
		
		if (rcvo.size() > 0) {
			for (RecipeCVO k : rcvo) {
				res += "<div class='com-pro'></div>"
					+ "<div class='com-content'><div id='com_info" + k.getR_c_idx() + "'><span class='com-writer'>" + k.getName() + "</span>"
					+ "<span class='com-date'>" + k.getRegdate();
				if(session.getAttribute("mvo") != null) {
					if(k.getM_idx().equals(((MVO)session.getAttribute("mvo")).getM_idx()) || ((MVO)session.getAttribute("mvo")).getId().equals("admin")) {
						res += "</span><span class='infobar'>|</span><span class='com-del' onclick='com_del(" + k.getR_c_idx() + ")'>삭제</span>";
					} else {
						res += "</span><span class='infobar'>|</span><span class='com-rep' onclick='com_rep(" + k.getR_c_idx() + ")'>신고</span>";
					}
				}
				res += "</div><div class='com-text'><pre>" + k.getContent_() + "</pre></div></div>";
			}
		} else {
			return res;
		}
		return res;
	}
	
	@RequestMapping("recipe_comdelete")
	@ResponseBody
	public String recipeComDelete(RecipeCVO rcvo) {
		return String.valueOf(dao.deleteRecipeComment(rcvo));
	}
	
	@RequestMapping("video")
	public ModelAndView getVideo() {
		ModelAndView mv = new ModelAndView("video");
		return mv;
	}
	
	@RequestMapping("talk")
	public ModelAndView getTalk(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView("talk");
		// 페이징
		Pageing pvo = new Pageing();
		int count = dao.getT_count();
		String cPage = request.getParameter("cPage");
		pvo.setPagePerBlock(10);
		
		pvo.setTotalRecord(count);
		
		if(pvo.getTotalRecord() <= pvo.getNumPerPage()) {
			pvo.setTotalPage(1);
		}else {
			pvo.setTotalPage(pvo.getTotalRecord()/pvo.getNumPerPage());
			if(pvo.getTotalRecord()%pvo.getNumPerPage() != 0) {
				pvo.setTotalPage(pvo.getTotalPage() +1);
			}
		}
		
		if(cPage == null) {
			pvo.setNowPage(1);
		}else {
			pvo.setNowPage(Integer.parseInt(cPage));
		}
		
		pvo.setBegin((pvo.getNowPage()-1) * pvo.getNumPerPage() +1);
		pvo.setEnd((pvo.getBegin()-1) + pvo.getNumPerPage());
		
		pvo.setBeginBlock((pvo.getNowPage() -1)/ pvo.getPagePerBlock()
							* pvo.getPagePerBlock() +1);
		pvo.setEndBlock(pvo.getBeginBlock() + pvo.getPagePerBlock() -1);
		
		if(pvo.getEndBlock() > pvo.getTotalPage()) {
			pvo.setEndBlock(pvo.getTotalPage());
		}
		List<TVO> list = dao.getTalk_p_List(pvo.getBegin(), pvo.getEnd());
		
		for (int i = 0; i < list.size(); i++) {
			String prf_img = dao.getPrf_img(list.get(i).getM_idx());
			list.get(i).setPrf_img(prf_img);
			list.get(i).setCo_count(String.valueOf((dao.getT_co_count(list.get(i).getT_idx()))));
			if(list.get(i).getFile_name() != null) {
				String str = list.get(i).getFile_name();
				String[] s_arr = str.split(",");
				for (int j = 0; j < s_arr.length; j++) {
					list.get(i).getF_arr().add(s_arr[j]);
				}
			}
		}
		session.setAttribute("cPage", cPage);
		mv.addObject("list", list);
		mv.addObject("pvo", pvo);
		return mv;
	}
	
	@RequestMapping("talk_write")
	public ModelAndView getTalk_write(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (session.getAttribute("mvo") != null) {
			mv.setViewName("talk_write");
		} else {
			mv.setViewName("inappropriate");
		}
		return mv;
	}
	
	@RequestMapping(value = "talk_write_ok", method = RequestMethod.POST)
	public ModelAndView getTalkWrite(TVO tvo, HttpSession session ,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:talk");
		MVO mvo = (MVO)session.getAttribute("mvo");
		tvo.setM_idx(mvo.getM_idx());
		tvo.setHeart("0");
		tvo.setName(mvo.getName());
		
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			tvo.setFile_name("");
			chk:for (MultipartFile i : tvo.getF_name()) {
				if(i.isEmpty()) {
					tvo.setFile_name("");
				}else {
					for (int j = 0; j < tvo.getDeleted().length; j++) {
						if (i.getOriginalFilename().equals(tvo.getDeleted()[j])) {
							continue chk;
						}
					}
					tvo.setFile_name(tvo.getFile_name() + i.getOriginalFilename().concat(","));
					i.transferTo(new File(path + "/" + i.getOriginalFilename()));
				}
			}
			dao.getTalk_write(tvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	@RequestMapping("talk_view")
	public ModelAndView getTalkView(String t_idx, HttpSession session) {
		ModelAndView mv = new ModelAndView("talk_view");
		TVO tvo = dao.getTalk_View(t_idx);
		tvo.setCo_count(String.valueOf(dao.getT_co_count(t_idx)));
		if(tvo.getFile_name() != null) {
			String[] str = tvo.getFile_name().split(",");
			for (int i = 0; i < str.length; i++) {
				tvo.getF_arr().add(str[i]);
			}
		}else {
			tvo.getF_arr().add(null);
		}
		List<TalkCVO> c_list = dao.getT_co_list(t_idx);
		if(c_list != null) {
		mv.addObject("c_list", c_list);
		}
		session.setAttribute("tvo", tvo);
		String cPage = (String)session.getAttribute("cPage");
		if(cPage == null) {
			cPage = "1";
		}
		mv.addObject("cPage", cPage);
		return mv;
	}
	@RequestMapping("talk_update")
	public ModelAndView getTalk_update(HttpSession session) {
		ModelAndView mv = new ModelAndView("talk_update");
		TVO tvo = (TVO)session.getAttribute("tvo");
		
		mv.addObject("tvo", tvo);
		return mv;
	}
	@RequestMapping(value = "talk_update_ok", method = RequestMethod.POST)
	public ModelAndView getTalk_update_ok(TVO tvo,HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:talk");
		TVO otvo = (TVO)request.getSession().getAttribute("tvo");
		boolean cham = true;
		for (MultipartFile k : tvo.getF_name()) {
			if(k.getSize() != 0) {
				cham = false;
			}
		}
		try {
			String path = request.getSession().getServletContext().getRealPath("/resources/upload");
			tvo.setFile_name("");
			
			if(cham == true) {
				tvo.setFile_name(otvo.getFile_name());
			}else {
				chk:for (MultipartFile i : tvo.getF_name()) {
						for (int j = 0; j < tvo.getDeleted().length; j++) {
							if (i.getOriginalFilename().equals(tvo.getDeleted()[j])) {
								continue chk;
							}
						}
					tvo.setFile_name(tvo.getFile_name() + i.getOriginalFilename().concat(","));
					i.transferTo(new File(path + "/" + i.getOriginalFilename()));
				}
			}
			dao.getTalk_update(tvo);
		} catch (Exception e) {
			System.out.println(e);
		}
		return mv;
	}
	@RequestMapping("talk_del")
	public ModelAndView getTalk_del(HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:talk");
		TVO tvo = (TVO)session.getAttribute("tvo");
		dao.getTalk_del(tvo.getT_idx());
		return mv;
	}
	@RequestMapping("t_co_write")
	public ModelAndView getT_c_write(TalkCVO tcvo, HttpSession session) {
		ModelAndView mv = new ModelAndView("redirect:talk_view?t_idx="+tcvo.getT_idx());
		MVO mvo = (MVO)session.getAttribute("mvo");
		tcvo.setM_idx(mvo.getM_idx());
		tcvo.setName(mvo.getName());
		dao.getT_co_write(tcvo);
		
		List<TalkCVO> c_list = dao.getT_co_list(tcvo.getT_idx());
		mv.addObject("c_list", c_list);
		return mv;
	}
	@RequestMapping("talk_c_del")
	public ModelAndView getT_c_del(HttpSession session, String t_c_idx){
		TVO tvo = (TVO)session.getAttribute("tvo");
		ModelAndView mv = new ModelAndView("redirect:talk_view?t_idx=" + tvo.getT_idx());
		dao.getT_c_del(t_c_idx);
		return mv;
	}
	
	@RequestMapping("ranking")
	public ModelAndView ranking() {
		ModelAndView mv = new ModelAndView("ranking");
		R_RankVO rrvo = new R_RankVO();
		rrvo.setR_date(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		List<R_RankVO> rr = dao.todayRecipe(rrvo);
		Calendar today = Calendar.getInstance();
		Map<String, String> rmap = new HashMap<String, String>();
		today.set(Calendar.DAY_OF_MONTH, 1);
		rmap.put("start", new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		today.set(Calendar.DAY_OF_MONTH, today.getActualMaximum(Calendar.DAY_OF_MONTH));
		rmap.put("endt", new SimpleDateFormat("yyyy-MM-dd").format(new Date(today.getTimeInMillis())));
		List<R_RankVO> mrr = dao.monthRecipe(rmap);
		mv.addObject("rr", rr);
		mv.addObject("mrr", mrr);
		return mv;
	}
	
	@RequestMapping("t_com_chklike")
	@ResponseBody
	public String chklike(HttpSession session, TLVO tlvo) {
		tlvo.setM_idx(((MVO)session.getAttribute("mvo")).getM_idx());
		if(dao.getTalkLike(tlvo) > 0) {
			return "1";
		} else {
			return null;
		}
	}
	
	@RequestMapping("t_com_like")
	@ResponseBody
	public String talkLike(HttpSession session, TLVO tlvo) {
		tlvo.setM_idx(((MVO)session.getAttribute("mvo")).getM_idx());
		if(dao.talkLike(tlvo) > 0) {
			dao.talkLikeUpdate(tlvo.getT_idx());
			return "1" ;
		} else {
			return null;
		}
	}
	
	@RequestMapping("t_com_unlike")
	@ResponseBody
	public String talkUnlike(HttpSession session, TLVO tlvo) {
		tlvo.setM_idx(((MVO)session.getAttribute("mvo")).getM_idx());
		if(dao.talkUnlike(tlvo) > 0) {
			dao.talkUnlikeUpdate(tlvo.getT_idx());
			return "1" ;
		} else {
			return null;
		}
	}
	
	@RequestMapping("t_com_countlike")
	@ResponseBody
	public String talkCountLike(TLVO tlvo) {
		return String.valueOf(dao.talkCountLike(tlvo));
	}
	
	@RequestMapping("rep_com_recipe")
	@ResponseBody
	public String reportRecipeComment(QVO qvo, HttpSession session) {
		String con = "";
		String[] tg = qvo.getTg().split(",");
		con += tg[0] + "번 글, " + tg[1] + "번 댓글, ";
		switch (qvo.getRea()) {
			case "1": con += "사유 : 광고/홍보"; break;
			case "2": con += "사유 : 음란/선정성"; break;
			case "3": con += "사유 : 욕설/비방"; break;
			case "4": con += "사유 : 안 맞는 글"; break;
			case "5": con += "사유 : 도배글"; break;
			case "6": con += "사유 : 중복글"; break;
			case "7": con += "사유 : 저작권 위배"; break;
			case "8": con += "사유 : 개인정보 노출"; break;
			case "9": con += "사유 : " + qvo.getEtc(); break;
		}
		qvo.setContent(con);
		qvo.setM_idx(((MVO)session.getAttribute("mvo")).getM_idx());
		qvo.setQ_def("댓글신고");
		int res = dao.insertReport(qvo);
		return String.valueOf(res);

	}
	
//	유튜브 썸네일 URI를 ajax로 받기 위한 메소드
	@RequestMapping("thumbnail")
	@ResponseBody
	public String getThumbnail(@RequestParam("url")String url, HttpServletRequest request) {
		String path = request.getSession().getServletContext().getRealPath("/resources/temp/test.jpg");
		try {
			URL r_url = new URL(url);
			BufferedImage img = ImageIO.read(r_url);
			File file = new File(path);
			ImageIO.write(img, "jpg", file);
			file = new File(path);
			if(file.isFile()) {
				byte[] bt = new byte[(int)file.length()];
				FileInputStream fis = new FileInputStream(file);
				fis.read(bt);
				Encoder encoder = Base64.getEncoder();
				byte[] encodebyte = encoder.encode(bt);
				String out = new String(encodebyte);
				out = "data:image/jpg;base64,"+out;
				fis.close();
				return out;
			}
			return new String(path.getBytes());
		} catch (IIOException e){
		} catch (MalformedURLException e) {
		} catch (IOException e) {
		}
		return null;
	}
}
