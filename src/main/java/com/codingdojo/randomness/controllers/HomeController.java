package com.codingdojo.randomness.controllers;

import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.randomness.models.Image;
import com.codingdojo.randomness.models.LocationStats;
import com.codingdojo.randomness.models.LoginUser;
import com.codingdojo.randomness.models.User;
import com.codingdojo.randomness.models.Weather;
import com.codingdojo.randomness.models.Image;
import com.codingdojo.randomness.services.CoronaVirusDataService;
import com.codingdojo.randomness.services.ImageService;
import com.codingdojo.randomness.services.UserService;
import com.codingdojo.randomness.services.WeatherService;

@Controller
public class HomeController {

	//
	// Inject the services
	//
	private final UserService userService;
	private final ImageService imageService;
  private final CoronaVirusDataService coronaVirusDataService;

	private final WeatherService weatherService;

	
	//
	// service constructor
	//
	public HomeController(UserService userService, ImageService imageService, CoronaVirusDataService coronaVirusDataService, WeatherService weatherService) {
		super();
		this.userService = userService;
		this.imageService = imageService;
		this.coronaVirusDataService = coronaVirusDataService;
    this.weatherService = weatherService;
	}
	

	// **************************************************************************************************************
	//
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ LANDING PAGE
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ DASHBOARD PAGE
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	//
	// **************************************************************************************************************

	@GetMapping("/randomness/dashboard")
	public String dashboard(
			Model model,
			HttpSession session,
			RedirectAttributes redirectAttributes) {

		// check to see if user is logged in

//		if (session.getAttribute("user_id") == null) {
//			return "redirect:/createError";
//		}

		// get users data to show them logged in
//		model.addAttribute("loggedUser", userService.findUser((Long) session.getAttribute("user_id")));

		return "dashboard.jsp";
	}

	// **************************************************************************************************************
	//
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ RANDOM IMAGES
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
	//
	// **************************************************************************************************************

//     @GetMapping("/randomness/dashboard")
//     public String dashboard(
//     		Model model,
//     		HttpSession session,
//     		RedirectAttributes redirectAttributes) {
    	
//     	// check to see if user is logged in
    	
//     	if (session.getAttribute("user_id") == null) {
//     		return "redirect:/createError";
//     	}
    	
//     	// get users data to show them logged in
//     	model.addAttribute("loggedUser", userService.findUser((Long)session.getAttribute("user_id")));
    	
//         return "dashboard.jsp";
//     }
    
    // **************************************************************************************************************
    //
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  RANDOM IMAGES   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //
    // **************************************************************************************************************
    
	// @GetMapping("/image/search")
    // public String randomImage(@RequestParam(value="q") String searchQuery, Model model) {
	// 	Image newImage = new Image();
	// 	Image returnImage = newImage.getRandomImage(searchQuery);
	// 	model.addAttribute("Image", returnImage);
    //     return "randomPicture.jsp";
    // }

	@GetMapping("/image/search")
    public String randomImage(@RequestParam(required = false, value = "query") String searchQuery, Model model) {
		
		if (searchQuery == "" || searchQuery == null){
			return "redirect:/image/rand";
		}
		try {
			Image newImage = new Image();
			Image returnImage = newImage.getRandomImage(searchQuery);
			model.addAttribute("Image", returnImage);
		} catch (Exception e) {
			model.addAttribute("searchError", "No images found");
		}

        return "randomPicture.jsp";
    }


	
	@GetMapping("/image/rand")
	public String randomImage(Model model) {
		Image newImage = new Image();

		Image returnImage = newImage.getRandomImage();
		model.addAttribute("Image", returnImage);
        return "randomPicture.jsp";
    }

	

    
	// **************************************************************************************************************
    //
    // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  Michael Lay - COvid Cases  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    //
    // **************************************************************************************************************
 
	@GetMapping("/indexCovid") 
	public String covidIndex(Model model) {
		List<LocationStats>allStats = coronaVirusDataService.getAllStats();
		int totalReportedCases = allStats.stream().mapToInt(stat ->stat.getLastestTotalCases()).sum();
		model.addAttribute("locationStats", allStats);
		model.addAttribute("totalReportedCases", totalReportedCases);
		
		return "indexCovid.jsp"; }

	@GetMapping("/randomCovid")
public String random() {
	return "randomCovid.jsp";
}


	// **************************************************************************************************************
	//
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ Random Weather
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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

//		if (session.getAttribute("user_id") == null) {
//			return "redirect:/createError";
//		}

		// get users data to show them logged in
//		model.addAttribute("loggedUser", userService.findUser((Long) session.getAttribute("user_id")));

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
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ LOGIN REGISTRATION
	// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
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

	//Michael Lay


}
