package servlets;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import sn.Session;

@WebServlet("/ProfileServlet")
public class ProfileServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	public ProfileServlet() { super();}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
    		throws ServletException, IOException {
    	doPost(request,response);
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		HttpSession sess=request.getSession(false);  
		Session s = new Session();
		s.getSessionStatus("PROFILE JAVA",sess);
		
	    request.setAttribute("err", "");
	    request.setAttribute("msg", request.getAttribute("msg"));
	    request.getRequestDispatcher("profile.jsp").forward(request, response);   
	    return;
	}
}


// MIGHT DELETE THIS SERVLET LATER