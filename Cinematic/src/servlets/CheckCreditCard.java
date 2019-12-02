package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class CheckCreditCard
 */
@WebServlet("/CheckCreditCard")
public class CheckCreditCard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckCreditCard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int credNum = Integer.parseInt(request.getParameter("credNum"));
		int secNum = Integer.parseInt(request.getParameter("secNumber"));
		String address=request.getParameter("address");
		int month = Integer.parseInt(request.getParameter("month"));
		int year = Integer.parseInt(request.getParameter("year"));
		
		try { 	
			DBConnection db=new DBConnection();		
			Connection con = db.connectDB();
			String sqlSt="SELECT * FROM CreditCards WHERE credNum = ? AND secCode = ? AND address = ? AND month = ? AND year = ?";
			PreparedStatement st = con.prepareStatement(sqlSt); 
			st.setLong(1,credNum);
			st.setLong(2, secNum);
			st.setString(3, address);
			st.setLong(4, month);
			st.setLong(5, year);
			
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				request.setAttribute("err", "");
				request.setAttribute("msg", "Payment completed");
				request.getRequestDispatcher("profile.jsp").forward(request, response);
			}else {
				request.setAttribute("err","Your credit card information is incorrect.");
				request.setAttribute("msg", "");
				request.getRequestDispatcher("pay.jsp").forward(request, response);
			}
			
			
		}catch(Exception e) {e.printStackTrace();}
	}

}
