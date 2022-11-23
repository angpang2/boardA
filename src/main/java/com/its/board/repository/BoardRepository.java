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
}
