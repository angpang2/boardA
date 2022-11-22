package com.its.board.controller;

import com.its.board.dto.MemberDTO;
import com.its.board.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
    @GetMapping("/memberJoin")
    public String memberjoinPage(){
        return "memberPage/memberJoin";
    }
    @PostMapping("/memberJoin")
    public String memberJoin(@ModelAttribute MemberDTO memberDTO) throws IOException {
        System.out.println("memberDTO = " + memberDTO);
        memberService.memberJoin(memberDTO);
        return "index";
    }

    @GetMapping("/id_check")
    public @ResponseBody String id_check(@RequestParam("value1")String member_id){
        System.out.println("member_id = " + member_id);
        MemberDTO result = memberService.check_id(member_id);
        System.out.println("result"+result);
        if(result==null){
            return "yes";
        }else {
            return "no";
        }
    }

    @PostMapping("memberLogin")
    public @ResponseBody String memberLogin(@RequestParam("member_id")String member_id
    , @RequestParam("pw")String pw, HttpSession session){
        System.out.println("member_id = " + member_id + ", pw = " + pw);
        MemberDTO result = memberService.memberLogin(member_id,pw);
        if(result!=null){
            session.setAttribute("member",result);
            return "ok";
        }else {
            return "no";
        }

    }



}
