package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import domain.User;
import service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public String getSignin() {
		return "user/signin";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String simpleSignup(@RequestParam String id, @RequestParam String password, @RequestParam String name) {
		User user = new User();
		user.setId(id);
		user.setPassword(passwordEncoder.encode(password));
		user.setName(name);
		userService.insert(user);
		return "redirect:/main";
	}
}
