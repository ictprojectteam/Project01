package com.ict.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
	
	public List<MVO> getList(){
		return sqlSessionTemplate.selectList("list");
	}
	
	public int sumHit() {
		return sqlSessionTemplate.selectOne("sumHit");
	}
	
	public VisitorVO chkDate() {
		String date = new SimpleDateFormat("yyyy-MM-dd").format(new Date(Calendar.getInstance().getTimeInMillis()));
		return sqlSessionTemplate.selectOne("chkDate", date);
	}
	
	public void insertVisitor(String date) {
		sqlSessionTemplate.insert("insertVisitor", date);
	}
	
	public void updateVisitor(String date) {
		sqlSessionTemplate.update("updateVisitor", date);
	}
	
	public int monthlyVisitor(Map<String, String> vmap) {
		return sqlSessionTemplate.selectOne("monthlyVisitor", vmap);
	}
	
	public int getJoin(MVO mvo) {
		return sqlSessionTemplate.insert("join", mvo);
	}
	
	public int getJoin(ManagerVO mvo) {
		return sqlSessionTemplate.insert("join", mvo);
	}
	
	public int chkEmail(MVO mvo) {
		return sqlSessionTemplate.selectOne("chkEmail", mvo);
	}
	
	public int updateEmail(MVO mvo) {
		return sqlSessionTemplate.update("updateEmail", mvo);
	}
	
	public int chkName(MVO mvo) {
		return sqlSessionTemplate.selectOne("chkName", mvo);
	}
	
	public int updateName(MVO mvo) {
		return sqlSessionTemplate.update("updateName", mvo);
	}
	
	public int chkPw(MVO mvo) {
		return sqlSessionTemplate.selectOne("chkPw", mvo);
	}
	
	public int updatePw(MVO mvo) {
		return sqlSessionTemplate.update("updatePw", mvo);
	}
	
	public int insertReport(QVO qvo) {
		return sqlSessionTemplate.insert("insertReport", qvo);
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
	
	public int countRecipe() {
		return sqlSessionTemplate.selectOne("countRecipe");
	}
	
	public int countRecipe(Map<String, String> camap) {
		return sqlSessionTemplate.selectOne("count_recipe", camap);
	}
	
	public int a_countRecipe(RecipeVO rvo) {
		return sqlSessionTemplate.selectOne("a_count_recipe", rvo);
	}
	
	public List<RecipeCVO> getCommentList(String r_idx) {
		return sqlSessionTemplate.selectList("recipe_comment_list", r_idx);
	}
	
	public int countRecipeComment(String r_idx) {
		return sqlSessionTemplate.selectOne("count_comment", r_idx);
	}
	
	public int deleteRecipeComment(RecipeCVO rcvo) {
		return sqlSessionTemplate.delete("delete_rcomment", rcvo);
	}
	
	public List<RecipeVO> getRecipeList(Map<String, String> pmap) {
		return sqlSessionTemplate.selectList("recipe_list", pmap);
	}
	
	public List<RecipeVO> aRecipeList(RecipeVO rvo) {
		return sqlSessionTemplate.selectList("a_recipe_list", rvo);
	}
	
	public List<RecipeVO> getRecipeList(int begin, int end) {
		Map<String, Integer> pmap = new HashMap<String, Integer>();
		pmap.put("begin", begin);
		pmap.put("end", end);
		return sqlSessionTemplate.selectList("recipe_list", pmap);
	}
	
	public RecipeVO viewRecipe(String r_idx) {
		return sqlSessionTemplate.selectOne("view_recipe", r_idx);
	}
	public int getTalk_write(TVO tvo){
		return sqlSessionTemplate.insert("talk_write", tvo);
	}
	public int talkLike(TLVO tlvo) {
		return sqlSessionTemplate.insert("talklike", tlvo);
	}
	public int talkUnlike(TLVO tlvo) {
		return sqlSessionTemplate.delete("talkunlike", tlvo);
	}
	public void talkLikeUpdate(String t_idx) {
		sqlSessionTemplate.update("t_likeupdate", t_idx);
	}
	public void talkUnlikeUpdate(String t_idx) {
		sqlSessionTemplate.update("t_unlikeupdate", t_idx);
	}
	public int talkCountLike(TLVO tlvo) {
		return sqlSessionTemplate.selectOne("t_countlike", tlvo);
	}
	public List<TVO> getTalk_List(){
		return sqlSessionTemplate.selectList("talk_list");
	}
	public int getTalk_update(TVO tvo) {
		return sqlSessionTemplate.update("talk_update", tvo);
	}
	public String getPrf_img(String m_idx) {
		return  sqlSessionTemplate.selectOne("talk_prf_img", m_idx);
	}
	public List<TVO> getTalk_p_List(int begin, int end){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		return sqlSessionTemplate.selectList("talk_p_list", map);
	}
	public int getT_count() {
		return sqlSessionTemplate.selectOne("t_count");
	}
	public int getTalk_del(String t_idx) {
		sqlSessionTemplate.delete("tl_del", t_idx);
		sqlSessionTemplate.delete("t_del", t_idx);
		return sqlSessionTemplate.delete("talk_del", t_idx);
	}
	public int getT_co_count(String t_idx) {
		return sqlSessionTemplate.selectOne("t_co_count", t_idx);
	}
	public TVO getTalk_View(String t_idx) {
		return sqlSessionTemplate.selectOne("talk_view", t_idx);
	}
	public int getT_co_write(TalkCVO tcvo) {
		return sqlSessionTemplate.insert("t_co_write", tcvo);
	}
	public int getT_c_del(String t_c_idx) {
		return sqlSessionTemplate.delete("t_c_del", t_c_idx);
	}
	public List<TalkCVO> getT_co_list(String t_idx){
		return sqlSessionTemplate.selectList("t_co_list", t_idx);
	}
	public int getTalkLike(TLVO tlvo) {
		return sqlSessionTemplate.selectOne("get_talk_like", tlvo);
	}
	public void recipeHitUpdate(RecipeVO rvo) {
		sqlSessionTemplate.update("rhitupdate", rvo);
	}
	public R_RankVO chkRank(R_RankVO rrvo) {
		return sqlSessionTemplate.selectOne("chkRank", rrvo);
	}
	
	public void updateCount(R_RankVO rrvo) {
		sqlSessionTemplate.update("updateCount", rrvo);
	}
	
	public void insertCount(R_RankVO rrvo) {
		sqlSessionTemplate.insert("insertCount", rrvo);
	}
	
	public List<R_RankVO> todayRecipe(R_RankVO rrvo) {
		return sqlSessionTemplate.selectList("todayRecipe", rrvo);
	}
	
	public List<R_RankVO> monthRecipe(Map<String, String> rmap) {
		return sqlSessionTemplate.selectList("monthRecipe", rmap);
	}
	
	public RecipeVO getAdminOneRecipe(String r_idx) {
		return sqlSessionTemplate.selectOne("onelistrecipe", r_idx);
	}
	
	public int insertRecipeMemo(RecipeMVO rmvo) {
		return sqlSessionTemplate.insert("insertRecipeMemo", rmvo);
	}
	
	public List<RecipeMVO> getRecipeMemoList(RecipeMVO rmvo){
		return sqlSessionTemplate.selectList("getRecipeMemoList", rmvo);
	}
	
	public int getAdminAccept(String r_idx) {
		return sqlSessionTemplate.update("admin_accept", r_idx);
	}
	
	public MVO getAdminOneMember(String m_idx) {
		return sqlSessionTemplate.selectOne("onelistmember", m_idx);
	}
	
	public int getQCount(QVO qvo) {
		return sqlSessionTemplate.selectOne("qCount", qvo);
	}
	
	public List<QVO> getQList(){
		return sqlSessionTemplate.selectList("q_list");
	}
	
	public List<QVO> getQList(QVO qvo) {
		return sqlSessionTemplate.selectList("qlist", qvo);
	}
	
	public RecipeCVO qnaDetail(RecipeCVO rcvo) {
		return sqlSessionTemplate.selectOne("qnaDetail", rcvo);
	}
	
	public void compQnA(QVO qvo) {
		sqlSessionTemplate.update("compQnA", qvo);
	}
	
	public int a_countMember(MVO mvo) {
		return sqlSessionTemplate.selectOne("a_count_member", mvo);
	}
	
	public List<MVO> aMemberList(MVO mvo) {
		return sqlSessionTemplate.selectList("a_member_list", mvo);
	}
	
	public int aCountEvent(EventVO evo) {
		return sqlSessionTemplate.selectOne("a_count_event", evo);
	}
	
	public List<EventVO> aEventList(EventVO evo) {
		return sqlSessionTemplate.selectList("a_event_list", evo);
	}
	
	public EventVO aViewEvent(EventVO evo) {
		return sqlSessionTemplate.selectOne("a_view_event", evo);
	}
	
	public void insertEvent(EventVO evo) {
		sqlSessionTemplate.insert("insertEvent", evo);
	}
	
	public int countEvent(EventVO evo) {
		return sqlSessionTemplate.selectOne("countEvent", evo);
	}
	
	public List<EventVO> eventList(EventVO evo){
		return sqlSessionTemplate.selectList("eventList", evo);
	}
	
	public List<EventVO> prizeList(){
		return sqlSessionTemplate.selectList("prizeList");
	}
	
	public int countMyRecipe(RecipeVO rvo) {
		return sqlSessionTemplate.selectOne("countMyRecipe", rvo);
	}
	
	public List<RecipeVO> myRecipeList(RecipeVO rvo) {
		return sqlSessionTemplate.selectList("myRecipeList", rvo);
	}
	
	public int countMyTalk(String m_idx) {
		return sqlSessionTemplate.selectOne("countMyTalk", m_idx);
	}
	
	public List<TVO> myTalkList(TVO tvo) {
		return sqlSessionTemplate.selectList("myTalkList", tvo);
	}
	
	public int countWriteComment(RecipeCVO rcvo) {
		return sqlSessionTemplate.selectOne("countWriteComment", rcvo);
	}
	
	public List<RecipeCVO> myWriteComment(RecipeCVO rcvo) {
		return sqlSessionTemplate.selectList("myWriteComment", rcvo);
	}
	
	public int countGetComment(RecipeCVO rcvo) {
		return sqlSessionTemplate.selectOne("countGetComment", rcvo);
	}
	
	public List<RecipeCVO> myGetComment(RecipeCVO rcvo) {
		return sqlSessionTemplate.selectList("myGetComment", rcvo);
	}
	
	public int getPrf_img_up(Map<String, String> map) {
		return sqlSessionTemplate.update("myPrf_img_up", map);
	}
	
	public int countManager(ManagerVO mvo) {
		return sqlSessionTemplate.selectOne("countManager", mvo);
	}
	
	public List<ManagerVO> managerList(ManagerVO mvo) {
		return sqlSessionTemplate.selectList("managerList", mvo);
	}
	
	public int chkId(String id) {
		return sqlSessionTemplate.selectOne("chkId", id);
	}
	
	public void regManager(ManagerVO mngvo) {
		sqlSessionTemplate.insert("regManager", mngvo);
	}
	
	public int chkAdmin(MVO mvo) {
		return sqlSessionTemplate.selectOne("chkAdmin", mvo);
	}
}
