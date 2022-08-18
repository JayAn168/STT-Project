package com.sttproject.admin;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sttproject.action.Action;
import com.sttproject.action.ActionTo;

public class SmsCheckOkAction implements Action {
	@Override
	public ActionTo execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		resp.setCharacterEncoding("utf-8");
		//MIME 타입
		resp.setContentType("text/html; charset=utf-8");
		
		String smscheck = req.getParameter("smscheck");
		String result = (String) req.getSession().getAttribute("result");
		
		ActionTo transfer = new ActionTo();
		transfer.setRedirect(false);
		
		

		PrintWriter out = resp.getWriter();
		
		
		
		  if(result.equals(smscheck)) { System.out.println("인증성공");
		  
		  out.write("<script>"); out.write("alert('인증되었습니다.');");
		  out.write("location.href = '"+req.getContextPath()+"/app/user/findview2.jsp';");
		  out.write("</script>");
		  } else {
		  
		  System.out.println("인증실패");
		  out.write("<script>");
		  out.write("alert('인증실패. \\n 입력하신 문자가 일치하지 않습니다. 다시 시도해 주십시오.');");
		  out.write("location.href = '"+req.getContextPath()+"/app/user/findinfo.jsp';");
		  out.write("</script>");
		  
		  }
		 
		
		
		return null;
	}
}
