package com.ict.service;

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
	
	public MVO findPw(String email) {
		return sqlSessionTemplate.selectOne("findPw", email);
	}
	
	public int pwUpdate(MVO mvo) {
		return sqlSessionTemplate.update("pwUpdate", mvo);
	}
	
	public void getInsert(RecipeVO rvo) {
		sqlSessionTemplate.insert("insert_recipe", rvo);
	}
	
	public int countRecipe(Map<String, String> camap) {
		return sqlSessionTemplate.selectOne("count_recipe", camap);
	}
	
	public List<RecipeVO> getRecipeList(Map<String, String> pmap) {
		return sqlSessionTemplate.selectList("recipe_list", pmap);
	}
	
	public RecipeVO viewRecipe(String r_idx) {
		return sqlSessionTemplate.selectOne("view_recipe", r_idx);
	}
	public int getTalk_write(TVO tvo){
		return sqlSessionTemplate.insert("talk_write", tvo);
	}
}
