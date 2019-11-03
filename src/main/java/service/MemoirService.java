package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.MemoirDao;
import domain.Memoir;

@Service
public class MemoirService {

	@Autowired
	private MemoirDao memoirDao;
	
	public int insert(Memoir memoir) {
		return memoirDao.insert(memoir);
	}

	public List<Memoir> getList(String userId, String page) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("page", page);
		return memoirDao.selectList(map);
	}

	public Memoir getById(int id) {
		return memoirDao.selectById(id);
	}
	
}
