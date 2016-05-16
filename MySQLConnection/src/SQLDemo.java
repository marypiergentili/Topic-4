import java.sql.SQLException;

public class SQLDemo {
	
	public static void main(String[] args) throws SQLException{
		
		//creating the DB connection
		SQLConnection sql= SQLConnection.getInstance();
		//Check the state
		System.out.println(sql.getState());
		//List schedule for teacher number 2
		sql.listTeacherTimeline(2);
		//Closing the connection
		sql.closeConnection();
		//Check the state of the connection again
		System.out.println(sql.getState());
		
		//creating a new connection
		SQLConnection sql2= SQLConnection.getInstance();
		//checking if the singleton pattern works by trying to establish a new connection while other is opened
		SQLConnection sql3= SQLConnection.getInstance();
		//Closing the connection established earlier
		sql2.closeConnection();
	}

}
