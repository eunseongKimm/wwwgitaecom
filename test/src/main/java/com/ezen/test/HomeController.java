package com.ezen.test;

import java.text.DateFormat;


import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class HomeController
{
	@Autowired
	SqlSession sqlSession;
	ArrayList<MDTO>list=new ArrayList<MDTO>();
	
	@RequestMapping(value="/")
	public String m1(HttpServletRequest request)
	{
		HttpSession hs = request.getSession();
		hs.setAttribute("loginstate", false);
		
		return "main";
	}
	
	@RequestMapping(value="/main")
	public String m2()
	{
		return "main";
	}
	
	@RequestMapping(value="/min")
	public String m3()
	{
		return "minput";
	}
	
	@RequestMapping(value="/msave", method=RequestMethod.POST)
	public String m4(HttpServletRequest request, Model m)
	{
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String mname = request.getParameter("mname");
		String tel = request.getParameter("tel");
		String sb = request.getParameter("sb");
		String home = request.getParameter("home");
		String [] a=request.getParameterValues("a");
		String hobby =" ";
	      for(int i=0;i<a.length;i++) {
	      hobby= hobby+a[i]+" ";   
	      }

		String content = request.getParameter("content");
		
		Mservice ms= sqlSession.getMapper(Mservice.class);
		ms.msave(id, pw, mname, tel, sb, home, hobby, content);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/mout")
	public String m5(HttpServletRequest request, Model m)
	{
		HttpSession hs = request.getSession();
		if((Boolean) hs.getAttribute("loginstate"))
		{
		Mservice ms=sqlSession.getMapper(Mservice.class);
		ArrayList<MDTO>list=ms.mout();
		m.addAttribute("list", list);
		return "moutput";
		}
		else
		{
			return "merror";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="/idcheck")
	public String m6(String id)
	{
		Mservice ms=sqlSession.getMapper(Mservice.class);
		int count = ms.idcheck(id);
		String aa="";
		if(count==0)
		{
			aa="ok";
		}
		else
		{
			aa="no";
		}
		return aa;
	}
	
	@RequestMapping(value="/logingo")
	public String m7()
	{
		return "loginform";
	}
	
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public String m8(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		Mservice ms=sqlSession.getMapper(Mservice.class);
		MDTO mdto=ms.logina(id, pw);
		
		if(mdto!=null)
		{
			HttpSession hs =request.getSession();
			hs.setAttribute("member",mdto);
			hs.setAttribute("loginstate", true);
			hs.setMaxInactiveInterval(600);
			return "redirect:/main";
		}
		else
		{
			return "redirect:/logingo";
		}
	}
	
	@RequestMapping(value="/logoutgo")
	public String m9(HttpServletRequest request)
	{
		HttpSession hs=request.getSession();
		hs.removeAttribute("member");
		hs.setAttribute("loginstate", false);
		
		return "redirect:/main";
	}
	
	@RequestMapping(value="/mnotice")
    public String m10(HttpServletRequest request, PageDTO dto,Model m) {
       String nowPage=request.getParameter("nowPage");
       String cntPerPage=request.getParameter("cntPerPage");
       Mservice notice = sqlSession.getMapper(Mservice.class);
     
       int total=notice.cntnotice();
       if(nowPage==null && cntPerPage == null) {
          nowPage="1";
          cntPerPage="5";
       }
       else if(nowPage==null) {
          nowPage="1";
       }
       else if(cntPerPage==null) {
          cntPerPage="5";
       }      
       dto=new PageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
       m.addAttribute("paging",dto);
       m.addAttribute("list",notice.selectnotice(dto));
       return "moutput";
    }
	
	@RequestMapping(value="/deleteb")
	public String m11(HttpServletRequest request)
	{
		String id=request.getParameter("id");
		Mservice ms=sqlSession.getMapper(Mservice.class);
		ms.deletea(id);
		
		return "moutput";
	}
	
	@RequestMapping(value="/modi")
	public String m12(HttpServletRequest request, Model m)
	{
		String id=request.getParameter("id");
		Mservice ms=sqlSession.getMapper(Mservice.class);
		ArrayList<MDTO>list=ms.modia(id);
		m.addAttribute("list", list);
		
		return "modiview";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String m13(MDTO mdto)
	{
		Mservice ms=sqlSession.getMapper(Mservice.class);
		ms.modifya(mdto);
		
		return "redirect:/mout";
	}
	
	@RequestMapping(value="/ser")
	public String m14()
	{
		return "searchform";
	}
	
	@RequestMapping(value="/search2", method=RequestMethod.POST)
	public String m15(HttpServletRequest request, Model m)
	{
		String item=request.getParameter("item");
		String value=request.getParameter("value");
		Mservice ms=sqlSession.getMapper(Mservice.class);
		if(item.equals("id"))
		{
			list=ms.searchid(value);
		}
		else if(item.equals("mname"))
		{
			list=ms.searchmname(value);
		}
		else if(item.equals("home"))
		{
			list=ms.searchhome(value);
		}
		m.addAttribute("list", list);
		return "moutput";
	}
	
}
