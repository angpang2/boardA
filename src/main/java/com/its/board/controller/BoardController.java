package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.PageDTO;
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
    public String index(@ModelAttribute BoardDTO boardDTO,Model model){
        List<BoardDTO>boardDTOList = boardService.HomeList(boardDTO);
        model.addAttribute("boardList",boardDTOList);
        BoardDTO boardDTO1 = boardService.boardPage(boardDTO);
        model.addAttribute("paging",boardDTO1);
        return "board/index";
    }
    @GetMapping("/boardWrite")
    public String boardWritePage(){
        return "board/save";
    }

    @PostMapping("/board/save")
    public String boardSave(@ModelAttribute BoardDTO boardDTO, Model model) throws IOException {
        boardService.boardSave(boardDTO);
        List<BoardDTO>boardDTOList = boardService.boardList(boardDTO);
        model.addAttribute("boardList",boardDTOList);
        BoardDTO boardDTO1 = boardService.boardPage(boardDTO);
        model.addAttribute("paging",boardDTO1);

        return "board/index";
    }










}
