package controller;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.Record;
import domain.User;
import service.RecordService;
import service.UserService;
import util.DateUtil;

@Controller
public class RecordController {

	@Autowired
	private RecordService recordService;

	@Autowired
	private UserService userService;

	@Autowired
	private DateUtil dateUtil;

	@RequestMapping(value = "/record/getRecord", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public List<Record> getRecord(@RequestParam HashMap<String, String> map) throws ParseException {
		long stdTimeMillis = Long.valueOf(map.get("standardTimeMillis"));
		map.put("standardTime", dateUtil.formatDate(new Date(stdTimeMillis)));
		return recordService.getRecordByPeriod(map);
	}

	@RequestMapping(value = "record/insert", method = RequestMethod.GET)
	public String getInsert(Model model) {
		model.addAttribute("record", new Record());
		return "record/insert";
	}

	@RequestMapping(value = "record/insert", method = RequestMethod.POST)
	public String postInsert(@AuthenticationPrincipal User user, @ModelAttribute @Valid Record record,
			BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			return "record/insert";
		}
		if(record.getWrite_time().isEmpty()) {
			record.setWrite_time(dateUtil.getCurrentTime());
		} else {
			record.setWrite_time(dateUtil.formatDate(new Date(Long.valueOf(record.getWrite_time()))));
		}
		record.setWriter(user.getId());
		if (recordService.insert(record) != 1) {
			model.addAttribute("msg", "등록 실패");
			model.addAttribute("url", "record/insert");
			return "result";
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="record/view", method=RequestMethod.GET)
	public String view(@AuthenticationPrincipal User user, @RequestParam int id, Model model) {
		Record record = recordService.getById(id);
		if (record == null) {
			model.addAttribute("msg", "요청하신 자료가 존재하지 않습니다");
		} else if (!userService.hasReadAuth(user.getId(), record.getWriter())) {
			model.addAttribute("msg", "요청하신 자료를 읽을 권한이 없습니다");
		} else {
			model.addAttribute("record", record);
			return "record/view";
		}
		model.addAttribute("url", "/");
		return "result";
	}
}
