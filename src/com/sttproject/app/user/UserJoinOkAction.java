package com.sttproject.app.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sttproject.action.Action;
import com.sttproject.action.ActionTo;
import com.sttproject.dao.UserDAO;
import com.sttproject.dto.UserDTO;

public class UserJoinOkAction implements Action{
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		UserDTO user = new UserDTO();
		
		String userid = req.getParameter("userid");
		user.setUserid(userid);
		user.setUserpw(req.getParameter("userpw"));
		user.setUsername(req.getParameter("username"));
		user.setUsergender(req.getParameter("usergender"));
		user.setUserphone(req.getParameter("userphone"));
		System.out.println(user.getUsergender());
		UserDAO udao = new UserDAO();
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(true);
		
		if(udao.userjoin(user)) {
			transfer.setPath(req.getContextPath()+"/user/userlogin.us?userid="+userid);
			
			
		} else {
			transfer.setPath(req.getContextPath());
		}
		
		
		
		
		return transfer;
	}
}
