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

public class GetChatBoxAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userid = (String)req.getSession().getAttribute("loginUser");
		
		ChatDAO cdao = new ChatDAO();
		
		if(userid == null || userid.equals("")) {
			resp.getWriter().write("");
		}else {
			try {
				userid = URLDecoder.decode(userid, "UTF-8");
				resp.getWriter().write(getBox(userid));
			} catch (Exception e) {
				resp.getWriter().write("");
			}
		}
		return null;
	}
	
	public String getBox(String userid) {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		ChatDAO cdao = new ChatDAO();
	
			try {
				ArrayList<ChatDTO> chatList = (ArrayList<ChatDTO>) cdao.getBox(userid);
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
			return result.toString();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return "-1";
	}
	
	
	
	
	
}
