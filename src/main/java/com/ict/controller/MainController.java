package com.ict.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Base64.Encoder;
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
import com.ict.service.RVO;
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
	private Pageing pageing;
//	String cPage;
	
	@RequestMapping(value = "/")
	public ModelAndView getIndex() {
		ModelAndView mv = new ModelAndView("index");
		Map<String, String> listmap = new HashMap<String, String>();
		
		listmap.put("begin", "1");
		listmap.put("end", "8");
		listmap.put("a_permission", "1");
		
		List<RecipeVO> r_list = dao.getRecipeList(listmap);
		mv.addObject("r_list", r_list);
		return mv;
	}
	
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
			mv.setViewName("redirect:/");
		} else {
			mv.setViewName("loginfail");
		}
		return mv;
	}
	
	@RequestMapping("join")
	public ModelAndView goJoin() {
		return new ModelAndView("join");
	}
	
	@RequestMapping("join_ok")
	public ModelAndView getInsert(MVO mvo) {
		ModelAndView mv = new ModelAndView("redirect:/");
		dao.getJoin(mvo);
		return mv;
	}
	
	@RequestMapping(value = "m")
	public ModelAndView getAdminLogin() {
		ModelAndView mv = new ModelAndView("admin_login");
		
		return mv;
	}
	
	@RequestMapping(value = "admin", method = {RequestMethod.POST, RequestMethod.GET})
	public ModelAndView a_goLogin(MVO mvo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		MVO r_mvo = dao.getLogin(mvo);
		if (r_mvo != null) {
			session.setAttribute("mvo", r_mvo);
			mv.setViewName("admin");
			List<MVO> list = dao.getList();
			mv.addObject("list", list);
			List<RecipeVO> r_list = dao.getRecipeList(1, 5);
			mv.addObject("r_list", r_list);
		} else {
			mv.setViewName("a_loginfail");
		}
		return mv;
	}
	@RequestMapping(value = "home")
	public ModelAndView getAdmin() {
		ModelAndView mv = new ModelAndView("admin");
		List<MVO> list = dao.getList();
		mv.addObject("list", list);
		List<RVO> r_list = dao.getr_list();
		mv.addObject("r_list", r_list);
		return mv;
	}
	/*
	@RequestMapping(value = "a_recipe")
	public ModelAndView geta_recipe(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("a_recipe");
		int count = dao.getRecipeCount();
		pageing.setTotalRecord(count);
		
		if(pageing.getTotalRecord() <= pageing.getNumPerPage()) {
			pageing.setTotalPage(1);
		}else {
			pageing.setTotalPage(pageing.getTotalRecord() / pageing.getNumPerPage());
			if(pageing.getTotalRecord() % pageing.getNumPerPage() !=0) {
				pageing.setTotalPage(pageing.getTotalPage()+1);
			}
		}
		
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			pageing.setNowPage(1);
		}else {
			pageing.setNowPage(Integer.parseInt(cPage));
		}
		
		pageing.setBegin((pageing.getNowPage()-1)*pageing.getNumPerPage()+1);
		pageing.setEnd((pageing.getBegin()-1)+pageing.getNumPerPage());
		
		pageing.setBeginBlock((pageing.getNowPage()-1) / pageing.getPagePerBlock() * pageing.getPagePerBlock()+1);
		pageing.setEndBlock(pageing.getBeginBlock()+pageing.getPagePerBlock()-1);
		
		if(pageing.getEndBlock() > pageing.getTotalPage()) {
			pageing.setEndBlock(pageing.getTotalPage());
		}
		
		List<RecipeVO> r_list = dao.getRecipeList(pageing.getBegin(), pageing.getEnd());
		mv.addObject("r_list", r_list);
		mv.addObject("pageing", pageing);
	
		return mv;
	}
	*/
	@RequestMapping(value = "a_recipe")
	public ModelAndView geta_recipe() {
		ModelAndView mv = new ModelAndView("a_recipe");
		return mv;
	}
	
	@RequestMapping(value = "admin_rlist", produces = "application/text; charset=utf8")
	@ResponseBody
	public String geta_recipe(HttpServletRequest request) {
		String res = "";
		String name_idx = request.getParameter("name_idx");
		String name = request.getParameter("name");
		String recipe_title = request.getParameter("recipe_title");
		String a_permission = request.getParameter("a_permission");
		String type = request.getParameter("type");
		String cPage = request.getParameter("cPage");
		if (name == null) name = "";
		if (recipe_title == null) recipe_title = "";
		if (a_permission == null) a_permission = "";
		if (type == null) type = "";
		if (cPage == null) cPage = "";
		
		Map<String, String> rmap = new HashMap<String, String>();
		rmap.put("recipe_title", recipe_title);
		rmap.put("a_permission", a_permission);
		rmap.put("type", type);
		if(!name.equals("")) {
			if (name_idx.equals("name")) rmap.put("name", name);;
			if (name_idx.equals("idx_id")) rmap.put("idx_id", name);;
		} else {
			int count = dao.countRecipe(rmap);
			RecipePaging rp = new RecipePaging(count, cPage);
			rmap.put("begin", rp.getBegin() + "");
			rmap.put("end", rp.getEnd() + "");
			List<RecipeVO> rlist = dao.getRecipeList(rmap);
			if (rlist.size() > 0) {
				for (RecipeVO k : rlist) {
					String cond = "승인대기";
					if(k.getA_permission().equals("1")) cond = "승인완료";
					res += "<tr><td>" + k.getR_idx() + "</td><td>" + k.getM_idx() + "</td><td>" + k.getWriter() + "</td><td>" + k.getRecipe_title() + 
							"</td><td>" + k.getRecipe_introduce() + "</td><td>" + k.getRegdate() + "</td><td>" + cond + "</td></tr>";
				}
			} else {
				res += "<tr><td colspan='6'><h3>원하는 정보가 존재하지 않습니다.</h3></td></tr>";
			}
		}
		
		return res;
	}
	
	@RequestMapping(value = "membership")
	public ModelAndView getMembership(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("membership");
		int count = dao.getMemberCount();
		pageing.setTotalRecord(count);
		
		if(pageing.getTotalRecord() <= pageing.getNumPerPage()) {
			pageing.setTotalPage(1);
		}else {
			pageing.setTotalPage(pageing.getTotalRecord() / pageing.getNumPerPage());
			if(pageing.getTotalRecord() % pageing.getNumPerPage() !=0) {
				pageing.setTotalPage(pageing.getTotalPage()+1);
			}
		}
		
		String cPage = request.getParameter("cPage");
		if(cPage == null) {
			pageing.setNowPage(1);
		}else {
			pageing.setNowPage(Integer.parseInt(cPage));
		}
		
		pageing.setBegin((pageing.getNowPage()-1)*pageing.getNumPerPage()+1);
		pageing.setEnd((pageing.getBegin()-1)+pageing.getNumPerPage());
		
		pageing.setBeginBlock((pageing.getNowPage()-1) / pageing.getPagePerBlock() * pageing.getPagePerBlock()+1);
		pageing.setEndBlock(pageing.getBeginBlock()+pageing.getPagePerBlock()-1);
		
		if(pageing.getEndBlock() > pageing.getTotalPage()) {
			pageing.setEndBlock(pageing.getTotalPage());
		}
		
		List<MVO> m_list = dao.get_member_List(pageing.getBegin(), pageing.getEnd());
		mv.addObject("m_list", m_list);
		mv.addObject("pageing", pageing);
	
		return mv;
	}
	
	@RequestMapping(value = "selectonemember.do")
	public ModelAndView getSelectOneMember(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView("selectonemember");
		MVO mvo = dao.getOneMemberList(name);
		mv.addObject("mvo", mvo);
		return mv;
	}

	@RequestMapping(value = "selectonerecipe.do")
	public ModelAndView getSelectOneRecipe(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView("selectonerecipe");
		List<RVO> one_r_list = dao.getOneRecipeList(name);
		mv.addObject("one_r_list", one_r_list);
		return mv;
	}

	@RequestMapping(value = "a_write_recipe")
	public ModelAndView getAdminWriteRecipe() {
		return new ModelAndView("a_write_recipe");
	}
	
	@RequestMapping("logout")
	public ModelAndView getLogout(HttpServletRequest request) {
		String str = request.getHeader("REFERER");
		str = str.substring(str.lastIndexOf("/") + 1, str.length());
		request.getSession().removeAttribute("mvo");
		if (str.equals("")) str = "/";
		return new ModelAndView("redirect:" + str);
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
		System.out.println(count);
		RecipePaging rp = new RecipePaging(count, cPage);
		
		listmap.put("begin", String.valueOf(rp.getBegin()));
		listmap.put("end", String.valueOf(rp.getEnd()));
		
		System.out.println(rp.getBegin());
		System.out.println(rp.getEnd());
		List<RecipeVO> r_list = dao.getRecipeList(listmap);
		System.out.println(r_list.get(0).getRecipe_title());
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
	public ModelAndView viewRecipe(@RequestParam String rno) {
		ModelAndView mv = new ModelAndView("view_recipe");
		RecipeVO rvo = dao.viewRecipe(rno);
		if (rvo.getA_permission().equals("0") || rvo.getSavepublic().equals("0")) {
			mv.setViewName("inappropriate");
			return mv;
		}
		rvo.setHit(Integer.parseInt(rvo.getHit()) + 1 + "");
		dao.recipeHitUpdate(rvo);
		mv.addObject("rvo", rvo);
		return mv;
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
		if(finImages.size() > 0) {
			rvo.setFinImage(finImages.toString());
		} else {
			rvo.setFinImage("[" + rvo.getMain_image() + "]");
		}
		
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
					+ "<div class='com-content'><div class='com-info'><span class='com-writer'>" + k.getWriter() + "</span>"
					+ "<span class='com-date'>" + k.getRegdate();
				if(session.getAttribute("mvo") != null) {
					if(k.getM_idx().equals(((MVO)session.getAttribute("mvo")).getM_idx()))
						res += "</span><span class='infobar'>|</span><span class='com-del' onclick='com_del(" + k.getR_c_idx() + ")'>삭제</span>";
				}
				res += "</div><div class='com-text'><pre>" + k.getContent_() + "</pre></div></div>";
			}
		} else {
			return res;
		}
		return res;
	}
	
	@RequestMapping("video")
	public ModelAndView getVideo() {
		ModelAndView mv = new ModelAndView("video");
		return mv;
	}
	
	@RequestMapping("talk")
	public ModelAndView getTalk(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("talk");
		// 페이징
		Pageing pvo = new Pageing();
		int count = dao.getT_count();		// 전체 게시물 
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
		
		pvo.setBeginBlock((pvo.getNowPage() -1)/pvo.getPagePerBlock()
							* pvo.getPagePerBlock() +1);
		pvo.setEndBlock(pvo.getBeginBlock() + pvo.getPagePerBlock() -1);
		
		if(pvo.getEndBlock() > pvo.getTotalPage()) {
			pvo.setEndBlock(pvo.getTotalPage());
		}
		
		List<TVO> list = dao.getTalk_List(pvo.getBegin(), pvo.getEnd());
		for (int i = 0; i < list.size(); i++) {
			list.get(i).setCo_count(String.valueOf((dao.getT_co_count(list.get(i).getT_idx()))));
			if(list.get(i).getFile_name() != null) {
				String str = list.get(i).getFile_name();
				String[] s_arr = str.split(",");
				for (int j = 0; j < s_arr.length; j++) {
					list.get(i).getF_arr().add(s_arr[j]);
				}
			}
		}
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
			for (MultipartFile i : tvo.getF_name()) {
				if(i.isEmpty()) {
					tvo.setFile_name("");
				}else {
					tvo.setFile_name(tvo.getFile_name() + i.getOriginalFilename().concat(","));
					i.transferTo(new File(path + "/" + i.getOriginalFilename()));
				}
			}
			dao.getTalk_write(tvo);
		} catch (Exception e) {
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
	
	
	@RequestMapping("ranking")
	public ModelAndView ranking() {
		ModelAndView mv = new ModelAndView("ranking");
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
