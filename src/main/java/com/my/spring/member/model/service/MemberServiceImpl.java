package com.my.spring.member.model.service;

import com.my.spring.member.model.dao.MemberDao;
import com.my.spring.member.model.dto.Member;
import lombok.AllArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
    private MemberDao dao;
    private SqlSession session;

    @Override
    public Member selectMemberById(String userId) {
        return dao.selectMemberById(session, userId);
    }

    @Override
    public int saveMember(Member member) {
        return dao.saveMember(session,member);
    }
}
