package service;

import java.util.Date;
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
	
	public List<Record> getRecordInRecentOneDay(String userId, String recordType){
		Date date = new Date(System.currentTimeMillis() - 86400000); //1000 * 60 * 60 *24
		String start = dateUtil.formatDate(date);
		String end = dateUtil.getCurrentTime();
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		map.put("userId", userId);
		map.put("type", recordType);
		return recordDao.selectRecordByPeriod(map);
	}
	
}
