package com.its.board.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardDTO {
    private MultipartFile boardFile;
    private String originalFileName;
    private String storedFileName;
    private String boardSaveFile = null;
    private Long board_id;
    private String writer;
    private String title;
    private String content;
    private int hit = 0;
    private int boardLike = 0;
    private Timestamp regdate;
    private Timestamp updatedate;
    private Long member_id;
    //댓글수 추가
    private int commentCount = 0;

    private int page = 1; //현재 페이지
    private int maxPage; //필요 페이지
    private int startPage; // 시작 페이지
    private int endPage; // 끝 페이지
    private int PAGE_LIMIT = 5; //표시페이지
    private int BLOCK_LIMIT = 5; //하단 블록
    private int start = 0; //  select * from board_table order by id desc limit #{start} , #{limit} 쿼리 작성시 start에 해당하는 값
}
