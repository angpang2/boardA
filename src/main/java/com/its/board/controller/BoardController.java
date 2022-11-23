package com.its.board.controller;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.CommentDTO;
import com.its.board.dto.MemberDTO;
import com.its.board.dto.PageDTO;
import com.its.board.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    public String boardDetail(@ModelAttribute BoardDTO boardDTO,Model model) {
        BoardDTO boardDTO1 = boardService.boardDetail(boardDTO);
        model.addAttribute("board", boardDTO1);
        //댓글 있으면 가져오기
        Long board_id = boardDTO.getBoard_id();
        List<CommentDTO> commentDTOList = boardService.commentList(board_id);
        if (commentDTOList != null) {
            model.addAttribute("commentList", commentDTOList);
            return "board/detail";
        }
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

    @PostMapping("/comment/save")
    //comment 저장하고 list로 가져오기
    public @ResponseBody List<CommentDTO> commentSave2(@ModelAttribute CommentDTO commentDTO){
        boardService.commentSave(commentDTO);
        //board_id를 가지고 commentcount +1 시키기
        Long board_id = commentDTO.getBoard_id();
        System.out.printf("board_id = " + board_id);
        boardService.commentCountUp(board_id);
        //commenet list 가져오기
        List<CommentDTO> commentDTOList = boardService.commentList(board_id);
        return commentDTOList;
    }

    @PostMapping("/board/comment")
    public @ResponseBody List<CommentDTO> commentSave(@ModelAttribute CommentDTO commentDTO){
        boardService.commentSave(commentDTO);
        //board_id를 가지고 commentcount +1 시키기
        Long board_id = commentDTO.getBoard_id();
        System.out.printf("board_id = " + board_id);
        boardService.commentCountUp(board_id);
        //commenet list 가져오기
        List<CommentDTO> commentDTOList = boardService.commentList(board_id);


        return commentDTOList;
    }










}
