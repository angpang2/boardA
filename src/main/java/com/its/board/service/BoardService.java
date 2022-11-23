package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;


    public void boardSave(BoardDTO boardDTO) {
        boardRepository.boardSave(boardDTO);
    }
}
