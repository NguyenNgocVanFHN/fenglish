package vn.framgia.controller.client;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.client.ClientProtocolException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import vn.framgia.bean.GoogleAccountInfo;
import vn.framgia.controller.BaseController;
import vn.framgia.helper.ROLES;

@Controller
public class IndexController extends BaseController {

	@RequestMapping(value = { "/", "home" }, method = RequestMethod.GET)
	public String hello() {
		return "/client/index";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(@RequestParam(value = "error", required = false) final String error, final Model model) {
		return "/client/login";
	}

	@RequestMapping("/logout")
	public String logout(final Model model) {
		return "login";
	}

	@RequestMapping("/login-google")
	public String loginGoogle(HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttributes)
			throws ClientProtocolException, IOException {
		String code = request.getParameter("code");

		if (code == null || code.isEmpty()) {
			return "redirect:/login?google=error";
		}
		String accessToken = googleUtilsService.getToken(code);
		GoogleAccountInfo googleAccountInfo = googleUtilsService.getGoogleAccount(accessToken);
		// check if email exist ?
		if (userService.findByEmail(googleAccountInfo.getEmail()) == null) {
			redirectAttributes.addFlashAttribute("googleAccountInfo", googleAccountInfo);
			return "redirect:/register";
		}

		UsernamePasswordAuthenticationToken authentication = buildAuthentication(googleAccountInfo, request);
		SecurityContextHolder.getContext().setAuthentication(authentication);
		boolean hasAdminRole = authentication.getAuthorities().stream()
				.anyMatch(r -> r.getAuthority().equals(ROLES.ADMIN.toString()));

		session.setAttribute("userName", authentication.getName());
		session.setAttribute("isAdmin", hasAdminRole);

		if (hasAdminRole) {
			return "redirect:/admin";
		}

		return "redirect:/";
	}
	
	@GetMapping("/contact")
	public String aboutUs() {
		return "/client/contact";
	}

	private UsernamePasswordAuthenticationToken buildAuthentication(GoogleAccountInfo googleAccountInfo,
			HttpServletRequest request) {
		UserDetails userDetail = googleUtilsService.buildUser(googleAccountInfo);
		UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail, null,
				userDetail.getAuthorities());
		authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));

		return authentication;
	}

}
