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
	
	public List<RVO> getr_list() {
		return sqlSessionTemplate.selectList("r_list");
	}
	
	
	public List<RVO> getr_list2(int begin, int end) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin",begin);
		map.put("end",end);
		return sqlSessionTemplate.selectList("r_list", map);
	}
	
	public RVO getSearch(String name) {
		return sqlSessionTemplate.selectOne("search", name);
	}
	
	public int getCount() {
		return sqlSessionTemplate.selectOne("count");
	}
	
}
