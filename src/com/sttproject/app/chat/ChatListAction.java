package com.sttproject.app.chat;

import java.net.URLDecoder;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sttproject.action.Action;
import com.sttproject.action.ActionTo;
import com.sttproject.dao.ChatDAO;
import com.sttproject.dto.ChatDTO;

public class ChatListAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String fromID = req.getParameter("fromID");
		String toID = req.getParameter("toID");
		String listType = req.getParameter("listType");
		if(fromID == null || fromID.equals("") || toID == null || toID.equals("") || 
				listType == null || listType.equals("")) {
			resp.getWriter().write(""); // 오류 발생시 공백 문자열을 반환
		}
		else if (listType.equals("ten")) resp.getWriter().write(getTen(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID,"UTF-8")));
		// ten 함수 실행시 다음과 같은 데이터가 불러져 올 수 있도록
		else {
			try {
				resp.getWriter().write(getID(URLDecoder.decode(fromID, "UTF-8"), URLDecoder.decode(toID, "UTF-8"),URLDecoder.decode(listType,"UTF-8")));
				// 특정한 채팅ID값을 기준으로 대화를 가져오는것
			} catch (Exception e) {
				resp.getWriter().write("");
			}
		}
		return null;
	}
	
	public String getTen(String fromID, String toID) throws SQLException {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO cdao = new ChatDAO();

		ArrayList<ChatDTO> chatList = (ArrayList<ChatDTO>)cdao.getChatListByRecent(fromID, toID, 100);
		if (chatList.size() == 0) {
			return "";
		}
		for (int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\" : \"" + chatList.get(i).getFromID() + "\"},");
			result.append("{\"value\" : \"" + chatList.get(i).getToID() + "\"},");
			result.append("{\"value\" : \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\" : \"" + chatList.get(i).getChatTime() + "\"}]");
			if (i != chatList.size() - 1) result.append(",");
				// {\"result\":[ [{\"value\": \"값\"},{\"value\" :\"값\"}], [{\"value\":
				// \"값\"},{\"value\" :\"값\"}]
			
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatID() + "\"}");
		cdao.readChat(fromID, toID);
		return result.toString();

	}
	
	public String getID(String fromID, String toID, String chatID) throws SQLException {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO cdao = new ChatDAO();
		
		ArrayList<ChatDTO> chatList = (ArrayList<ChatDTO>) cdao.getChatListByID(fromID, toID, chatID);
		if (chatList.size() == 0) {
			return "";
		}
		for (int i = 0; i < chatList.size(); i++) {
			result.append("[{\"value\" : \"" + chatList.get(i).getFromID() + "\"},");
			result.append("{\"value\" : \"" + chatList.get(i).getToID() + "\"},");
			result.append("{\"value\" : \"" + chatList.get(i).getChatContent() + "\"},");
			result.append("{\"value\" : \"" + chatList.get(i).getChatTime() + "\"}]");
			if (i != chatList.size() - 1) result.append(",");
				// {\"result\":[ [{\"value\": \"값\"},{\"value\" :\"값\"}], [{\"value\":
				// \"값\"},{\"value\" :\"값\"}]
		
		}
		result.append("], \"last\":\"" + chatList.get(chatList.size() - 1).getChatID() + "\"}");
		cdao.readChat(fromID, toID);
		return result.toString();
		
	}

}
