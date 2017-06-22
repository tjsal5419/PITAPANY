package com.pitapany.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.MemberDao;
import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.AccompanyBoardView;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.Style;
import com.pitapany.web.security.CustomWebAuthenticationDetails;

@Controller
@RequestMapping("/accompany/*")
public class AccompanyController {

   @Autowired
   private AccompanyBoardDao accompanyBoardDao;

   @Autowired
   private StyleDao styleDao;

   @Autowired
   private MemberDao memberDao;

   @RequestMapping("/matching")
   public String matching(Model model) {
	   
	  Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication().getDetails()).getMember();
	  String id = member.getId();
	  
      List<Style> list = styleDao.getList();
      model.addAttribute("styles", list);
      
      return "accompany.matching";
   }

   @RequestMapping(value = "detail", method = RequestMethod.GET)
   public String detail(Model model, String id) {
      accompanyBoardDao.addHits(id);

      AccompanyBoard accompanyBoard = accompanyBoardDao.get(id);
      
      model.addAttribute("accDetail", accompanyBoard);

      return "accompany.detail";
   }

   @RequestMapping(value="/reg",
         method=RequestMethod.GET)
   public String  reg(Model model){
      List<Style> stlyeList = styleDao.getList();

      model.addAttribute(stlyeList);
      return "accompany.reg";
   }

   @RequestMapping(value="/reg",
         method=RequestMethod.POST)
   public String regPost(Model model,
         HttpServletRequest request, 
         HttpServletResponse response,
         @RequestParam(value="title",defaultValue="")String title,
         @RequestParam(value="lat",defaultValue="0.0")float lat,
         @RequestParam(value="lng",defaultValue="0.0")float lng,
         @RequestParam(value="content",defaultValue="")String content,
         @RequestParam(value="style",defaultValue="")String styleId,
         @RequestParam(value="place", defaultValue="")String place,
         @RequestParam(value="locality", defaultValue="")String locality,
         @RequestParam(value="country", defaultValue="")String country) throws ParseException{      

	   
	   
	  Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication().getDetails()).getMember();
	  String memberId = member.getId();
	  
      AccompanyBoard accompanyBoard = new AccompanyBoard();
      accompanyBoard.setContext(content);
      accompanyBoard.setLatitude(lat);
      accompanyBoard.setLongitude(lng);
      accompanyBoard.setTitle(title);
      
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-dd-mm");
      java.sql.Date startDate = new java.sql.Date(sdf.parse("2017-11-11").getTime());
      java.sql.Date endDate = new java.sql.Date(sdf.parse("2018-11-11").getTime());
      
      accompanyBoard.setStartDate(startDate);
      accompanyBoard.setEndDate(endDate);

      accompanyBoard.setStyleId(styleId);
      accompanyBoard.setMemberId(memberId);
      
      accompanyBoard.setPlace(place);
      accompanyBoard.setLocality(locality);
      accompanyBoard.setCountry(country);
      
      accompanyBoardDao.add(accompanyBoard);
      
      
      model.addAttribute("url","accompany/board");
      model.addAttribute("msg","성공적으로 동행등록이 와...와...완료...");
      
      
      
      return "inc/redirect";
   }
   

   @RequestMapping(value="/board",
         method=RequestMethod.GET)
   public String board(Model model,
         @RequestParam(value="p", defaultValue="1")int page,
         @RequestParam(value="sty",defaultValue="")String sty,
         @RequestParam(value="sx",defaultValue="4")int sx,
         @RequestParam(value="a",defaultValue="4")int age){
      
      int count = accompanyBoardDao.count();
      int pageCount = 1;
      
      if(count%6!=0)
         pageCount = count/6+1;
      else if(count%6==0)
         pageCount = count/6;
      
       /*5개 단위의 페이지로 보여줌 1/2/3/4/5*/
      
      // prev: Start index
      // next : end index
      
      int prev = 0;
      int next=0;

      
      if(page%5!=0)
          prev=(page/5)*5+1;
      else
          prev=(page/5-1)*5+1;
      
      if(pageCount-prev<5 && pageCount-prev>=0)
    	  next=pageCount;
      else{
          next=prev+4;
      }
      
      
      /*System.out.println("page:"+page+"prev"+prev+"next:"+next);*/
      model.addAttribute("prev",prev);
      model.addAttribute("next",next);
      
      /* DB의 min-Limit 설정을 위한 querypage값*/
      int minLimitPage = (page-1)*6;
      
      /*page는 현재 요청 page를 뜻함*/
      
      
      List<AccompanyBoardView> accompanyBoardList = accompanyBoardDao.getList(minLimitPage);
      

      model.addAttribute("page",page);
      model.addAttribute("pageCount",pageCount);
      model.addAttribute("accompanyBoardList",accompanyBoardList);

      return "accompany.board";

   }
}