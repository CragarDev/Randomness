package com.codingdojo.randomness.controllers;

import java.text.ParseException;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.randomness.models.LoginUser;
import com.codingdojo.randomness.models.User;
import com.codingdojo.randomness.models.Weather;
import com.codingdojo.randomness.services.UserService;
import com.codingdojo.randomness.services.WeatherService;




@Controller
public class HomeController {
	
	//
	// Inject the services
	//
	private final UserService userService;
	//
	// Inject the Weather Service
	//
	private final WeatherService weatherService;
	
	//
	// service constructor
	//

	   
    public HomeController(UserService userService, WeatherService weatherService) {
		super();
		this.userService = userService;
		this.weatherService = weatherService;
	}

	
	
	// **************************************************************************************************************
	//
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  Random Weather  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	//
	// **************************************************************************************************************
	

	// constructor for Weather Service


	// route for the standalone page
	@RequestMapping("/randomness/weather")
	public String weather(
			Model model,
    		HttpSession session,
    		RedirectAttributes redirectAttributes) {
		
		// check to see if user is logged in
    	
    	if (session.getAttribute("user_id") == null) {
    		return "redirect:/createError";
    	}
    	
    	// get users data to show them logged in
    	model.addAttribute("loggedUser", userService.findUser((Long)session.getAttribute("user_id")));
    	
    	// grab the new weather from the api
		Weather wad = null;
		try {
			wad = weatherService.weatherData();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("wad", wad);

		return "randomWeather.jsp";
	}
	
	
	
	
	// **************************************************************************************************************
	//
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  LANDING PAGE  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	//
	// **************************************************************************************************************
	





	@GetMapping("/")
    public String index(Model model) {
    	
    	Weather wad = null;
		try {
			wad = weatherService.weatherData();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("wad", wad);

        return "index.jsp";
    }


	@GetMapping("/home")
    public String home() {

        return "redirect:/";
    }

    @GetMapping("/randomness/landing")
    public String randomness() {
    	
    	

        return "redirect:/";
    }

    
    // **************************************************************************************************************
    //
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  DASHBOARD PAGE  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //
    // **************************************************************************************************************
    

    @GetMapping("/randomness/dashboard")
    public String dashboard(
    		Model model,
    		HttpSession session,
    		RedirectAttributes redirectAttributes) {
    	
    	// check to see if user is logged in
    	
    	if (session.getAttribute("user_id") == null) {
    		return "redirect:/createError";
    	}
    	
    	// get users data to show them logged in
    	model.addAttribute("loggedUser", userService.findUser((Long)session.getAttribute("user_id")));
    	
    	

        return "dashboard.jsp";
    }
    
    
    
    
    
    
    
    

	// **************************************************************************************************************
    //
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  LOGIN REGISTRATION  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //
    // **************************************************************************************************************
    

	@GetMapping("/randomness/login")
	public String login(Model model, HttpSession session) {

		// Bind empty User and LoginUser objects to the JSP
		// to capture the form input
		session.invalidate();
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "login.jsp";
	}

	@PostMapping("/randomness/login")
	public String loginProcess(
			@Valid @ModelAttribute("newLogin") LoginUser newLogin,
			BindingResult result,
			Model model,
			HttpSession session) {

		// Add once service is implemented:
		// User user = userServ.login(newLogin, result);
		User user = userService.login(newLogin, result);

		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "login.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.
		session.setAttribute("user_id", user.getId());

		return "redirect:/randomness/dashboard";
	}

	@PostMapping("/randomness/register")
	public String registerProcess(
			@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result,
			Model model,
			HttpSession session) {

		// TO-DO Later -- call a register method in the service
		// to do some extra validations and create a new user!
		userService.register(newUser, result);

		if (result.hasErrors()) {
			// Be sure to send in the empty LoginUser before
			// re-rendering the page.
			model.addAttribute("newLogin", new LoginUser());
			return "login.jsp";
		}

		// No errors!
		// TO-DO Later: Store their ID from the DB in session,
		// in other words, log them in.

		session.setAttribute("user_id", newUser.getId());

		return "redirect:/randomness/dashboard";
	}

	// Log out user
	@GetMapping("/randomness/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/randomness/landing";

	}
	

	//
	// ================== ERRORS ==========================
	//
	@RequestMapping("/createError")
	public String flashMessages(RedirectAttributes redirectAttributes) {
		redirectAttributes.addFlashAttribute("error", "Please log in or Register to enter the site!");
		return "redirect:/randomness/login";
	}

    
    
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	

}
