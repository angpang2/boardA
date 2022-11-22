package com.its.board.controller;

import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/memberJoin")
    public String memberJoin(){
        return "memberPage/memberJoin";
    }
}
