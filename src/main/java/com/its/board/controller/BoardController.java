package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.MemberDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @GetMapping("boardDetail")
    public String boardDetail(@ModelAttribute BoardDTO boardDTO,Model model){
        BoardDTO boardDTO1 = boardService.boardDetail(boardDTO);
        model.addAttribute("board",boardDTO1);
        return "board/detail";
    }

   @PostMapping("/boardUpdate")
    public String boardUpdate(@ModelAttribute BoardDTO boardDTO){
        System.out.println("boardDTO = " + boardDTO);
        boardService.boardUpdate(boardDTO);
        return "redirect:/index";
    }

    @GetMapping("/board/delete")
    public String boardDelete(@RequestParam("board_id")Long board_id){
        System.out.println("board_id = " + board_id);
        boardService.boardDelete(board_id);
        return "redirect:/index";
    }










}
