package com.project.community.controller;

import com.project.community.domain.BoardDto;
import com.project.community.domain.PageHandler;
import com.project.community.domain.SearchCondition;
import com.project.community.service.BoardService;
import com.project.community.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {
    @Autowired
    BoardService boardService;
    @Autowired
    CommentService commentService;
    @GetMapping("/list")
    public String boardList(SearchCondition searchCondition, Model model, HttpServletRequest request) {
        if (!loginCheck(request)) {
            return "redirect:/login/login?toURL="+request.getRequestURL();
        }
        try {
            int totalCnt = boardService.getSearchResultCnt(searchCondition);
            model.addAttribute("totalCnt", totalCnt);
            // System.out.println("totalCnt = " + totalCnt);
            PageHandler pageHandler = new PageHandler(totalCnt, searchCondition);
            List<BoardDto> list = boardService.getSearchResultPage(searchCondition);
            // System.out.println("list = " + list);

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            ArrayList<String> arrayList = new ArrayList<>();
            for (int i = 0; i < list.size(); i++) {
                String reg_date_mod = simpleDateFormat.format(list.get(i).getReg_date());

                // System.out.println("reg_date_mod = " + reg_date_mod);

                arrayList.add(i, reg_date_mod);

            }

            // System.out.println("arrayList = " + arrayList);

            model.addAttribute("reg_list", arrayList);
            model.addAttribute("ph", pageHandler);
            model.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "boardList";
    }

    @GetMapping("/read")
    public String read(Integer bno, SearchCondition searchCondition, Model model) {
        try {
            BoardDto boardDto = boardService.read(bno);

            Date reg_date = boardDto.getReg_date();

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String reg_date_Mod = simpleDateFormat.format(reg_date);

            // System.out.println("date = " + reg_date_Mod);
            model.addAttribute("reg_date", reg_date_Mod);

            model.addAttribute(boardDto);
            model.addAttribute(searchCondition);
            model.addAttribute("page", searchCondition.getPage());
            model.addAttribute("pageSize", searchCondition.getPageSize());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "board";
    }

    @GetMapping("/write")
    public String write(Model model,SearchCondition searchCondition) {
        model.addAttribute("page", searchCondition.getPage());
        model.addAttribute("pageSize", searchCondition.getPageSize());
        model.addAttribute("mode", "new");
        return "board";
    }
    @PostMapping("/write")
    public String write(BoardDto boardDto, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        String writer = (String) session.getAttribute("id");
        boardDto.setWriter(writer);

        try {
            int rowCnt = boardService.write(boardDto);

            if (rowCnt != 1) {
                throw new Exception("write failed");
            }

            redirectAttributes.addFlashAttribute("msg", "WRT_OK");
            return "redirect:/board/list";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute(boardDto);
            model.addAttribute("msg", "WRT_ERR");
            return "board";
        }
    }
    @PostMapping("/modify")
    public String modify(BoardDto boardDto, SearchCondition searchCondition, HttpSession session, Model model, RedirectAttributes redirectAttributes) {
        String writer = (String) session.getAttribute("id");
        boardDto.setWriter(writer);
        try {
            int rowCnt = boardService.modify(boardDto);

            if (rowCnt != 1) {
                throw new Exception("modify failed");
            }

            model.addAttribute("page", searchCondition.getPage());
            model.addAttribute("pageSize", searchCondition.getPageSize());
            redirectAttributes.addFlashAttribute("msg", "MOD_OK");
            return "redirect:/board/list"+searchCondition.getQueryString();
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute(boardDto);
            model.addAttribute("msg", "MOD_ERR");
            return "redirect:/board/list"+searchCondition.getQueryString();
        }
    }

    @PostMapping("/remove")
    public String remove(Integer bno, SearchCondition searchCondition, Model model, HttpSession session, RedirectAttributes redirectAttributes) {
        String writer = (String) session.getAttribute("id");
        try {
            int rowCnt = boardService.remove(bno, writer);
//            System.out.println("rowCnt = " + rowCnt);
            if (rowCnt != 1) {
                throw new Exception("remove error");
            }
            int rowCnt2 = commentService.removeAll(bno);
//            System.out.println("rowCnt2 = " + rowCnt2);

            model.addAttribute("page", searchCondition.getPage());
            model.addAttribute("pageSize", searchCondition.getPageSize());
            redirectAttributes.addFlashAttribute("msg", "DEL_OK");
            return "redirect:/board/list"+searchCondition.getQueryString();
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("msg","DEL_ERR");
            return "redirect:/board/list"+searchCondition.getQueryString();
        }
    }

    private boolean loginCheck(HttpServletRequest request) {
        HttpSession session = request.getSession();
        return session.getAttribute("id")!=null;
    }
}

