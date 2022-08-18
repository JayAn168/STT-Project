<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!-- 파비콘 -->
    <link rel="icon" href="../img/favicon.ico" />
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
    <link rel="stylesheet" href="${cp}/css/loginheader.css" />

</head>
<body>
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
                  <div id="msg">
                    <a href="${cp}/chat/chat.ct">메시지</a>
                  </div>
                </li>
                <li>
                  <div id="mypage">
                    <a href="javascript:void(0)">마이스푼</a>
                  </div>
                </li>
                <li>
                  <div id="me">
                    <div>
                      <a href="javascript:void(0)">
                        <img src="${cp}/img/spoon(normal).png" alt="실버스푼"/>
                      </a>
                      <ul>
                        <a href=""><li>프로필 관리</li></a>
                        <a href=""><li>전문가 정보</li></a>
                        <a href=""><li>나의 찜목록</li></a>
                        <a href="${cp}/user/userlogout.us"><li>로그아웃</li></a>
                      </ul>
                    </div>
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
</html>