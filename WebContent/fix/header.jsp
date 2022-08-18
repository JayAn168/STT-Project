<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@100;200;300;400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css"
      rel="stylesheet"
    />
    <!-- 아이콘 -->
    <script
      src="https://kit.fontawesome.com/bd7db36e77.js"
      crossorigin="anonymous"
    ></script>
    <!-- css -->
    <link rel="stylesheet" href="${cp}/css/common.css" />
    <link rel="stylesheet" href="${cp}/css/header.css">
    <link rel="stylesheet" href="${cp}/css/loginview.css" />
    <!-- JS -->
    <script type="text/javascript" src="http://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
</head>
<body>
    <!-- LOGINMODAL -->
    <div class="modal">
      <div class="modal_body">
          <div class="left_img"></div>
          <div class="right_login">
              <button class="modal_close">×</button>
              <div class="login">
                  <form action="${cp}/user/userloginok.us">
                      <h2>로그인</h2>
                      <div class="input_login">
                          <div class="input_login2">
                              <input type="text" class="input_id" name="userid" placeholder="아이디를 입력해 주세요.">
                          </div>
                      </div>
                      <div class="input_login">
                          <div class="input_login2">
                              <input type="password" class="input_pw" name="userpw" placeholder="비밀번호를 입력해 주세요.">
                          </div>
                      </div>
                      <div class="submit_login">
                          <input role="button" type="submit" value="로그인" id="login">
                      </div>
                      <div class="logincheck">
                          <p><input type="checkbox" name="로그인유지" id="login_keep">
                          </p>
                          <label for="login_keep"><span>로그인 유지</span></label>
                          <p>
                          <a href="${cp}/app/user/findinfo.jsp" class="idpwlook">아이디•비밀번호 찾기</a></p>
                      </div>
                  </form>
                    <div class="snslogin">
                        <p>SNS계정으로 간편하게 로그인하세요.</p>
                        <div class="snslog">
                            <a href="javascript:kakaoLogin()">
                                <button class="kakao_naver">
                                    <img src="${cp}/img/kakao2.png" class="kakaoimg" alt=""><p>카카오 로그인</p>
                                </button>
                            </a>
                        </div>
                        <div>
                            <a id="naverIdLogin_loginButton" href="javascript:void(0)">
                                <div class="snslog" id="naver_id_login">
                                    <button class="naver_kakao" value="네이버 로그인">
                                        <img src="${cp}/img/naver_icon.png" class="naverimg" alt="">
                                        <p>네이버 로그인</p>
                                    </button>
                                </div>
                            </a>
                        </div>
                    </div>
                  <div class="line">
                  </div>
                  <div class="join">
                      <div class="join1">
                          <p><strong>회원가입</strong>을 원하시면 가입 버튼을 눌러주세요.</p>
                      </div>
                      <div class="join2">
                      <a href="${cp}/app/user/join1.jsp">
                          <button class="join_button">
                          Set The Table 회원가입 하기
                          </button>
                      </a>
                      </div>
                  </div>
              </div>
              </div>
          </div>
      </div>
  </div>
    <!-- HEADER -->
    <div class="wrapper">
      <header>
        <div class="inner">
          <div id="headup">
            <div id="logo">
              <a href="${cp}">
                <img src="${cp}/img/logo.png" alt="Set The Table" />
              </a>
            </div>
            <div id="search">
              <form action="javascript:void(0)" method="post" name="searchForm">
                <input
                  type="text"
                  name="search"
                  id="headSearch"
                  autocomplete="off"
                  placeholder="서비스, 쉐프를 검색해 보세요!"
                />
                <i class="fa-solid fa-magnifying-glass"></i>
              </form>
            </div>
            <ul>
              <li>
                <div id="reg">
                  <a href="javascript:void(0)">전문가 등록</a>
                </div>
              </li>
              <li>
                <div id="login">
                  <a href="javascript:openpop()" class="btn-open-popup">로그인</a>
                </div>
              </li>
              <li>
                <div id="join">
                  <a href="${cp}/app/user/join1.jsp">무료 회원가입</a>
                </div>
              </li>
            </ul>
          </div>
          <div id="headdown">
            <div>
              <a href="" id="allcategory">
                <i class="fa-solid fa-bars"></i>
                <div>전체 카테고리</div>
                <i class="fa-solid fa-caret-down"></i>
              </a>
              <ul class="displayNone1">
                <li>비즈니스</li>
                <li>
                  <a href="">
                    IT∙프로그래밍
                    <i class="fa-solid fa-chevron-right"></i>
                  </a>
                </li>
                <li>
                  <a href=""
                    >디자인 <i class="fa-solid fa-chevron-right"></i
                  ></a>
                </li>
                <li>
                  <a href=""
                    >영상∙사진∙음향 <i class="fa-solid fa-chevron-right"></i
                  ></a>
                </li>
                <li>
                  <a href=""
                    >마케팅 <i class="fa-solid fa-chevron-right"></i
                  ></a>
                </li>
                <li>
                  <a href=""
                    >번역∙통역 <i class="fa-solid fa-chevron-right"></i
                  ></a>
                </li>
                <li>
                  <a href=""
                    >문서∙글쓰기 <i class="fa-solid fa-chevron-right"></i
                  ></a>
                </li>
                <li>
                  <a href=""
                    >비즈니스컨설팅 <i class="fa-solid fa-chevron-right"></i
                  ></a>
                </li>
                <li>
                  <a href=""
                    >주문제작 <i class="fa-solid fa-chevron-right"></i
                  ></a>
                </li>
                <li>
                  <a href=""
                    >세무∙법무∙노무 <i class="fa-solid fa-chevron-right"></i
                  ></a>
                </li>
              </ul>
            </div>
            <div id="sub_menu">
              <div id="sub_item1">
                <a href="">프라임</a>
                <div><b>TOP 2% 전문가</b>의 서비스를 만나보세요!</div>
              </div>
              <div id="sub_item2">
                <a href="">엔터프라이즈</a>
                <div>
                  <b>기업 외주 ∙ 상주 ∙ 정부지원사업</b> 전용 솔루션입니다.
                </div>
              </div>
              <div id="sub_item3">
                <a href="">코드리뷰</a>
                <div><b>내</b> <b>코</b>드 <b>좀</b> <b>봐</b>주세요!!</div>
              </div>
            </div>
            <div id="pj">
              <a href="">
                원하는 서비스를 못 찾겠다면, <b>프로젝트 의뢰</b>하세요!
              </a>
              <i class="fa-solid fa-chevron-right"></i>
            </div>
          </div>
        </div>
      </header>
</body>
<script>
  const modal = document.querySelector(".modal");
  const btnOpenPopup = document.querySelector(".btn-open-popup");
  const body = document.querySelector("body");
  btnOpenPopup.addEventListener("click", function openpop() {
    modal.style.display = "block";
    modal.style.zIndex = "999";
    modal.style.position = "fixed";
  });
  const modalclose = document.querySelector(".modal_close");
  modalclose.addEventListener("click", () => {
    modal.style.display = "none";
  });
  // 모달 on
  body.style.overflow = "hidden";
  // 모달 off
  body.style.overflow = "auto";
  
  Kakao.init("8d4eab699192415f5b2eb69fb710606d");
  function kakaoLogin(){
    Kakao.Auth.loginForm({
      scope:"profile_nickname,account_email,gender,age_range,birthday",
      success:function(authObj){
        console.log(authObj);
        Kakao.API.request({
          url:"/v2/user/me",
          success:function(res){
            console.log(res);
            let email = res.kakao_account.email;
            location.href="/KakaLoginOK/"+email;
          }
        });
      }
    });
  }
  var naverLogin = new naver.LoginWithNaverId(
          {
              clientId: "eydQiCAA6MUq8olbhUee", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
              callbackUrl: "http://127.0.0.1:5500", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
              isPopup: false,
              callbackHandle: true
          }
      );	
  naverLogin.init();
  window.addEventListener('load', function () {
      naverLogin.getLoginStatus(function (status) {
          if (status) {
              var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
              
              console.log(naverLogin.user); 
              
              if( email == undefined || email == null) {
                  alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
                  naverLogin.reprompt();
                  return;
              }
          } else {
              console.log("callback 처리에 실패하였습니다.");
          }
      });
  });
  var testPopUp;
  function openPopUp() {
      testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
  }
  function closePopUp(){
      testPopUp.close();
  }
  function naverLogout() {
      openPopUp();
      setTimeout(function() {
          closePopUp();
          }, 1000);
      
      
  }
  </script>
</html>