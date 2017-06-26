package com.pitapany.web.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.pitapany.web.dao.AccompanyBoardDao;
import com.pitapany.web.dao.AccompanyBoardFileDao;
import com.pitapany.web.dao.MemberDao;

import com.pitapany.web.dao.StyleDao;
import com.pitapany.web.entity.AccompanyBoard;
import com.pitapany.web.entity.AccompanyBoardFile;
import com.pitapany.web.entity.AccompanyBoardView;
import com.pitapany.web.entity.Member;
import com.pitapany.web.entity.Style;
import com.pitapany.web.security.CustomWebAuthenticationDetails;

import javafx.css.Styleable;

@Controller
@RequestMapping("/accompany/*")
public class AccompanyController {

   @Autowired
   private AccompanyBoardDao accompanyBoardDao;

   @Autowired
   private StyleDao styleDao;
   
   @Autowired
   private AccompanyBoardFileDao accompanyBoardFileDao;


   @Autowired
   private MemberDao memberDao;

   @RequestMapping(value = "matching",
		   method = RequestMethod.GET)
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

      AccompanyBoardView accompanyBoard = accompanyBoardDao.getView(id);
      AccompanyBoardFile file = accompanyBoardFileDao.get(id);
    		  
      model.addAttribute("file", file);
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
         AccompanyBoardFile accompanyBoardFile,
         @RequestParam(value="title",defaultValue=" ")String title,
         @RequestParam(value="lat",defaultValue="0.0")float lat,
         @RequestParam(value="lng",defaultValue="0.0")float lng,
         @RequestParam(value="content",defaultValue="작성된 내용이 없습니다.")String content,
         @RequestParam(value="style",defaultValue="1")String styleId,
         @RequestParam(value="file", defaultValue="null") MultipartFile file,
         @RequestParam(value="place", defaultValue="미등록장소")String place,
         @RequestParam(value="locality", defaultValue="")String locality,
         @RequestParam(value="country", defaultValue="")String country,
         @RequestParam(value="startDate", defaultValue="1999-01-01")String sD,
         @RequestParam(value="endDate", defaultValue="1999-01-01")String eD) throws ParseException{      
	   
	   
	  Member member = ((CustomWebAuthenticationDetails) SecurityContextHolder.getContext().getAuthentication().getDetails()).getMember();
	  String memberId = member.getId();
	  
      AccompanyBoard accompanyBoard = new AccompanyBoard();
      accompanyBoard.setContext(content);
      accompanyBoard.setLatitude(lat);
      accompanyBoard.setLongitude(lng);
      accompanyBoard.setTitle(title);

      java.sql.Date startDate = java.sql.Date.valueOf(sD);
      java.sql.Date endDate = java.sql.Date.valueOf(eD);

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
      
      
      
      if(!file.isEmpty()){
          String path = request.getSession().getServletContext().getRealPath("/resource/upload");
          
          /*String path = "WiynPrj\\resources\\upload";*/
          
          File d = new File(path);
          if(!d.exists())//경로가 존재하지 않는다면
             d.mkdir();
       
          String originalFilename = file.getOriginalFilename(); // fileName.jpg
           String onlyFileName = originalFilename.substring(0, originalFilename.indexOf(".")); // fileName
           String extension = originalFilename.substring(originalFilename.indexOf(".")); // .jpg
          
           String rename = onlyFileName + "_" + getCurrentDayTime() + extension; // fileName_20150721-14-07-50.jpg
           String fullPath = path + "/" + rename;
           
           if (!file.isEmpty()) {
               try {
                   byte[] bytes = file.getBytes();
                   BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
                   stream.write(bytes);
                   stream.close();
                   //model.addAttribute("resultMsg", "파일을 업로드 성공!");
                   System.out.println("업로드 성공");
               } catch (Exception e) {
                   //model.addAttribute("resultMsg", "파일을 업로드하는 데에 실패했습니다.");
                  System.out.println("업로드 실패");
               }
           } else {
               //model.addAttribute("resultMsg", "업로드할 파일을 선택해주시기 바랍니다.");
              System.out.println("업로드 파일 x");
           }
           
           String viewPath = "/resource/upload/";

           accompanyBoardFile.setName(rename);
           accompanyBoardFile.setAccompanyBoardId(accompanyBoard.getId());
           accompanyBoardFile.setSrc(viewPath);
           
           accompanyBoardFileDao.add(accompanyBoardFile);
           
      }       
      
      return "inc/redirect";
   }
  
   
   public String getCurrentDayTime(){
       long time = System.currentTimeMillis();
       SimpleDateFormat dayTime = new SimpleDateFormat("yyyyMMdd-HH-mm-ss", Locale.KOREA);
       return dayTime.format(new Date(time));
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
      

      int minLimitPage = (page-1)*6;
      
      
      List<AccompanyBoardView> accompanyBoardList = accompanyBoardDao.getList(minLimitPage);
      

      model.addAttribute("page",page);
      model.addAttribute("pageCount",pageCount);
      model.addAttribute("accompanyBoardList",accompanyBoardList);

	  List<Style> stlyeList = styleDao.getList();
	  model.addAttribute("styleList",stlyeList);
	
	  
      return "accompany.board";

   }
}