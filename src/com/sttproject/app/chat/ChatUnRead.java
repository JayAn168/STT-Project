package com.sttproject.app.chat;

import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sttproject.action.Action;
import com.sttproject.action.ActionTo;
import com.sttproject.dao.ChatDAO;

public class ChatUnRead implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String userid = req.getParameter("userid");
		ChatDAO cdao = new ChatDAO();
		if(userid == null || userid.equals("")) {
			resp.getWriter().write("0");
		}else {
			userid = URLDecoder.decode(userid, "UTF-8");
			resp.getWriter().write(cdao.getAllUnreadChat(userid)+"");
		}
		return null;
	}

}
