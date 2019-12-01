package db;

import java.sql.*;

public class DBConnection {
	
    public Connection connectDB(String name,String user, String pass) 
        throws SQLException, ClassNotFoundException { 
    	return DriverManager.getConnection("jdbc:mysql://localhost:3306/"+name, user, pass); 
    }
    
    public void close(Connection con,ResultSet rs,PreparedStatement st) throws SQLException {
		rs.close();
        st.close(); 
        con.close(); 
    }
	
}
