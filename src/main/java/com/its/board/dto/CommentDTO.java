package com.its.board.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class CommentDTO {
        //    댓글DTO
        private Long comment_id;
        private String writer;
        private String content;
        private Timestamp regdate;
        private Long board_id;
        private Long member_id;
        private int commentLike = 0;
}
