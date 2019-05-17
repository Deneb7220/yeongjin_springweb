package org.YeongJin.book.chap11;

import java.util.List;


public interface MemberDao {

	Member selectByLogin(String email, String password);

	void insert(Member member);

	void update(Member member);

	List<Member> selectAll(int offset, int count);
	
	int countAll();
}