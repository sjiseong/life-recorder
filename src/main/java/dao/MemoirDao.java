package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import domain.Memoir;

@Repository
public class MemoirDao {

	@Autowired
	private SqlSession session;
	
	public int insert(Memoir memoir) {
		return session.insert("memoir.insert", memoir);
	}

	public List<Memoir> selectList(HashMap<String, String> map) {
		return session.selectList("memoir.selectList", map);
	}

	public Memoir selectById(int id) {
		return session.selectOne("memoir.selectById", id);
	}
	
}
