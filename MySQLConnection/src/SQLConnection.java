import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;



public class SQLConnection {
	
	//attributes
	private static SQLConnection sqlConnection = null;
	private static String database = "High_School";
	private static String us = "root";
	private static String pass = "Jockeyb01";
	private static String url = "jdbc:mysql://localhost:3306/"+database;
	private static Connection connection = null;
	
	
	/**
	 * Constructor defined private using the singleton pattern
	 */
	private SQLConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			connection = (Connection)DriverManager.getConnection(url, us , pass);
			System.out.println("Connected");
		}
		catch(SQLException e){
			e.printStackTrace();;
		}
		catch (ClassNotFoundException e){
			e.printStackTrace();
		}		
	}
	
	
	/**
	 * Returns an instance of the SQLConnection class only if there is not one connection running
	 * @return SQLConnection 
	 * @throws SQLException
	 */
	public static SQLConnection getInstance() throws SQLException{
		if(connection == null || connection.isClosed())
			sqlConnection = new SQLConnection();
		else
			System.out.println("Connection to DB "+url+" is already running");
		return sqlConnection;
					
	}
	
	/**
	 * Shows the state of the SQLConnection as Established or Close as appropriate
	 * @return String "Established" if the connection is running and "Close" when is not running
	 * @throws SQLException
	 */
	public String getState() throws SQLException{
		String state="Close";
		if (connection !=null && !connection.isClosed())
			state="Established";
		return state;
	}
	
	/**
	 * Closes the SQL connection, prints on screen the results
	 * @throws SQLException
	 */
	public void closeConnection() throws SQLException{
		if(connection!=null && !connection.isClosed()){
			connection.close();
			System.out.println("Connection has been closed.");
		}
		else
			System.out.println("DB connection was not established");
	}
	
	
	/**
	 * Lists the Schedule assigned for an specific teacher identified with the id in the DB
	 * @param idTeacher The teacher number identifier from the DB
	 */
	public void listTeacherTimeline(int idTeacher){
		String sqlQuery = "select concat(teacher.lastName, ', ', teacher.firstName) as Teacher, "+
				"concat(schedule.day, '   ', schedule.startTime, '   ', schedule.finishTime) as Schedule, "+
				"course.name as Course "+
				"from teacher, schedule, course_has_schedule, course, "+
				"course_has_teacher "+
				"where teacher.idTeacher=course_has_teacher.teacher_idTeacher "+
				"and course_has_teacher.course_idCourse=course.idCourse "+ 
				"and course.idCourse=course_has_schedule.course_idCourse "+
				"and schedule.idSchedule=course_has_schedule.schedule_idschedule "+
				"and teacher.idTeacher="+idTeacher+" "+
				" order by schedule.dayNumber, schedule.startTime;";
		
		try{
			Statement statement= connection.createStatement();
			ResultSet result= statement.executeQuery(sqlQuery);
			
			result.first();
			
			while(result.next()){
				System.out.println("Teacher: "+result.getString("Teacher"));
				System.out.println("Schedule: "+result.getString("Schedule"));
				System.out.println("Course: "+result.getString("Course"));
			}
		}
		catch (SQLException e){
			e.printStackTrace();
		}
	}

}