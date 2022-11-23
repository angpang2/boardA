package com.its.board.repository;

import com.its.board.dto.BoardDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BoardRepository {
    @Autowired
    private SqlSessionTemplate sql;


    public BoardDTO boardSave(BoardDTO boardDTO) {
        sql.insert("Board.boardSave",boardDTO);
        return boardDTO;
    }

    public void boardSaveDB(BoardDTO boardDTO) {
        sql.insert("Board.boardSaveDB",boardDTO);
    }

    public BoardDTO boardSelect(BoardDTO boardDTO) {

        return sql.selectOne("Board.boarsSelect",boardDTO);
    }


    public List<BoardDTO> boardList(BoardDTO boardDTO) {
        return sql.selectList("Board.boardList",boardDTO);
    }

    public List<BoardDTO> HomeList(BoardDTO boardDTO) {
        return sql.selectList("Board.boardList",boardDTO);
    }

    public int boardCount() {
        return sql.selectOne("Board.boardCount");
    }

    public BoardDTO boardDetail(BoardDTO boardDTO) {
        return sql.selectOne("Board.boardDetail",boardDTO);
    }

    public void boardUpdate(BoardDTO boardDTO) {
        sql.update("Board.update",boardDTO);
    }

    public void boardDelete(Long board_id) {
        System.out.println("리파지토리board_id = " + board_id);
        sql.delete("Board.delete",board_id);
    }




}
