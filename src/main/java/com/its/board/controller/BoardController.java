package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.io.IOException;
import java.util.List;

@Controller
public class BoardController {
    @Autowired
    private BoardService boardService;
    @GetMapping("/index")
    public String index(){
        return "board/index";
    }
    @GetMapping("/boardWrite")
    public String boardWritePage(){
        return "board/save";
    }

    @PostMapping("/board/save")
    public String boardSave(@ModelAttribute BoardDTO boardDTO, Model model) throws IOException {
        boardService.boardSave(boardDTO);
        return "board/index";
    }

}
