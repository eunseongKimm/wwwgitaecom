package com.ezen.ww.member;

import java.util.ArrayList;

public interface MemberService
{
	public void msave(String id, String pw, String mname, String tel, String sb, String home, String hobby, String content);
	public ArrayList<MemberDTO>mout();
	public int idcheck(String id);
	public MemberDTO logina(String id, String pw);
	public int cntnotice();
	public ArrayList<MemberDTO> selectnotice(PageDTO dto);
	public void deletea(String id);
	public ArrayList<MemberDTO>modia(String id);
	public void modifya(MemberDTO mdto);
	public ArrayList<MemberDTO>searchid(String value);
	public ArrayList<MemberDTO>searchmname(String value);
	public ArrayList<MemberDTO>searchhome(String value);
}
