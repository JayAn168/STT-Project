<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<%@ page errorPage = "/app/error/errorpage.jsp" %>
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
		%>
    <!-- js -->
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<!-- jQuery에 주요 업데이트가 있을 경우 콘솔에 경고 표시, 해결할 수 있는 문제들은 스스로 해결 -->
	<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
    <script src="${cp}/js/bootstrap.js"></script>

<script type="text/javascript">
function chatBoxFunction() {
	var userid = '<%=userid%>';
	console.log(userid);
	$.ajax({
		type: "POST",
		url: '${cp}/chat/getbox.ct',
		data: {
			userid: encodeURIComponent(userid),
		},
		success: function(data) {
			 if(data == "") return;
			 $('#boxTable').html('');
			 console.log(data);
			 var parsed = JSON.parse(data);
			 console.log(parsed);
			 console.log(parsed.result);
			 var result = parsed.result;
			 for(var i = 0; i< result.length; i++) {
				 console.log(result[i][0].value);
				 if(result[i][0].value == userid) {
					 result[i][0].value = result[i][1].value;
				 } else {
					 result[i][1].value = result[i][0].value;
				 }
				 addBox(result[i][0].value, result[i][1].value, result[i][2].value, result[i][3].value);
			 }
		}
	});
}
function addBox(lastID, toID, chatContent, chatTime){//테이블 이동
	$('#boxTable').append('<tr onclick="location.href=\'${cp}/chat/chatting.ct?toID=' + encodeURIComponent(toID) + '\'">' +
			'<td style="width: 150px;"><h5>'+ toID + '</h5></td>' +
			'<td>' +
			'<h5>' + chatContent + '</h5>' +
			'<div class="pull-right">' + chatTime + '</div>' +
			'</td>' +
			'</tr>');
}
	function getInfiniteBox() {
		setInterval(function() {
			chatBoxFunction();
		}, 3000);
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
	<div class="container">
		<table class="table" style="margin: 0 auto;">
			<thead>
				<tr>
					<th><h4>주고받은 메세지 목록</h4></th>
				</tr>
			</thead>
			<div style="overflow-y: auto; width: 100%; max-height: 450px;">
				<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd; margin: 0 auto;">
					<tbody id="boxTable">
					</tbody>
				</table>
			</div>
		</table>
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
</body>
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
			getInfiniteUnread();
			chatBoxFunction();
			getInfiniteBox();
		});
	</script>
</html>