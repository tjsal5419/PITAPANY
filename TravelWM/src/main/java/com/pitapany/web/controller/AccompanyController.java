package com.pitapany.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.AccompanyBoardView;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.Style;

@Controller
@RequestMapping("/accompany/*")
public class AccompanyController {

   @Autowired
   private AccompanyBoardDao accompanyBoardDao;

   @Autowired
   private StyleDao styleDao;


   @RequestMapping("/matching")
   public String matching(Model model) {
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
         @RequestParam(value="img", defaultValue="")String img,
         @RequestParam(value="place", defaultValue="")String place,
         @RequestParam(value="locality", defaultValue="")String locality,
         @RequestParam(value="country", defaultValue="")String country) throws ParseException{      

      
      HttpSession session = request.getSession();
      Member member = (Member) session.getAttribute("user");
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
      
      if(!img.equals(""))
         accompanyBoard.setImg(img);
      
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
      int prev = 0;
      if(pageCount >0 && pageCount <=5)
         prev=1;
      /*6페이지 이상부터*/
      else
      {
         if(pageCount%5!=0)
            prev=(pageCount/5)*5;
         else
            prev=(pageCount/5-1)*5;
      }
      
      int next = pageCount;
      
      
      /*System.out.println("page:"+page+"prev"+prev+"next:"+next);*/
      model.addAttribute("prev",prev);
      model.addAttribute("next",next);
      
      /* DB의 min-Limit 설정을 위한 querypage값*/
      int minLimitPage = (page-1)*6;
      
      /*page는 현재 요청 page를 뜻함*/
      
      
      List<AccompanyBoardView> accompanyBoardList = accompanyBoardDao.getList(minLimitPage);
      
      model.addAttribute("page",page);
      model.addAttribute("pageCount",pageCount);
      model.addAttribute("accompanyBoardlist",accompanyBoardList);
      
   
      return "accompany.board";

   }
}