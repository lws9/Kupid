package com.kupid.member.log.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kupid.member.model.dto.MemberDto;
import com.kupid.member.model.service.MemberService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns="/loginEnd.do")
public class LoginEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 전달한 id, password값으로 DB에 동일한 회원이 있는지 확인해주는 기능
		String userId=request.getParameter("userId");
		String password=request.getParameter("password");
		
		String saveId=request.getParameter("saveId");
		Cookie saveIdCookie=new Cookie("saveId",userId);
		if(saveId!=null) {			//
			saveIdCookie.setMaxAge(60*60*24*7);
			saveIdCookie.setPath("/");
//			response.addCookie(saveIdCookie);
		}else {
//			Cookie saveIdCookie=new Cookie("saveId","삭제");
			saveIdCookie.setMaxAge(0);
		}
		response.addCookie(saveIdCookie);
		
		if(userId.equals("")||password.equals("")) {
			request.setAttribute("msg", "아이디나 패스워드를 입력하세요");
			request.setAttribute("loc", "/");
			RequestDispatcher rd=request
					.getRequestDispatcher("/WEB-INF/views/common/msg.jsp");
			rd.forward(request, response);
		}else {
			MemberDto m=new MemberService().selectMemberById(userId,password);
			if(m!=null) {
				//로그인한 정보를 HttpSession에 저장
				HttpSession session=request.getSession();
				session.setAttribute("loginMember", m);
				//화면전환
				response.sendRedirect(request.getContextPath());
			}else {
				request.setAttribute("msg","아이디나 패스워드가 일치하지 않습니다");
				request.setAttribute("loc", "/");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp")
				.forward(request, response);
			}
		
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
