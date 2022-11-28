package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private BoardService boardService;
    @GetMapping("/")
    public String Home(@ModelAttribute BoardDTO boardDTO, Model model){

            List<BoardDTO>boardDTOList = boardService.HomeList2(boardDTO);
        List<BoardDTO>boardDTOList2 = boardService.HomeList3(boardDTO);
        List<BoardDTO>boardDTOList3 = boardService.HomeList4(boardDTO);
            model.addAttribute("boardList",boardDTOList);
            model.addAttribute("boardList2",boardDTOList2);
        model.addAttribute("boardList3",boardDTOList3);
            return ("/Home");

        }
    }

