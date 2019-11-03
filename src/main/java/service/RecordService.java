package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dao.RecordDao;
import domain.Record;
import util.DateUtil;

@Service
public class RecordService {
	
	@Autowired
	private RecordDao recordDao;
	
	@Autowired 
	private DateUtil dateUtil;
	
	public List<Record> getRecordInRecentOneDay(String userId){
		String curTime = dateUtil.getCurrentTime();
		return getRecordByPeriod(userId, curTime, "1", "0");
	}
	
	public List<Record> getRecordByPeriod(String userId, String standardTime, String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("standardTime", standardTime);
		map.put("start", start); // curTime - start * 1day
		map.put("end", end);
		map.put("userId", userId);
		return recordDao.selectRecordByPeriod(map);
	}
	
	public List<Record> getRecordByPeriod(Map<String, String> map) {
		return recordDao.selectRecordByPeriod(map);
	}

	public int insert(Record record) {
		return recordDao.insert(record);
	}

	public Record getById(int id) {
		return recordDao.selectById(id);
	}
	
}
