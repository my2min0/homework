package com.my.spring.member.model.dao;

import com.my.spring.member.model.dto.Member;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDaoImpl implements MemberDao {
    @Override
    public Member selectMemberById(SqlSession session, String memberId) {
        return session.selectOne("member.selectMemberById", memberId);
    }

    @Override
    public int saveMember(SqlSession session, Member member) {
        return session.insert("member.saveMember", member);
    }
}
