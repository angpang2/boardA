package com.its.board.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class PageDTO {
    private int page = 1; //현재 페이지
    private int maxPage; //필요 페이지
    private int startPage; // 시작 페이지
    private int endPage; // 끝 페이지
    private int PAGE_LIMIT = 5; //표시페이지
    private int BLOCK_LIMIT = 5; //하단 블록
    private int start = 0; //  select * from board_table order by id desc limit #{start} , #{limit} 쿼리 작성시 start에 해당하는 값
}
