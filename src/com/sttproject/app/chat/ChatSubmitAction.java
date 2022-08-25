package com.sttproject.app.chat;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sttproject.action.Action;
import com.sttproject.action.ActionTo;
import com.sttproject.dao.ChatDAO;

public class ChatSubmitAction implements Action {

	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=UTF-8");

		String fromID = req.getParameter("fromID");
		String toID = req.getParameter("toID");
		String chatContent = req.getParameter("chatContent");
		ChatDAO cdao = new ChatDAO();
		if(fromID == null || fromID.equals("") || toID == null || toID.equals("")
				|| chatContent == null || chatContent.equals("")) {
			resp.getWriter().write("0");	
			} else {
				fromID = URLDecoder.decode(fromID, "UTF-8");
				toID = URLDecoder.decode(toID, "UTF-8");
				chatContent = URLDecoder.decode(chatContent, "UTF-8");
				resp.getWriter().write(cdao.submit(fromID, toID, chatContent) + "");	
			}
		return null;
	}
}
