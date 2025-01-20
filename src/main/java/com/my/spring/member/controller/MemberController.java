package com.my.spring.member.controller;

import com.my.spring.controller.BasicController;
import com.my.spring.member.model.dto.Member;
import com.my.spring.member.model.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequiredArgsConstructor
@Controller
@RequestMapping("/member")
public class MemberController {
    private final MemberService service;
    private final BCryptPasswordEncoder encoder;

    @RequestMapping(value="/login.do")
    public String login(String userId, String password, Model model) {
        Member member = service.selectMemberById(userId);

        encoder.matches(password, member.getPassword());

        if(member == null || !encoder.matches(password, member.getPassword())) {
            model.addAttribute("msg","로그인 실패");
            model.addAttribute("loc","/");
            return "common/msg";
        } else {
            //session.setAttribute("loginMember", member);
            model.addAttribute("loginMember", member);
            return "redirect:/";
        }
    }
}
