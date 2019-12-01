package servlets;
import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	public LogoutServlet() {super();}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doPost(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	
        HttpSession session=request.getSession();  
        session.invalidate();  
       
        System.out.println("LOGOUT JAVA\nSESSION INVALIDATED\n");
        
    	request.getRequestDispatcher("IndexServlet").forward(request, response);  
        return;
	}
}