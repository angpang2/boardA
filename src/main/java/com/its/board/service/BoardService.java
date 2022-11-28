package com.its.board.service;

import com.its.board.dto.BoardDTO;
import com.its.board.dto.BoardlikeDTO;
import com.its.board.dto.CommentDTO;
import com.its.board.repository.BoardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service
public class BoardService {
    @Autowired
    private BoardRepository boardRepository;


    public void boardSave(BoardDTO boardDTO) throws IOException {
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


    public List<BoardDTO> boardList(BoardDTO boardDTO) {
        int page = boardDTO.getPage();
        int start = (page-1)* boardDTO.getPAGE_LIMIT();
        int limit = boardDTO.getPAGE_LIMIT();
        boardDTO.setStart(start);
        boardDTO.setPAGE_LIMIT(limit);
        return boardRepository.boardList(boardDTO);
    }

    public List<BoardDTO> HomeList(BoardDTO boardDTO) {
        int page = boardDTO.getPage();
        int start = (page-1)* boardDTO.getPAGE_LIMIT();
        int limit = boardDTO.getPAGE_LIMIT();
        boardDTO.setStart(start);
        boardDTO.setPAGE_LIMIT(limit);
        return boardRepository.HomeList(boardDTO);
    }

    public BoardDTO boardPage(BoardDTO boardDTO) {
        //전체 글 갯수 조회
        int boardCount = boardRepository.boardCount();
        //필요 페이지 계산
        int maxPage = (int)(Math.ceil((double)boardCount / boardDTO.getPAGE_LIMIT()));
        //시작 페이지 값 계산
        int startPage = (((int)(Math.ceil((double) boardDTO.getPage() / boardDTO.getBLOCK_LIMIT()))) - 1) * boardDTO.getBLOCK_LIMIT() + 1;
        //끝 페이지 값 계산
        int endPage = startPage + boardDTO.getBLOCK_LIMIT() - 1;
        if(endPage>maxPage){
            endPage = maxPage;
        }
        boardDTO.setMaxPage(maxPage);
        boardDTO.setEndPage(endPage);
        boardDTO.setStartPage(startPage);
        return boardDTO;
    }


    public BoardDTO boardDetail(BoardDTO boardDTO) {
        return boardRepository.boardDetail(boardDTO);
    }

    public void boardUpdate(BoardDTO boardDTO) {
        boardRepository.boardUpdate(boardDTO);
    }

    public void boardDelete(Long board_id) {
        boardRepository.boardDelete(board_id);
    }

    public void commentSave(CommentDTO commentDTO) {
        boardRepository.commentSave(commentDTO);

    }
    public void commentCountUp(Long board_id) {
        boardRepository.commentCountUp(board_id);

    }

    public List<CommentDTO> commentList(Long board_id) {
        return boardRepository.commentList(board_id);

    }


    public void boardClick(BoardDTO boardDTO) {
        boardRepository.boardClick(boardDTO);
    }

    public BoardDTO boardLike(Map<String, Long> boardLike) {
       return boardRepository.boardLike(boardLike);

    }


    public BoardlikeDTO boardDu(Map<String, Long> boardLike) {
        return boardRepository.likeDu(boardLike);
    }

    public List<BoardDTO> searchList(BoardDTO boardDTO) {
        int page = boardDTO.getPage();
        int start = (page-1)* boardDTO.getPAGE_LIMIT();
        int limit = boardDTO.getPAGE_LIMIT();
        boardDTO.setStart(start);
        boardDTO.setPAGE_LIMIT(limit);
       return boardRepository.searchList(boardDTO);

    }

    public BoardDTO searchListPage(BoardDTO boardDTO) {
        //전체 글 갯수 조회
        int boardCount = boardRepository.searchCount(boardDTO);
        //필요 페이지 계산
        int maxPage = (int)(Math.ceil((double)boardCount / boardDTO.getPAGE_LIMIT()));
        //시작 페이지 값 계산
        int startPage = (((int)(Math.ceil((double) boardDTO.getPage() / boardDTO.getBLOCK_LIMIT()))) - 1) * boardDTO.getBLOCK_LIMIT() + 1;
        //끝 페이지 값 계산
        int endPage = startPage + boardDTO.getBLOCK_LIMIT() - 1;
        if(endPage>maxPage){
            endPage = maxPage;
        }
        boardDTO.setMaxPage(maxPage);
        boardDTO.setEndPage(endPage);
        boardDTO.setStartPage(startPage);
        return boardDTO;

    }
}
