<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 STT</title>
<!-- 파비콘 -->
<link rel="icon" href="${cp}/img/favicon.ico" />
<!-- 글꼴 -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Mono:wght@100;200;300;400;500;600;700&display=swap"
	rel="stylesheet" />
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-round.css"
	rel="stylesheet" />
<link rel="stylesheet" href="${cp}/css/modifypw.css" />
<link rel="stylesheet" href="${cp}/css/common.css" />
<%--   <script defer src="${cp}/js/modifypw.js"></script> --%>
</head>
<body>
	<div class="container">
		<img src="${cp}/img/logo.png" alt="">
		<div class="header">
			<h2>안녕하세요, STT입니다!</h2>
		</div>
		<div class="center">
			<div class="center_menu">
				<h3 class="check_wan">인증번호 확인</h3>
				<form name="modifyIdForm" action="${cp}/admin/smscheckok.ad"
					method="post" onsubmit="return sendit()">
					<div class="pw">
						<div class="input_wrapper" id="userpw1">
							<input type="text" class="input_login" name="smscheck"
								id="userpw" placeholder="인증번호입력" />
						</div>

					</div>
					<div class="join_button">
						<input type="submit" value="확인" class="join_btn" />
					</div>
			</form>
			</div>
		</div>
	</div>

	<script>
      function All(selectAll) {
        const checkboxes = document.getElementsByName("chk");

        checkboxes.forEach((checkbox) => {
          checkbox.checked = selectAll.checked;
        });
      }
    </script>
</body>
</html>