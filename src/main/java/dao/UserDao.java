package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.session.SessionInformation;
import org.springframework.stereotype.Repository;

import domain.User;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession session;
	
	public User getUserById(String id) {
		return session.selectOne("users.getUserById", id);
	}
	
	public void insert(User user) {
		session.insert("users.insert", user);
	}
}
