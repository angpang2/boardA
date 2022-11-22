package com.its.board.dto;

import lombok.*;
import org.springframework.web.multipart.MultipartFile;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberDTO {
    private Long id;
    private String member_id;
    private String pw;
    private String pw2;
    private String memberName;
    private String memberType;
    private String profile;
    private MultipartFile memberFile;
    private String originalFileName;
    private String storedFileName;
    private String gender;
}
