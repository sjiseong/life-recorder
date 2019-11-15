package controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import domain.User;
import service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String getSignin() {
		return "user/signin";
	}
	
	@RequestMapping(value = "user/join", method = RequestMethod.GET)
	public String getSignup(Model model) {
		model.addAttribute("user", new User());
		return "user/join";
	}
	
	@RequestMapping(value = "user/join", method = RequestMethod.POST)
	public String postSignup(@ModelAttribute @Valid User user, BindingResult bindingResult, Model model) {
		System.out.println(user.getId());
		System.out.println(user.getPassword());
		System.out.println(user.getName());
		if (bindingResult.hasErrors()) {
			return "user/join";
		}
		if (userService.getById(user.getId()) != null) {
			model.addAttribute("msg", "이미 존재하는 아이디입니다");
			return "user/join";
		}
		userService.insert(user);
		return "redirect:/main";
	}
	
	@RequestMapping(value="/user/dualcheck/id", method=RequestMethod.POST)
	@ResponseBody
	public String idDuelCheck(@RequestParam String id) {
		if (userService.getById(id) != null) {
			return "duplicated";
		}
		return "nonduplicated";
	}
}
