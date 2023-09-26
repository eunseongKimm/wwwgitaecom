package com.ezen.ww.sangpoom1;

import java.util.ArrayList;

public interface SangService 
{
	public void sanginsert(int spnum,String spname,String sangho,
			String spdate,String scontent,int sprice,String spimage);
	public ArrayList<SangDTO> sangout();
	public ArrayList<SangDTO> sangdetail(int spnum);
	public void cntup(int spnum);
	public void sangdelete(int spnum);
	public ArrayList<SangDTO> sangout2();
	public ArrayList<SangDTO> sangout3();
	public ArrayList<SangDTO> sangsearchspnum(String value);
	public ArrayList<SangDTO> sangsearchspname(String value);
	public ArrayList<SangDTO> sangmodify1(int spnum);
	public void sangmodify2(int spnum,String spname,String sangho,
			String spdate,String scontent,int sprice,String spimage);
	public int cntnotice();
	public ArrayList<SangDTO> selectnotice(PageDTO dto);
	
}
