package com.kupid.manager.group.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kupid.group.model.dto.GroupDto;
import com.kupid.manager.group.service.GroupService;

/**
 * Servlet implementation class GroupUpdateEndServlet
 */
@WebServlet("/manager/groupupdateend.do")
public class GroupUpdateEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GroupUpdateEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		int no=Integer.parseInt(request.getParameter("no"));
		int count=Integer.parseInt(request.getParameter("count"));
		SimpleDateFormat formatter=new SimpleDateFormat("yyyy-mm-dd");
		String company=request.getParameter("company");
		String img=request.getParameter("img");
		
		GroupDto g=GroupDto.builder().groupNo(no).groupName(name).memberCount(count).groupCompany(company).groupImg(img).build();
		int result=new GroupService().updateGroup(g);
		String msg,loc;
		if(result>0) {
			msg="수정성공";
			loc="/manager/grouplist.do";
		}else {
			msg="수정실패";
			loc="/manager/grouplist.do";
		}
		request.setAttribute("msg", msg);
		request.setAttribute("loc", loc);
		
		request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
