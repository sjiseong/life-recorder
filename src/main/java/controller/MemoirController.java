package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import domain.Memoir;
import domain.User;
import service.MemoirService;
import service.UserService;

@Controller
public class MemoirController {

	@Autowired
	private MemoirService memoirService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="memoir", method=RequestMethod.GET)
	public String getList(@AuthenticationPrincipal User user, Model model) {
		List<Memoir> list = memoirService.getList(user.getId(), "1");
		model.addAttribute("memoirList", list);
		return "memoir/list";
	}
	
	@RequestMapping(value="memoir/view", method=RequestMethod.GET)
	public String view(@AuthenticationPrincipal User user, @RequestParam int id, Model model) {
		Memoir memoir = memoirService.getById(id);
		if (memoir == null) {
			model.addAttribute("msg", "요청하신 자료가 존재하지 않습니다");
		} else if (!userService.hasReadAuth(user.getId(), memoir.getWriter())) {
			model.addAttribute("msg", "요청하신 자료를 읽을 권한이 없습니다");
		} else {
			model.addAttribute("memoir", memoir);
			return "memoir/view";
		}
		model.addAttribute("url", "/");
		return "result";
	}
	
	@RequestMapping(value="memoir/insert", method=RequestMethod.POST)
	public String getInsert(Model model) {
		model.addAttribute(new Memoir());
		return "memoir/insert";
	}
	
}
