package com.sttproject.app.chat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sttproject.action.ActionTo;

public class ChatFrontController extends HttpServlet{

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=UTF-8");
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//길나누는 코드
		String requestURI = req.getRequestURI(); // ??????/user/userjoin.us
		String contextPath = req.getContextPath(); // ??????(module명)
		String command = requestURI.substring(contextPath.length()); // /user/userjoin.us
		System.out.println(command); 
		ActionTo transfer = null;
		
		switch(command) {
		case "/chat/chat.ct":
			transfer = new ActionTo();
			transfer.setPath("/app/chat/box.jsp");
			transfer.setRedirect(false);
			break;
			
		case "/chat/chatting.ct":
			transfer = new ActionTo();
			transfer.setPath("/app/chat/chat.jsp");
			transfer.setRedirect(false);
			break;
			
		case "/chat/chatsubmit.ct":
			try {
				new ChatSubmitAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/chat/chatsubmit.ct : "+e);
			}
			break;
			
		case "/chat/chatlist.ct":
			try {
				new ChatListAction().execute(req,resp);
				
			} catch(Exception e) {
				System.out.println("/chat/chatlist.ct : " + e);
			}
			break;
			
		case "/chat/chatunread.ct":
			try {
				new ChatUnRead().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/chat/chatunread.ct : " + e);
			}
			break;
			
		case "/chat/getbox.ct":
			try {
				new GetChatBoxAction().execute(req,resp);
			} catch (Exception e) {
				System.out.println("/chat/chatunread.ct : " + e);
			}
			break;
		}
		
		//전송 일괄처리(어디인지, 어떤 방식인지는 몰라도 그냥 transfer라는 객체에 담겨있는 정보를 해석해서 그대로 페이지를 이동시키는 코드)
		if(transfer != null) {
			if(transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			}
			else {
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}
	}
}














