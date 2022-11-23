package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;


    public void boardSave(BoardDTO boardDTO) throws IOException {
        boardRepository.boardSave(boardDTO);
        if(!boardDTO.getBoardFile().isEmpty()) {

            MultipartFile boardFile = boardDTO.getBoardFile();
            String originalFileName = boardFile.getOriginalFilename();
            String storedFileName = System.currentTimeMillis() + "-" + originalFileName;
            String savePath = "D:\\spring_img\\" + storedFileName;
            boardFile.transferTo(new File(savePath));
            boardDTO.setBoardSaveFile(storedFileName);
            BoardDTO savedBoard = boardRepository.boardSave(boardDTO);
            savedBoard.setOriginalFileName(originalFileName);
            savedBoard.setStoredFileName(storedFileName);
            boardRepository.boardSaveDB(savedBoard);


        }else {
            boardRepository.boardSave(boardDTO);
        }
    }
}
