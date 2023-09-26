package com.ezen.ww.sangpoom1;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class SangController 
{
	@Autowired
	SqlSession sqlsession;
	
	static String image_path="C:\\study\\spring\\day16_Test\\src\\main\\webapp\\image";
	
	ArrayList<SangDTO> list = new ArrayList<SangDTO>();
	
	@RequestMapping(value="/sanginputgo")
	public String sanginput()
	{
		return "sanginput";
	}
	
	@RequestMapping(value="/sangsave",method=RequestMethod.POST)
	public String sangsave(MultipartHttpServletRequest multi) throws IllegalStateException, IOException
	{
		int spnum = Integer.parseInt(multi.getParameter("spnum"));
		String spname = multi.getParameter("spname");
		String sangho = multi.getParameter("sangho");
		String spdate = multi.getParameter("spdate");
		String scontent = multi.getParameter("scontent");
		int sprice = Integer.parseInt(multi.getParameter("sprice"));
		MultipartFile mf = multi.getFile("spimage");
		String fname = mf.getOriginalFilename();
		SangService ss = sqlsession.getMapper(SangService.class);
		mf.transferTo(new File(image_path+"\\"+fname));
		ss.sanginsert(spnum, spname, sangho, spdate, scontent, sprice, fname);
		return "main";
	}
	
	@RequestMapping(value="/sangoutgo")
	public String sangout(Model mo)
	{
		SangService ss = sqlsession.getMapper(SangService.class);
		ArrayList<SangDTO> list = ss.sangout();
		mo.addAttribute("list", list);
		return "sangout";
	}
	
	@RequestMapping(value="/sangdetail")
	public String sangdetail(HttpServletRequest request,Model mo)
	{
		int spnum = Integer.parseInt(request.getParameter("spnum"));
		SangService ss = sqlsession.getMapper(SangService.class);
		ss.cntup(spnum);
		ArrayList<SangDTO> list1 = ss.sangdetail(spnum);
		mo.addAttribute("list1", list1);
		return "sangdetail";
	}
	
	@RequestMapping(value="/sangdelete")
	public String sangdelete(HttpServletRequest request)
	{
		int spnum = Integer.parseInt(request.getParameter("spnum"));
		SangService ss = sqlsession.getMapper(SangService.class);
		ss.sangdelete(spnum);
		return "redirect:sangoutgo";
	}
	
	@RequestMapping(value="/sangout2go")
	public String sangout2(Model mo)
	{
		SangService ss = sqlsession.getMapper(SangService.class);
		ArrayList<SangDTO> list2 = ss.sangout2();
		mo.addAttribute("list2", list2);
		return "sangout2";
	}
	
	@RequestMapping(value="/sangout3go")
	public String sangout3(Model mo)
	{
		SangService ss = sqlsession.getMapper(SangService.class);
		ArrayList<SangDTO> list3 = ss.sangout3();
		mo.addAttribute("list3", list3);
		return "sangout3";
	}
	
	@RequestMapping(value="/sangsearchgo")
	public String sangsearch()
	{
		return "sangsearch";
	}
	
	@RequestMapping(value="/sangsearch2",method=RequestMethod.POST)
	public String sangsearch2(HttpServletRequest request,Model mo)
	{
		String item = request.getParameter("item");
		String value = request.getParameter("value");
		SangService ss = sqlsession.getMapper(SangService.class);
		if(item.equals("spnum"))
		{
			list = ss.sangsearchspnum(value);
		}
		else if(item.equals("spname"))
		{
			list = ss.sangsearchspname(value);
		}
		mo.addAttribute("list",list);
		return "sangout";
	}
	
	@RequestMapping(value="/sangmodifygo")
	public String sangmodifygo()
	{
		return "sangmodifysearch";
	}
	
	@RequestMapping(value="/sangmodify1",method=RequestMethod.POST)
	public String sangmodify1(HttpServletRequest request,Model mo)
	{
		int spnum = Integer.parseInt(request.getParameter("spnum"));
		SangService ss = sqlsession.getMapper(SangService.class);
		ArrayList<SangDTO> list4 = ss.sangmodify1(spnum);
		mo.addAttribute("list4", list4);
		return "sangmodifyview";
	}
	
	@RequestMapping(value="/sangmodify2",method=RequestMethod.POST)
	public String sangmodify2(MultipartHttpServletRequest multi) throws IllegalStateException, IOException 
	{
		int spnum = Integer.parseInt(multi.getParameter("spnum"));
		String spname = multi.getParameter("spname");
		String sangho = multi.getParameter("sangho");
		String spdate = multi.getParameter("spdate");
		String scontent = multi.getParameter("scontent");
		int sprice = Integer.parseInt(multi.getParameter("sprice"));
		MultipartFile mf = multi.getFile("spimage");
		String fname = mf.getOriginalFilename();
		SangService ss = sqlsession.getMapper(SangService.class);
		mf.transferTo(new File(image_path+"\\"+fname));
		ss.sangmodify2(spnum, spname, sangho, spdate, scontent, sprice, fname);
		return "redirect:sangoutgo";
	}
	
	@RequestMapping(value="/sangnotice")
    public String sangnotice(HttpServletRequest request, PageDTO dto,Model mo) {
       String nowPage=request.getParameter("nowPage");
       String cntPerPage=request.getParameter("cntPerPage");
       SangService notice = sqlsession.getMapper(SangService.class);
       //전체레코드수구하기
       int total=notice.cntnotice();
       if(nowPage==null && cntPerPage == null) {
          nowPage="1";
          cntPerPage="3";
       }
       else if(nowPage==null) {
          nowPage="1";
       }
       else if(cntPerPage==null) {
          cntPerPage="3";
       }      
       dto=new PageDTO(total,Integer.parseInt(nowPage),Integer.parseInt(cntPerPage));
       mo.addAttribute("paging",dto);
       mo.addAttribute("list",notice.selectnotice(dto));
       return "sangout";
    }
}
