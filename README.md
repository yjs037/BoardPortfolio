# spring frmaework MVC게시판 & 로그인

# 목적
   + 신입 웹 개발자의 기본소양이며 어떠한 웹이든 게시판은 필수 요소라고 생각함

### 1. 개발환경:  
   + OS : Windows 10  
   + Spring framework version : 4.3.22RELEASE  
   + Java version : 1.8  
   + WEB Server : Apache  
   + WAS Server : Tomcat 8.0  
   + ORM : mybatis 3.5.5  
   + DB : mariadb 10.5.5  

### 2. 기능:  
  1.MVC게시판/crud    
  + 리스트(페이징처리)   
  + 글쓰기    
  + 글읽기    
  + 글수정   
  + 글삭제  
  + 댓글작성    
  + 댓글수정   
  + 댓글삭제    
  + 검색
  + 조회수    
  
  #### 2.회원    
  + 회원가입    
  + 회원수정    
  + 회원탈퇴    
  
   #### 3.로그인/로그아웃    
  + 사용자 로그인/로그아웃   
  
### 3. controller url설명  
   1.MVC게시판/crud    
   + /listPage  
     페이징처리를하여 각 페이지당 10개씩 리스트를 출력 할 수 있게했고 5개의 페이지씩 나타나도록 처리하였음  
   + /write(get),/write(post)  
     get방식의 url로 글쓰기폼 뷰를 리턴하고, 글 작성 후 1페이지로 이동 할 수 있게 값을 넣어주고 listPage로 리턴 해주었음       
   + /read
     글번호인 bno를 이용하여 해당 글을 보여주었고 글 출력시 줄바꿈을 적용 하기위해 replace를 이용하여 vo에 담아주었고  
     게시글 조회시 댓글도 같이조회 하여 댓글이있는 게시글은 삭제를 막기위해 댓글의 갯수를 구해주었음  
   + /modify(get), /modify(post)  
