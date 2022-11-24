package com.its.board.dto;

import lombok.*;

import java.sql.Timestamp;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class BoardlikeDTO {
    Long boardLike_id;
    Long board_id = null;
    Long member_id = null;
    private Timestamp regdate;
}
