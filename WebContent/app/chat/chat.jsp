<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
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
    <link rel="stylesheet" href="${cp}/css/bootstrap.css" />
    <link rel="stylesheet" href="${cp}/css/chat.css" />
	<%
		String userid = null;
		if(session.getAttribute("loginUser") != null){
			userid = (String)session.getAttribute("loginUser");
		}
		String toID = null;
		if(request.getParameter("toID") != null){
			toID = (String)request.getParameter("toID");
		}
	%>
    <!--  -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- jQuery에 주요 업데이트가 있을 경우 콘솔에 경고 표시, 해결할 수 있는 문제들은 스스로 해결 -->
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
    <script src="${cp}/js/bootstrap.js"></script>
	<script type="text/javascript">
		function autoClosingAlert(selector,delay){
			var alert = $(selector).alert();
			alert.show();
			window.setTimeout(function() {alert.hide()},delay);
		}
		function submitFunction(){
			var fromID = '<%= userid %>';
			var toID = '<%= toID %>';
			var chatContent = $('#chatContent').val();
			$.ajax({
				type: "POST",
				url: "${cp}/chat/chatsubmit.ct",
				data: {
					fromID: encodeURIComponent(fromID),
					toID: encodeURIComponent(toID),
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
			$('#chatContent').val("");
		}
		
		function enterkey(){
			if (window.event.keyCode == 13) {
		    	// 엔터키가 눌렸을 때
			var fromID = '<%= userid %>';
			var toID = '<%= toID %>';
			var chatContent = $('#chatContent').val();
			$.ajax({
				type: "POST",
				url: "${cp}/chat/chatsubmit.ct",
				data: {
					fromID: encodeURIComponent(fromID),
					toID: encodeURIComponent(toID),
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
			$('#chatContent').val("");
		    }
		}
		
		var lastID = 0; // 마지막 대화 chatID
		
		
		function chatListFunction(type){
			var fromID = '<%=userid%>';
			var toID = '<%=toID%>';
			$.ajax({
				type: "POST",
				url: "${cp}/chat/chatlist.ct",
				data:{
					fromID: encodeURIComponent(fromID),
					toID: encodeURIComponent(toID),
					listType: type,
				},
				success: function(data){
					if(data == "") return;
					console.log(data);
					var parsed = JSON.parse(data);
					var result = parsed.result;
					for(var i= 0; i < result.length; i++){
						if(result[i][0].value == fromID){
							result[i][0].value = '나';
						}
						addChat(result[i][0].value, result[i][2].value, result[i][3].value);
					}
					lastID = Number(parsed.last);
				}
				
			});
			
		}
		
			function addChat(chatName, chatContent, chatTime){
				let toID = '<%=toID%>';
				if(chatName == '나'){
				$('#chatList').append('<div class="row">' +
						'<div class="col-lg-12">' +
						'<div class="media">' +
						'<div class="media-body">'+
						'<h4 class="media-heading">'+
						'<span class="small pull-left">'+
						chatTime + 
						'</span>' +
						'</h4>'+
						'<span class= "pull-right" style="color:#270949; font-weight:bold;">'+
						chatContent +
						'</span>' +
						'</div>' +
						'</div>' +
						'</div>' +
						'</div>' +
						'<hr>');
				$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
				}else if(chatName == toID){
				$('#chatList').append('<div class="row">' +
						'<div class="col-lg-12">' +
						'<div class="media">' +
						'<a class="pull-left" href="#">' +
						'<img class="media-object img-circle" style="width: 30px; height: 30px;" src= "${cp}/img/logo.png" alt="">' +
						'</a>'+
						'<div class="media-body">'+
						'<h4 class="media-heading">'+
						chatName +
						'<span class="small pull-right">'+
						chatTime + 
						'</span>' +
						'</h4>'+
						'<p style="color:#270949; font-weight:bold;">'+
						chatContent +
						'</p>' +
						'</div>' +
						'</div>' +
						'</div>' +
						'</div>' +
						'<hr>');
				$('#chatList').scrollTop($('#chatList')[0].scrollHeight);
				}
			}
		
		function getInfiniteChat(){
			setInterval(function() {
				chatListFunction(lastID);
			},3000);
		}
		
	</script>
		<script type="text/javascript">
		function getUnread(){
			$.ajax({
				type: "POST",
				url: "${cp}/chat/chatunread.ct",
				data: {
					userid: encodeURIComponent('<%=userid%>'),
				},
				
				success: function(result){
					if(result >= 1){
						showUnread(result);
					}else{
						showUnread('');
					}
				}
			});
		}
		function getInfiniteUnread(){
			setInterval(function(){
				getUnread();
			},4000)
		}
		function showUnread(result){
			$('#unread').html(result);
		}
	</script>
</head>
<body>
<%@ include file="/fix/loginheader.jsp" %>
			<%
				if(userid == null){
			%>
				<script>
				alert("로그인 후 이용해주세요!");
					location.href = "${cp}";
				</script>
			<% 
				}else{
				}
			%>
	<div class="container bootstrap snippet">
		<div class="row">
			<div class="col-xs-12">
				<div class="portlet portlet-default">
					<div class="portlet-heading">
						<div class="portlet-title">
							<h4><i class="fa fa-circle"></i> 실시간 채팅창</h4>
						</div>
						<div class="clearfix"></div>
					</div>
					<div id="chat" class="panel-collapse collapse in">
						<div id="chatList" class="portlet-body chat-widget" style="overflow-y: auto; width: auto; height: 600px;">
						</div>
						<div class="portlet-footer">
							<div class="row" style="height:90px;">
								<div class="form-group col-xs-10">
									<textarea style="height:80px;" id="chatContent" class="form-control" placeholder="메시지를 입력하세요." maxlength="100" onkeydown="enterkey();"></textarea>
								</div>
								<div class="form-group col-xs-2">
									<button type="button" class="btn btn-default pull-right"  onclick="submitFunction();">전송</button>
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
	
	<%
		//서버로부터 내용을 받아왔는지 확인.
	String messageContent = null;
	if (session.getAttribute("messageContent") != null) {
		messageContent = (String)session.getAttribute("messageContent");
	}
	String messageType = null;
	if (session.getAttribute("messageType") != null) {
		messageType = (String) session.getAttribute("messageType");
	}
	if (messageContent != null) {
	%>
	<!-- 모달창 -->
	<div class="modal fade" id="messageModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div
					class="modal-content
					<%if (messageType.equals("오류 메시지"))
						out.println("panel-warning");
					else
						out.println("panel-success");%>">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times</span>
							<!-- bootstrap sr-only: 화면상에 출력하지 않음 -->
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">
							<%=messageType%>
						</h4>
					</div>
					<div class="modal-body">
						<%=messageContent%>
					</div>
					<div class="modal-footer">
						<!-- data-dismiss="modal" 자바스크립트에의해 닫기 역할을 하는 속성 -->
						<button type="button" class="btn btn-primary"
							data-dismiss="modal">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#messageModal').modal("show");
	</script>
	<%
		session.removeAttribute("messageContent");
		session.removeAttribute("messageType");
	}
	%>
	<script type="text/javascript">
		$(document).ready(function() {
			getUnread();
			chatListFunction('0');
			getInfiniteChat();
			getInfiniteUnread()
		});
	</script>
</body>
</html>