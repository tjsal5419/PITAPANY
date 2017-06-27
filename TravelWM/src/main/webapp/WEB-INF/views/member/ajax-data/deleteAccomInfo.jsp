<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="com.pitany.web.dao.mybatis.MybatisMemberAccompanyInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

%>


<script>

function page(page){
    currentPage = page;
    console.log(currentPage);
    $.post("commentPage", {"page":page ,"id":${n.id }}, function(d) {
          
          $("#commentList").empty();
          $("#pagination").empty();
          var obj = JSON.parse(d);
          var src ="";
         
          if(obj.length != 0){
 
             for (var i = 0; i < obj.length; i++) {
                
                src = "${root}/resource/profile/" +obj[i].profile;
                
                 if(obj[i].memberId=='${loginID}'){
                
                   $("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
                          .append($('<img src='+ src   +' class="circle"> '))
                       .append($('<span class="title">'+obj[i].memberId+'</span>'))
                       .append($('<time>'+js_yyyy_mm_dd_hh_mm_ss(obj[i].regDate)+'</time>'))
                       .append($('<p>'+obj[i].content+'</p>'))
                       .append($('<a class="waves-effect waves-light" onclick="onDelete('+obj[i].id+ ');" value='+obj[i].id+'><i class="material-icons">clear</i></a>')));
                }
                else{
                   $("#commentList").append($('<li class="collection-item avatar">' + + '</li>')
                          .append($('<img src='+ src   +' class="circle"> '))
                          .append($('<span class="title">'+obj[i].memberId+'</span>'))
                          .append($('<time>'+js_yyyy_mm_dd_hh_mm_ss(obj[i].regDate)+'</time>'))
                          .append($('<p>'+obj[i].content+'</p>')));
                } 
             }
              $("#commentList img").error(function() {
        
                   this.src ="${root}/resource/images/avatar.png";
                }); 
            
              
              
              var lastPage = ${size/10+(1-(size/10%1))%1};
               
              var last_block = Math.ceil(lastPage / 5);
 
             
               //현재 블럭 구하기 
               var n_block = Math.ceil(currentPage / 5);
               //페이징의 시작페이지와 끝페이지 구하기
               var s_page = (n_block - 1) * 5 + 1; // 현재블럭의 시작 페이지
               var e_page = n_block * 5; // 현재블럭의 끝 페이지
          
          
              if(n_block != 1){
                     $("#pagination").append($('<li class="waves-effect"><a onclick="prevButton();"><i class="material-icons">chevron_left</i></a></li>'));
                 }
              
              for (var i = s_page; i <= e_page; i++){
                 if (i > lastPage)    break;
                 
    
                 if(page == i){
                    $("#pagination").append($(' <li class="waves-effect active"><a class="page" onclick="page('+i+');" value='+i+'>'+i+'</a></li>'));
                 }
                 else{
                    $("#pagination").append($(' <li class="waves-effect"><a class="page" onclick="page('+i+');" value='+i+'>'+i+'</a></li>'));
                 }
              }
               
    
              if(n_block != last_block){
                $("#pagination").append($('<li class="waves-effect"><a onclick="nextButton();"><i class="material-icons">chevron_right</i></a></li>')); 
              }
               
          }
       
        
          });
  }

</script>