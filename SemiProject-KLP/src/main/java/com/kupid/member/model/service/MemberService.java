package com.kupid.member.model.service;

import static com.kupid.common.JDBCTemplate.close;
import static com.kupid.common.JDBCTemplate.commit;
import static com.kupid.common.JDBCTemplate.getConnection;
import static com.kupid.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kupid.member.model.dao.MemberDao;
import com.kupid.member.model.dto.MemberDto;


public class MemberService {
	private MemberDao dao = new MemberDao();
	public MemberDto selectMemberById(String userId,String password) {
		Connection conn=getConnection();
		MemberDto m=dao.selectMemberById(conn, userId);
		if(m==null||!m.getMemberPw().equals(password)) m=null;
		close(conn);
		return m;
	}
	public int checkId(String nickname) {
		Connection conn = getConnection();
		int result = dao.checkId(conn, nickname);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int checkNickname(String nickname) {
		Connection conn = getConnection();
		int result = dao.checkNickname(conn, nickname);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	public int insertMember(MemberDto m) {
		Connection conn = getConnection();
		int result = dao.insertMember(conn, m);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
