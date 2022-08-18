package com.sttproject.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sttproject.action.ActionTo;

public class AdminFrontController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		doProcess(req, resp);
	}

	private void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 길나누는 코드
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length());
		ActionTo transfer = null;

		switch (command) {

		case "/admin/findidok.ad":
			try {
				transfer = new SmsSendOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case "/admin/smscheckok.ad":
			try {
				new SmsCheckOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;

		case "/admin/findpwok.ad":
			try {
				new MailSendOkAction().execute(req, resp);
			} catch (Exception e) {
				System.out.println("/admin/findpwok.ad" + e);
			}
			break;

		}
		if (transfer != null) {
			if (transfer.isRedirect()) {
				resp.sendRedirect(transfer.getPath());
			} else {
				req.getRequestDispatcher(transfer.getPath()).forward(req, resp);
			}
		}

	}
}
