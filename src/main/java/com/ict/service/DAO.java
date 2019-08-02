package com.ict.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class DAO {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public SqlSessionTemplate getSqlSessionTemplate() {
		return sqlSessionTemplate;
	}
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}
	
	public MVO getLogin(MVO mvo) {
		return sqlSessionTemplate.selectOne("login", mvo);
	}
	
	public MVO a_getLogin(MVO mvo) {
		return sqlSessionTemplate.selectOne("login", mvo);
	}
	
	public List<MVO> getList(){
		return sqlSessionTemplate.selectList("list");
	}
	
	public int getJoin(MVO mvo) {
		return sqlSessionTemplate.insert("join", mvo);
	}
	
	public List<RecipeVO> getr_list() {
		return sqlSessionTemplate.selectList("r_list");
	}
	
	public List<RVO> get_recipe_list(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin",begin);
		map.put("end",end);
		return sqlSessionTemplate.selectList("r_list", map);
	}	
	
	public List<MVO> get_member_List(int begin, int end){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("m_list", map);
	}	
	
	public int getRecipeCount() {
		return sqlSessionTemplate.selectOne("recipe_count");
	}
	
	public int getMemberCount() {
		return sqlSessionTemplate.selectOne("member_count");
	}
	
	public MVO getOneMemberList(String name) {
		return sqlSessionTemplate.selectOne("onememberlist", name);
	}

	public List<RVO> getOneRecipeList(String name) {
		return sqlSessionTemplate.selectList("onerecipelist", name);
	}	
	
	public MVO findPw(String email) {
		return sqlSessionTemplate.selectOne("findPw", email);
	}
	
	public int pwUpdate(MVO mvo) {
		return sqlSessionTemplate.update("pwUpdate", mvo);
	}
	
	public void getInsert(RecipeVO rvo) {
		sqlSessionTemplate.insert("insert_recipe", rvo);
	}
	
	public int getInsert(RecipeCVO rcvo) {
		return sqlSessionTemplate.insert("insert_recipe_comment", rcvo);
	}	
	
	public int countRecipe(Map<String, String> camap) {
		return sqlSessionTemplate.selectOne("count_recipe", camap);
	}
	
	public List<RecipeCVO> getCommentList(String r_idx) {
		return sqlSessionTemplate.selectList("recipe_comment_list", r_idx);
	}
	
	public int countRecipeComment(String r_idx) {
		return sqlSessionTemplate.selectOne("count_comment", r_idx);
	}	
	
	public List<RecipeVO> getRecipeList(Map<String, String> pmap) {
		return sqlSessionTemplate.selectList("recipe_list", pmap);
	}
	

	public List<RecipeVO> getRecipeList(int begin, int end) {
		Map<String, Integer> pmap = new HashMap<String, Integer>();
		pmap.put("begin", begin);
		pmap.put("end", end);
		return sqlSessionTemplate.selectList("a_recipe_list", pmap);
	}	

	
	public RecipeVO viewRecipe(String r_idx) {
		return sqlSessionTemplate.selectOne("view_recipe", r_idx);
	}
	public int getTalk_write(TVO tvo){
		return sqlSessionTemplate.insert("talk_write", tvo);
	}
	
	public void recipeHitUpdate(RecipeVO rvo) {
		sqlSessionTemplate.update("rhitupdate", rvo);
	}
	
	public RecipeVO getAdminOneRecipe(String r_idx) {
		return sqlSessionTemplate.selectOne("onelist", r_idx);
	}
	
	
}
