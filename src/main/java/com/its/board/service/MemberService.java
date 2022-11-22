package com.its.board.service;

import com.its.board.dto.MemberDTO;
import com.its.board.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@Service
public class MemberService {
    @Autowired
    private MemberRepository memberRepository;
    public void memberJoin(MemberDTO memberDTO) throws IOException {
        if(!memberDTO.getMemberFile().isEmpty()){
            MultipartFile memberFile = memberDTO.getMemberFile();
            String originalFilename = memberFile.getOriginalFilename();
            String storedFilename = originalFilename+"-"+System.currentTimeMillis();
            memberDTO.setProfile(storedFilename);
            String savePath = "D:\\spring_img\\" + storedFilename;
            memberFile.transferTo(new File(savePath));
            memberRepository.memberJoin(memberDTO);
        }else {
            memberRepository.memberJoin(memberDTO);
        }
    }


    public MemberDTO check_id(String member_id) {
        return memberRepository.id_check(member_id);
    }

    public MemberDTO memberLogin(String member_id, String pw) {
        return memberRepository.memberLogin(member_id,pw);
    }
}
