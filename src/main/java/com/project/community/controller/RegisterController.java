package com.project.community.controller;

import com.project.community.domain.MyAuthentication;
import com.project.community.domain.UserDto;
import com.project.community.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Properties;

@Controller
@RequestMapping("/register")
public class RegisterController {
    @Autowired
    UserService userService;

    @InitBinder
    public void toDate(WebDataBinder binder) {
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(simpleDateFormat, false));
    }

    @GetMapping("/add")
    public String signup() {
        return "registerForm";
    }

    @PostMapping("/add")
    public String addUser(UserDto userDto, RedirectAttributes redirectAttributes) {
        System.out.println("userDto.getNum1() = " + userDto.getNum1());
        System.out.println("userDto.getNum2() = " + userDto.getNum2());
        System.out.println("userDto.getNum() = " + userDto.getNum());
        try {
            int rowCnt = userService.signUp(userDto);

            if (rowCnt != 1) {
                throw new Exception("register_error");
            }
            redirectAttributes.addFlashAttribute("msg", "REG_OK");
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "REG_ERR");
            return "redirect:/register/add";
        }
    }
    @GetMapping("/deleteUser")
    public String deleteUser() {
        return "deleteUser";
    }

    @PostMapping("/deleteUser")
    public String deleteUser(HttpSession session ,String pwd , RedirectAttributes redirectAttributes) {
        try {
            String id = (String)session.getAttribute("id");
            System.out.println("id = " + id);
            if (!deleteCheck(id, pwd)) {
                redirectAttributes.addFlashAttribute("msg", "DEL_ERR");
                return "redirect:/register/deleteUser";
            }

            UserDto userDto = userService.select(id);
            userService.delete(userDto);
            session.invalidate();

            redirectAttributes.addFlashAttribute("msg", "DEL_USER");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }
    @GetMapping("/info")
    public String userInfo(HttpSession session, Model model) throws Exception {
        String id = (String) session.getAttribute("id");

        UserDto userDto = userService.select(id);
        Date date = userDto.getBirth();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String birth = simpleDateFormat.format(date);

        model.addAttribute("birth", birth);
        model.addAttribute(userDto);

        System.out.println("userDto = " + userDto);
        return "userInfo";
    }

    @PostMapping("/info")
    public String userInfoModify(UserDto userDto, RedirectAttributes redirectAttributes) {
        try {
            int rowCnt = userService.update(userDto);

            if (rowCnt != 1) {
                throw new Exception("modify_error");
            }
            redirectAttributes.addFlashAttribute("msg", "USER_MOD_OK");
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "MOD_ERR");
            return "redirect:/register/info";
        }
    }

    @GetMapping("/findId")
    public String findUser() {
        return "findUser";
    }

    @PostMapping("/findId")
    public String findId(String email, RedirectAttributes redirectAttributes) {
        try {
            UserDto userDto = userService.findId(email);

            redirectAttributes.addFlashAttribute("findId", userDto.getId());
            redirectAttributes.addFlashAttribute("msg", "FIND_ID_OK");
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg", "FIND_ERR");
            return "redirect:/register/findId";
        }

        return "redirect:/";
    }

    @GetMapping("/findPwd")
    public String findPwd() {
        return "findPwd";
    }

    @PostMapping("/findPwd")
    public String findUserPwd(String id, String email, RedirectAttributes redirectAttributes) {
        try {
            if (!idCheck(id, email)) {
                redirectAttributes.addFlashAttribute("msg", "FIND_PWD_ERR");
                return "redirect:/register/findPwd";
            }
            int size = 10;
            UserDto userDto = userService.select(id);
            userDto.setPwd(randomPwd(size));
            String pwd = userDto.getPwd();
            mailSend(email, pwd);

            userService.update(userDto);

            redirectAttributes.addFlashAttribute("msg", "FIND_PWD_OK");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:/";
    }

    public Boolean idCheck(String id, String email) throws Exception{
        UserDto userDto = userService.select(id);
        System.out.println("userDto = " + userDto);
        if (userDto == null) {
            return false;
        }
        return userDto.getEmail().equals(email) && userDto.getId().equals(id);
    }

    public static String randomPwd(int size) {
        final String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        SecureRandom secureRandom = new SecureRandom();
        StringBuilder stringBuilder = new StringBuilder();
        for (int i = 0; i < size; i++) {
            int randomindex = secureRandom.nextInt(chars.length());
            stringBuilder.append(chars.charAt(randomindex));
        }
        return stringBuilder.toString();
    }

    public void mailSend(String email, String pwd) {
        Properties properties = System.getProperties();
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.smtp.host", "smtp.naver.com");
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.port", "587");

        Authenticator authenticator = new MyAuthentication();
        Session session = Session.getDefaultInstance(properties, authenticator);
        MimeMessage mimeMessage = new MimeMessage(session);

        try {
            mimeMessage.setSentDate(new Date());
            InternetAddress from = new InternetAddress("sender<community1025@naver.com>");
            mimeMessage.setFrom(from);

            InternetAddress to = new InternetAddress(email);
            mimeMessage.setRecipient(Message.RecipientType.TO, to);

            mimeMessage.setSubject("Community 임시 비밀번호입니다.", "UTF-8");
            mimeMessage.setText("비밀번호는 " + pwd + "입니다. 로그인 후 비밀번호를 변경해주세요", "UTF-8");
            mimeMessage.setHeader("content-Type", "text/html");

            javax.mail.Transport.send(mimeMessage);
        } catch (AddressException addr_e) {
            addr_e.printStackTrace();
        } catch (MessagingException msg_e) {
            msg_e.printStackTrace();
        }
    }
    private boolean deleteCheck(String id, String pwd) throws Exception {
        UserDto userDto = userService.select(id);
        System.out.println("userDto = " + userDto);
        if (userDto == null) {
            return false;
        }
        return userDto.getPwd().equals(pwd);
    }
}
