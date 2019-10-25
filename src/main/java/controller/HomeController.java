package controller;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import domain.User;

@Controller
public class HomeController {

	@RequestMapping(value= {"main", "/", "home"}, method = RequestMethod.GET)
	public String main(@AuthenticationPrincipal User user, Model model) {
		model.addAttribute("userName", user.getName());
		return "home";
	}
	
}
