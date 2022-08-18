<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<%@ page errorPage = "/app/error/errorpage.jsp" %>
	<%
		String userid = null;
		if(session.getAttribute("loginUser") != null){
			userid = (String)session.getAttribute("loginUser");
		}
		String toid = null;
		if(request.getParameter("toid") != null){
			toid = (String)request.getParameter("toid");
		}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Set The Table | 메시지</title>
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
    <!-- css -->
    <link rel="stylesheet" href="${cp}/css/chat.css" />
    <link rel="stylesheet" href="${cp}/css/bootstrap.css" />
    <!--  -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="${cp}/js/bootstrap.js"></script>
	<script>
		function autoClosingAlert(selector,delay){
			let alert = $(selector).alert();
			alert.show();
			window.setTimeout(function() {alert.hide()},delay);
		}
		function submitFunction(){
			let fromid = '<%= userid %>';
			let toid = '<%= toid %>';
			let chatContent = $('#chatContent').val();
			$.ajax({
				type: "POST",
				url: "${cp}/com/stt/app/msg/chatOkAction",
				data: {
					fromid: encodeURIComponent(fromid),
					toid: encodeURIComponent(toid),
					chatContent: encodeURIComponent(chatContent),
				},
				success: function(result){
					if(result == 1){
						autoClosingAlert('#successMessage',2000);
					}else if(result == 0){
						autoClosingAlert('#dangerMessage',2000);
					}else{
						autoClosingAlert('#warningMessage',2000);
					}
				}
			});
			$('#chatContent').val('');
		}
	</script>
</head>
<body>

	<nav class = "navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" 
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
				<a class="navbar-brand" href="index.jsp">실시간 회원제 채팅 서비스</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="index.jsp">메인</a></li>
			</ul>
			<%
				if(userid == null){
			%>
				<script>
				alert("로그인 후 이용해주세요!");
					location.href = "${cp}";
				</script>
			<% 
				}else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropown-toggle"
						data-toggle="dropdown" role="nutton" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span>
					</a>
				</li>
			</ul>
			<%
				}
			%>
		</div>
	</nav>
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet protlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle text-green"></i>실시간 채팅창</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;">
						</div>
						<div class="portlet-footer">
							<div class="row" style="height:90px;">
								<div class="form-group col-xs-10">
									<textarea style="height:80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요." maxlength="100"></textarea>
								</div>
								<div class="form-group col-xs-2">
									<button type="button" class="btn btn-default pull-right" onclick="submitFunction();">전송</button>
									<div class="clearfix"></div>									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="alert alert-success" id="successMessage" style="display:none;">
		<strong>메시지 전송에 성공했습니다.</strong>
	</div>
	<div class="alert alert-danger" id="dangerMessage" style="display:none;">
		<strong>이름과 내용을 모두 입력해주세요.</strong>
	</div>
	<div class="alert alert-warning" id="warningMessage" style="display:none;">
		<strong>데이터베이스 오류가 발생했습니다.</strong>
	</div>
</body>
</html>