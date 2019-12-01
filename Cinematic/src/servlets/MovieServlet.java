package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.DBConnection;

/**
 * Servlet implementation class MovieServlet
 */
@WebServlet("/MovieServlet")
public class MovieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MovieServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String title =request.getParameter("title");
		ArrayList<Integer> ratings = new ArrayList<Integer>();
		ArrayList<String> showtimes = new ArrayList<String>();
		String synopsis = "";
		String poster = "";
		String trailer = "";
		
		try { 	
			DBConnection db=new DBConnection();		
			Connection con = db.connectDB();
			String sqlSt="SELECT * FROM Movies WHERE title = ?";
			PreparedStatement st = con.prepareStatement(sqlSt); 
			st.setString(1,title);
			ResultSet rs=st.executeQuery();
				if(!rs.next()) { 	// WRONG EMAIL ENTERED. REDIRECT TO LOGIN JSP
					request.setAttribute("err","No matching movies found.");
					request.setAttribute("msg", "");
					request.getRequestDispatcher("login.jsp").forward(request, response); 
					return;
				}else {
					synopsis = rs.getString("synopsis");
					poster = rs.getString("poster");
					trailer = rs.getString("trailer");
					int mid = rs.getInt("mid");
					try { 	
						String sqlSt2="SELECT * FROM Reviews WHERE mid = ?";
						PreparedStatement st2 = con.prepareStatement(sqlSt2); 
						st2.setLong(1,mid);
						ResultSet rs2=st2.executeQuery();
							if(!rs2.next()) {
								request.setAttribute("err","No matching reviews found.");
								request.setAttribute("msg", "");
								request.getRequestDispatcher("login.jsp").forward(request, response); 
							}else {
								while(rs2.next()) {
									ratings.add(rs2.getInt("rating"));
								}
								
							}
						}catch(Exception e) {System.out.println(e);}
					
					try { 	
						String sqlSt3="SELECT * FROM Showtimes WHERE mid = ?";
						PreparedStatement st3 = con.prepareStatement(sqlSt3); 
						st3.setLong(1,mid);
						ResultSet rs3=st3.executeQuery();
							if(!rs3.next()) {
								request.setAttribute("err","No matching showtimes found.");
								request.setAttribute("msg", "");
								request.getRequestDispatcher("login.jsp").forward(request, response); 
								return;
							}else {
								while(rs3.next()) {
									showtimes.add(rs3.getString("time"));
								}
								
							}
						}catch(Exception e) {System.out.println(e);}
				}
			}
			catch(Exception e) {
				System.out.println(e);
			}
		

		request.setAttribute("Showtimes", showtimes );
		request.setAttribute("ratings", ratings);
		request.setAttribute("synopsis", synopsis);
		request.setAttribute("poster", poster );
		request.setAttribute("trailer", trailer);
		RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Movie.jsp");
		requestDispatcher.forward(request,response);
	
	}
			
	}

