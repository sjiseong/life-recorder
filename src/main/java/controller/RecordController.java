package controller;
import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.Record;
import service.RecordService;
import util.DateUtil;

@Controller
public class RecordController {

	@Autowired
	private RecordService recordService;
	
	@Autowired
	private DateUtil dateUtil;
	
	@RequestMapping(value="/record/getRecord", method=RequestMethod.POST, produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String getRecord(@RequestParam HashMap<String, String> map) throws ParseException {
		long stdTimeMillis = Long.valueOf(map.get("standardTimeMillis"));
		map.put("standardTime", dateUtil.formatDate(new Date(stdTimeMillis)));
		List<Record> list = recordService.getRecordByPeriod(map);
		if (list.isEmpty()) {
			return null;
		}
		StringBuffer sb = new StringBuffer();
		sb.append("<div class=\"record-block\">");
		for(Record record : list) {
			long writeTimeMillis = dateUtil.oracleFormat.parse(record.getWrite_time()).getTime();
			sb.append("<div class=\"record");
			if (record.getType() == 2)
				sb.append(" record-idea");
			sb.append("\" style=\"top:");
			sb.append((stdTimeMillis - writeTimeMillis) / 40000);
			sb.append("px\">");
			sb.append("<div class=\"record-content\">"
					+ "<p class=\"record-title\">");
			sb.append(record.getTitle());
			sb.append("</p>");
			sb.append("<p class=\"record-summary\">");
			sb.append(record.getSummary());
			sb.append("</p>");
			sb.append("<p>");
			sb.append(record.getWrite_time());
			sb.append("</p>");
			sb.append("</div>" +
							"<div class=\"record-line\">" + 
								"<hr class=\"record-hr\" />" + 
							"</div>" + 
						"</div>");
		}
		sb.append("</div>");
		return sb.toString();
	}
	
}
