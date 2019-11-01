package dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import domain.Record;

@Repository
public class RecordDao {
	
	@Autowired
	private SqlSession session;
	
	public List<Record> selectRecordByPeriod(Map map) {
		return session.selectList("record.selectByPeriod", map);
	}

	public int insert(Record record) {
		return session.insert("record.insert", record);
	}
	
}
