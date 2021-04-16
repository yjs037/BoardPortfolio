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
     get방식의 url로 글쓰기폼 뷰를 리턴하고 로그인 했을시에 글작성을 할 수 있도록 하였고  
     글 작성 후 1페이지로 이동 할 수 있게 값을 넣어주고 listPage로 리턴 해주었음       
   + /read  
     글번호인 bno를 이용하여 해당 글을 보여주었고 글 출력시 줄바꿈을 적용 하기위해 replace를 이용하여 vo에 담아주었고  
     게시글 조회시 댓글도 같이조회 하여 댓글이있는 게시글은 삭제를 막기위해 댓글의 갯수를 구해 자바스크립트로 삭제를 막아주었음
   + /modify(get), /modify(post)  
     글 작성자의 아이디와 로그인한 아이디를 비교하여 같은 경우에만 수정을 할 수 있도록 하였고 수정 후 해당하는 페이지의 글로 리턴되도록  
     RedirectAttributes을 이용해주었다  
   + /remove  
     수정과 마찬가지로 작성자와 로그인한 아이디를 비교하여 같은 경우에만 삭제를 할 수 있게 하였고 삭제 후 내가 있었던 페이지로 리턴되도록
     RedirectAttributes을 이용해주었다  
   + /replyWrite, /replyUpdate, /replyDelete    
     게시판의 기능들과 동일하게 처리하였음  
     
   2.회원가입  
   + /register(get), /register(post)  
     회원가입시 아이디 중복체크와 유효성을 체크하여야한다. 해당 아이디가 존재하는지 count쿼리로 체킹해주고    
     정규식을 이용해 아이디,비밀번호,이름을 입력하게하였고, 자바스크립트를 통해 아이디 비밀번호 이름의 공백체크,  
     ajax를 이용해 아이디 중복체크 후 가입할 수 있게 하였다 또한, BCryptPasswordEncoder 클래스를 이용하여 입력한 비밀번호를 암호화 해주었다    
  
   3.회원정보수정  
   + /memberUpdateView(get), /memberUpdate(post)
     정규식을 이용해 비밀번호를 변경하도록 해두었고 비밀번호가 공백이거나 잘못되었을 경우 alert가 뜨게 처리하였음
 
   4.회원탈퇴
   + /memberDelete  
     비밀번호가 공백일 경우에 alert가 뜨게 하였고
     ajax를 이용해 비밀번호가 맞으면 탈퇴 틀리면 리턴이되게 하였음  
    
   5.로그인 및 로그아웃  
   + 로그인시 게시판으로 갈 수 있는 링크페이지  
   + /passCchk, /idChk  
   + BCryptPasswordEncoder 클래스를 이용하여 암호화 처리  
   
     
     
     
     
     
     
     
     
     
     
     
     
