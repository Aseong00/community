package com.project.community.controller;

import com.project.community.domain.UserDto;
import com.project.community.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    UserService userService;

    @GetMapping("/login")
    public String loginFrom() {
        return "loginForm";
    }

    @PostMapping("/login")
    public String login(String id, String pwd,String toURL, Boolean rememberId, HttpServletRequest request, HttpServletResponse response) throws Exception {
        if (id == "".trim() || pwd == "".trim()) {
            String msg = URLEncoder.encode("회원 정보를 입력하세요.", "UTF-8");
            return "redirect:/login/login?msg=" + msg;
        }

        if (!loginCheck(id, pwd)) {
            String msg = URLEncoder.encode("아이디 혹은 패스워드가 일치하지않습니다.", "UTF-8");
            return "redirect:/login/login?msg=" + msg;
        }

        HttpSession session = request.getSession();
        session.setAttribute("id", id);
        if (rememberId == null) {
            Cookie cookie = new Cookie("id", "id");
            cookie.setMaxAge(0);
            cookie.setPath("/");
            response.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie("id", id);
            cookie.setPath("/");
            response.addCookie(cookie);
        }
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
        return "redirect:"+toURL;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }
    private boolean loginCheck(String id, String pwd) throws Exception {
        UserDto userDto = userService.select(id);
        System.out.println("userDto = " + userDto);
        if (userDto == null) {
            return false;
        }
        return userDto.getPwd().equals(pwd);
    }


}
