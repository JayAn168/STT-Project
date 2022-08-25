<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<%@ page errorPage = "/app/error/errorpage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 STT</title>
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
    <link rel="stylesheet" href="${cp}/css/join2.css" />
    <link rel="stylesheet" href="${cp}/css/common.css" />
</head>
<body>
    <div class="container">
      <div class="header">
        <h2>Set The Table</h2>
      </div>
      <div class="center">
        <div class="center_menu">
          <h1 class="check_wan">이것만 체크하면 가입완료!</h1>
          <form
            name="joinForm"
            action="${cp}/user/userjoinok.us"
            method="post"
            onsubmit="return sendit()"
          >
            <div class="id">
              <div class="input_name">
                <p class="font_16">아이디(이메일)<span class="star">*</span></p>
              </div>
              <div class="input_wrapper">
                <input
                  type="text"
                  class="input_login"
                  id="userid"
                  name="userid"
                  onblur="checkId()"
                  placeholder="아이디를 입력해 주세요. ex)abc@naver.com"
                  />
              </div>
              <span id="result" >&nbsp;</span>
            </div>
            <div class="pw">
              <div class="input_name">
                <p class="font_16">비밀번호<span class="star">*</span></p>
              </div>
              <div class="input_wrapper" id="userpw1">
                <input
                  type="password"
                  class="input_login"
                  name="userpw"
                  id="userpw"
                  placeholder="비밀번호를 입력해 주세요.(8자리 이상)"
                />
              </div>
              <div class="input_wrapper" id="userpw2">
                <input
                  type="password"
                  class="input_login"
                  name="userpw_re"
                  id="userpw_re"
                  placeholder="비밀번호를 확인해주세요."
                  onblur="pwcheck()"
                />
              </div>
            </div>
            <div class="username">
              <div class="input_name">
                <p class="font_16">이름<span class="star">*</span></p>
              </div>
              <div class="input_wrapper">
                <input
                  type="text"
                  class="input_login"
                  name="username"
                  id="username"
                  placeholder="이름을 입력해 주세요."
                />
              </div>
            </div>
            <div class="gender">
              <div class="input_name">
                <p class="font_16">성별<span class="star">*</span></p>
              </div>
              <label>
                <span class="gender_pointer">남자</span
                ><input
                  type="radio"
                  name="usergender"
                  value="M"
                  class="gender_pick"
                />
              </label>
              <label>
                <span class="gender_pointer">여자</span
                ><input
                  type="radio"
                  name="usergender"
                  value="F"
                  class="gender_pick"
                />
              </label>
            </div>
            <div class="userphone">
              <div class="input_name">
                <p class="font_16">핸드폰번호<span class="star">*</span></p>
              </div>
              <div class="input_wrapper">
                <input
                  type="text"
                  class="input_login"
                  name="userphone"
                  maxlength="13"
                  placeholder="핸드폰번호를 입력해 주세요."
                  oninput="autoHyphen(this)"
                />
              </div>
            </div>
            <div class="joincheck">
              <div class="allcheck">
                <input
                  type="checkbox"
                  id="chkall"
                  name="chkall"
                  value="selectall"
                  onclick="All(this)"
                />
                <label for="chkall">
                  <p id="all_check">모두 동의합니다.</p>
                </label>
              </div>
              <div class="check">
                <div class="check_wrapper">
                  <input type="checkbox" id="checkbox2" name="chk" />
                  <label for="checkbox2">
                    <p class="important_check">
                      만 14세 이상입니다.
                      <span class="orange_color">(필수)</span>
                    </p>
                  </label>
                </div>
                <div class="check_wrapper">
                  <input type="checkbox" id="checkbox3" name="chk" />
                  <label for="checkbox3">
                    <p class="important_check">
                      <u>서비스 이용약관</u>에 동의합니다.
                      <span class="orange_color">(필수)</span>
                    </p>
                  </label>
                </div>
                <div class="check_wrapper">
                  <input type="checkbox" id="checkbox4" name="chk" />
                  <label for="checkbox4">
                    <p class="important_check">
                      <u>개인정보 수집/이용</u>에 동의합니다.
                      <span class="orange_color">(필수)</span>
                    </p>
                  </label>
                </div>
                <div class="check_wrapper">
                  <input type="checkbox" id="checkbox5" name="chk" />
                  <label for="checkbox5">
                    <p class="sub_check">
                      이벤트 할인 혜택 알림 수신에 동의합니다. (선택)
                    </p>
                  </label>
                </div>
                <div class="check_wrapper">
                  <input type="checkbox" id="checkbox6" name="chk" />
                  <label for="checkbox6">
                    <p class="sub_check">
                      장기 미접속 시 계정 활성 상태 유지합니다. (선택)
                    </p>
                  </label>
                </div>
              </div>
            </div>
            <div class="join_button">
              <input
                type="submit"
                value="버튼만 누르면 가입완료!"
                class="join_btn"
              />
            </div>
          </form>
        </div>
      </div>
    </div>
    <script>
	const cp = "${cp}";
</script>
    <script>
      function All(selectAll) {
        const checkboxes = document.getElementsByName("chk");

        checkboxes.forEach((checkbox) => {
          checkbox.checked = selectAll.checked;
        });
      }
    </script>
    <script src="${cp}/js/user.js"></script>
</body>
</html>