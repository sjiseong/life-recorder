package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import domain.Record;
import domain.User;
import service.RecordService;

@Controller
public class HomeController {

	@Autowired
	private RecordService recordService;
	
	@RequestMapping(value= {"main", "/", "home"}, method = RequestMethod.GET)
	public String main(@AuthenticationPrincipal User user, Model model) {
		model.addAttribute("userName", user.getName());
		List<Record> recordList = recordService.getRecordInRecentOneDay(user.getId());
		model.addAttribute("recordList", recordList);
		return "home";
	}
	
}
