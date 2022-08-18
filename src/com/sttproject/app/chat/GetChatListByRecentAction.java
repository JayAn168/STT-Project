package com.sttproject.app.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sttproject.action.Action;
import com.sttproject.action.ActionTo;
import com.sttproject.dao.ChatDAO;
import com.sttproject.dto.ChatDTO;

public class GetChatListByRecentAction implements Action{
	
		@Override
		public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			ChatDAO cdao = new ChatDAO();
			String fromID = req.getParameter("fromID");
			String toID = req.getParameter("toID");
			int number = Integer.parseInt(req.getParameter("number"));
			
			List<ChatDTO> chatList = cdao.getChatListByRecent(fromID, toID, number); 
			ActionTo transfer = new ActionTo();
			transfer.setRedirect(false);
			transfer.setPath("/app/msg/chat.jsp");
//			int chatTime = Integer.parseInt(rs.getString("chatTime").substring(11,13));
//			String timeType = "오전";
//			if(chatTime >= 12) {
//				timetype="오후"
//				chatTime -= 12;
//			}
//			chat.setChatTime(rs.getString("chatTime").substring(0,11)+" " + timeType + " " + chatTime + ":" + 
//			rs.getString("chatTime").substring(14,16) + "");
		
			return transfer;
		}

}
