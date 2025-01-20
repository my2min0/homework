package com.my.spring.member.model.dao;

import com.my.spring.member.model.dto.Member;
import org.apache.ibatis.session.SqlSession;

public interface MemberDao {
    Member selectMemberById(SqlSession session, String memberId);
    int saveMember(SqlSession session, Member member);
}
