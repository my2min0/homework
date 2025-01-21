package com.my.spring.member.model.service;

import com.my.spring.member.model.dto.Member;

public interface MemberService {
    Member selectMemberById(String userId);
    int insertMember (Member member);
}
