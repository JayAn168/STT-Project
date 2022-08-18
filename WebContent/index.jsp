<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<%@ page errorPage = "/app/error/errorpage.jsp" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Set The Table</title>
    <!-- 파비콘 -->
    <link rel="icon" href="${cp}/img/favicon.ico" />
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
    <!-- SWIPER -->
    <!-- Link Swiper's CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.css"
    />
    <!-- Swiper JS -->
    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <!-- TYPING ANIMATION -->
    <script src="https://www.cssscript.com/demo/simple-typewriter-effect-pure-javascript-typewriterjs/typewriter.js"></script>
    <!-- css -->
    <link rel="stylesheet" href="${cp}/css/common.css" />
    <link rel="stylesheet" href="${cp}/css/index.css?after" />
    <!-- JS -->
    <script defer src="${cp}/js/main.js"></script>
    <script>
      console.log("hello");
      console.log("bye");
      console.log("jeahyun");
      console.log("hyomyeong");
    </script>
  </head>
  <body>
    <c:choose>
      <c:when test="${loginUser != null}">
        <%@ include file="/fix/loginheader.jsp" %>
      </c:when>
      <c:otherwise> <%@ include file="/fix/header.jsp" %> </c:otherwise>
    </c:choose>
    <!-- SWIPER_AD -->
    <section id="swiper_ad">
      <div class="inner">
        <div id="search2">
          <h1>
            프리랜서 마켓 No.1 STT에서<br />
            원하는 전문가를 찾아보세요!
          </h1>
          <form action="javascript:void(0)" method="post" name="searchForm">
            <div id="typingAnimation">
              <span id="gocoder_typing"></span>
              <input
                name="search"
                id="hidden_search"
                role="search"
                maxlength="15"
                autocomplete="off"
                autocorrect="off"
                autocapitalize="off"
                value=""
                onfocus="remove()"
                onblur="append()"
              />
              <i class="fa-solid fa-magnifying-glass"></i>
            </div>
          </form>
          <div id="hashtag">
            <div class="hashtag"><a href="">#기획</a></div>
            <div class="hashtag"><a href="">#커머스</a></div>
            <div class="hashtag"><a href="">#데이터베이스</a></div>
            <div class="hashtag"><a href="">#모바일</a></div>
            <div class="hashtag"><a href="">#챗봇</a></div>
          </div>
        </div>
        <!-- Swiper -->
        <div class="swiper mySwiper" id="bgc">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <img src="${cp}/img/swiper1.png" alt="" />
              <p id="slide1"></p>
            </div>
            <div class="swiper-slide">
              <img src="${cp}/img/swiper2.png" alt="" />
              <p id="slide2"></p>
            </div>
            <div class="swiper-slide">
              <img src="${cp}/img/swiper3.png" alt="" />
              <p id="slide3"></p>
            </div>
            <div class="swiper-slide">
              <img src="${cp}/img/swiper4.png" alt="" />
              <p id="slide4"></p>
            </div>
            <div class="swiper-slide">
              <img src="${cp}/img/swiper5.png" alt="" />
              <p id="slide5"></p>
            </div>
            <div class="swiper-slide">
              <img src="${cp}/img/swiper7.png" alt="" />
              <p id="slide7"></p>
            </div>
            <div class="swiper-slide">
              <img src="${cp}/img/swiper6.png" alt="" />
              <p id="slide6"></p>
            </div>
          </div>
          <div class="swiper-button-next" id="nextbtn">
            <i class="fa-solid fa-chevron-right"></i>
          </div>
          <div class="swiper-button-prev" id="prevbtn">
            <i class="fa-solid fa-chevron-left"></i>
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section>
    <!-- CATEGORY -->
    <section id="category">
      <div class="inner">
        <h1>다양한 카테고리에서 필요한 서비스를 찾아보세요!</h1>
        <div id="category_items">
          <div class="businessText">비즈니스</div>
          <div class="businessCategory">
            <a href="">
              <img src="${cp}/img/ic_category_1.png" alt="디자인" />
              <span>디자인</span>
            </a>
            <a href="">
              <img src="${cp}/img/ic_category_2.png" alt="IT∙프로그래밍" />
              <span>IT∙프로그래밍</span>
            </a>
            <a href="">
              <img src="${cp}/img/ic_category_3.png" alt="영상∙사진∙음향" />
              <span>영상∙사진∙음향</span>
            </a>
            <a href="">
              <img src="${cp}/img/ic_category_4.png" alt="마케팅" />
              <span>마케팅</span>
            </a>
            <a href="">
              <img src="${cp}/img/ic_category_5.png" alt="번역∙통역" />
              <span>번역∙통역</span>
            </a>
            <a href="">
              <img src="${cp}/img/ic_category_6.png" alt="문서∙글쓰기" />
              <span>문서∙글쓰기</span>
            </a>
            <a href="">
              <img src="${cp}/img/ic_category_7.png" alt="비즈니스컨설팅" />
              <span>비즈니스컨설팅</span>
            </a>
            <a href="">
              <img src="${cp}/img/ic_category_8.png" alt="주문제작" />
              <span>주문제작</span>
            </a>
            <a href="">
              <img src="${cp}/img/ic_category_9.png" alt="세무∙법무∙노무" />
              <span>세무∙법무∙노무</span>
            </a>
          </div>
        </div>
      </div>
    </section>
    <!-- COUPON -->
    <a href="" id="coupon">
      <img src="${cp}/img/coupon.png" alt="쿠폰" />
    </a>
    <!-- FAVORITE -->
    <section id="favorite">
      <div class="inner">
        <h2>STT에서 가장 인기있는 분야!</h2>
        <div id="favorite_items">
          <img src="${cp}/img/theme1.png" alt="" />
          <img src="${cp}/img/theme2.png" alt="" />
          <img src="${cp}/img/theme3.png" alt="" />
          <img src="${cp}/img/theme4.png" alt="" />
          <img src="${cp}/img/theme5.png" alt="" />
        </div>
      </div>
    </section>
    <!-- REQUEST_PROJECT -->
    <section id="rp">
      <div class="inner">
        <a href="">
          <img
            src="${cp}/img/joinproject.png"
            alt="프로젝트 의뢰(엔터프라이즈)"
          />
        </a>
      </div>
    </section>
    <!-- RANKING -->
    <section id="ranking">
      <div class="inner">
        <h1>TOP 카테고리 전문가 랭킹</h1>
        <h2>STT에서 가장 많이 판매한 인기 전문가 랭킹입니다.</h2>
        <div id="three_ranking">
          <div class="rankings">
            <div class="ranking_title">모바일 앱</div>
            <div class="first_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-01.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">1,457,358,567원</p>
                  <p class="company_name">모비딕마케팅</p>
                </div>
                <img src="${cp}/img/mobidic.png" alt="" class="c_logo" />
              </a>
            </div>
            <div class="second_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-02.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">1,415,034,727원</p>
                  <p class="company_name">GPAKOREA</p>
                </div>
                <img src="./img/gpakorea.png" alt="" class="c_logo" />
              </a>
            </div>
            <div class="third_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-03.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">1,114,816,120원</p>
                  <p class="company_name">DAcompany</p>
                </div>
                <img src="${cp}/img/draw.png" alt="" class="c_logo" />
              </a>
            </div>
            <div class="fourth_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-04.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">527,921,500원</p>
                  <p class="company_name">별</p>
                </div>
                <img src="${cp}/img/star.jpeg" alt="" class="c_logo" />
              </a>
            </div>
            <div class="fifth_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-05.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">451,439,000원</p>
                  <p class="company_name">꿀로고공장장</p>
                </div>
                <img src="${cp}/img/honeylogo.png" alt="" class="c_logo" />
              </a>
            </div>
          </div>
          <div class="rankings">
            <div class="ranking_title">로고·브랜딩</div>
            <div class="first_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-01.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">1,457,358,567원</p>
                  <p class="company_name">모비딕마케팅</p>
                </div>
                <img src="${cp}/img/mobidic.png" alt="" class="c_logo" />
              </a>
            </div>
            <div class="second_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-02.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">1,415,034,727원</p>
                  <p class="company_name">GPAKOREA</p>
                </div>
                <img src="${cp}/img/gpakorea.png" alt="" class="c_logo" />
              </a>
            </div>
            <div class="third_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-03.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">1,114,816,120원</p>
                  <p class="company_name">DAcompany</p>
                </div>
                <img src="${cp}/img/draw.png" alt="" class="c_logo" />
              </a>
            </div>
            <div class="fourth_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-04.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">527,921,500원</p>
                  <p class="company_name">별</p>
                </div>
                <img src="${cp}/img/star.jpeg" alt="" class="c_logo" />
              </a>
            </div>
            <div class="fifth_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-05.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">451,439,000원</p>
                  <p class="company_name">꿀로고공장장</p>
                </div>
                <img src="${cp}/img/honeylogo.png" alt="" class="c_logo" />
              </a>
            </div>
          </div>
          <div class="rankings">
            <div class="ranking_title">웹</div>
            <div class="first_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-01.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">1,457,358,567원</p>
                  <p class="company_name">모비딕마케팅</p>
                </div>
                <img src="${cp}/img/mobidic.png" alt="" class="c_logo" />
              </a>
            </div>
            <div class="second_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-02.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">1,415,034,727원</p>
                  <p class="company_name">GPAKOREA</p>
                </div>
                <img src="${cp}/img/gpakorea.png" alt="" class="c_logo" />
              </a>
            </div>
            <div class="third_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-03.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">1,114,816,120원</p>
                  <p class="company_name">DAcompany</p>
                </div>
                <img src="${cp}/img/draw.png" alt="" class="c_logo" />
              </a>
            </div>
            <div class="fourth_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-04.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">527,921,500원</p>
                  <p class="company_name">별</p>
                </div>
                <img src="${cp}/img/star.jpeg" alt="" class="c_logo" />
              </a>
            </div>
            <div class="fifth_ranking ranks">
              <a href="">
                <img src="${cp}/img/ranking-05.png" alt="" class="rank" />
                <div class="company">
                  <p class="money">451,439,000원</p>
                  <p class="company_name">꿀로고공장장</p>
                </div>
                <img src="${cp}/img/honeylogo.png" alt="" class="c_logo" />
              </a>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- REGISTER_CHEF -->
    <section id="register_chef">
      <div class="inner">
        <a href="">
          <img src="${cp}/img/joinforpro.png" alt="전문가 등록" />
        </a>
      </div>
    </section>
    <!-- FOOTER -->
    <%@ include file="/fix/footer.jsp" %>
  </body>
</html>
