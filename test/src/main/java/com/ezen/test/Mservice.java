package com.ezen.test;

import java.util.ArrayList;

public interface Mservice
{
	public void msave(String id, String pw, String mname, String tel, String sb, String home, String hobby, String content);
	public ArrayList<MDTO>mout();
	public int idcheck(String id);
	public MDTO logina(String id, String pw);
	public int cntnotice();
	public ArrayList<MDTO> selectnotice(PageDTO dto);
	public void deletea(String id);
	public ArrayList<MDTO>modia(String id);
	public void modifya(MDTO mdto);
	public ArrayList<MDTO>searchid(String value);
	public ArrayList<MDTO>searchmname(String value);
	public ArrayList<MDTO>searchhome(String value);
}
