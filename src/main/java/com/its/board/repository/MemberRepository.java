package com.its.board.repository;

import com.its.board.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;
    public void memberJoin(MemberDTO memberDTO) {
        sql.insert("Member.memberJoin",memberDTO);
    }

    public MemberDTO id_check(String member_id) {
        System.out.println("리파지토리member_id = " + member_id);
        MemberDTO result = sql.selectOne("Member.checkId",member_id);
        System.out.println("result = " + result);
        return result;
    }
}
