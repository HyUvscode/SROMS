/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAOs;

import Models.Event;
import Models.ParticipationEventDetail;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author khuy
 */
public class EventsDAO {

    private Connection conn;

    public EventsDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public List<Event> getAllEventsForStudent() {
        List<Event> eventList = new ArrayList<>();
        try {
            String sql = "SELECT e.EventID, e.EventName, e.HoldTime, e.Location, e.Description, e.EventCategoryID "
                    + "FROM Event e ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Event event = new Event(
                        rs.getInt("EventID"),
                        rs.getString("EventName"),
                        rs.getTimestamp("HoldTime"),
                        rs.getString("Location"),
                        rs.getString("Description"),
                        rs.getInt("EventCategoryID")
                );
                eventList.add(event);
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eventList;
    }

    // Method to get EventCategoryName by EventCategoryID
    public String getEventCategoryName(int eventCategoryID) {
        String categoryName = null;
        try {

            String sql = "SELECT EventCategoryName FROM EventCategory WHERE EventCategoryID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, eventCategoryID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                categoryName = rs.getString("EventCategoryName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoryName;
    }

//    public void updateParticipationEventDetail(int eventID, int studentProfileID, String roleEvent, Boolean isPresent, String report, String result){
//        String sql = "INSERT INTO [SROMS].[dbo].[ParticipationEventDetail] ([eventID], [studentProfileID, [roleEvent], [isPresent], [report], [result]) VALUES (?, ?, ?, ?, ?, ?)";
//        try {
//            PreparedStatement ps = conn.prepareStatement(sql);
//            ps.setInt(1, eventID);
//            ps.setInt(2, studentProfileID);
//            ps.setString(3, roleEvent);
//            ps.setBoolean(4, isPresent);
//            ps.setString(5, report);
//            ps.setString(6, result);
//            ps.executeUpdate();            
//        } catch (Exception e) { 
//        }
//    }
// Method to insert a new ParticipationEventDetail record into the database
//    public boolean insertParticipationEventDetail(ParticipationEventDetail participationEventDetail) {
//        
//        PreparedStatement stmt = null;
//        boolean success = false;
//
//        try {
//            // SQL statement to insert a new record into the ParticipationEventDetail table
//            String sql = "INSERT INTO ParticipationEventDetail (eventID, studentProfileID, roleEvent, isPresent, report, result) "
//                    + "VALUES (?, ?, ?, ?, ?, ?)";
//
//            // Create a PreparedStatement with the SQL
//            stmt = conn.prepareStatement(sql);
//
//            // Set the parameters of the PreparedStatement with the values from the ParticipationEventDetail object
//            stmt.setInt(1, participationEventDetail.getEventID());
//            stmt.setInt(2, participationEventDetail.getStudentProfileID());
//            stmt.setString(3, participationEventDetail.getRoleEvent());
//            stmt.setBoolean(4, participationEventDetail.getIsPresent());
//            stmt.setString(5, participationEventDetail.getReport());
//            stmt.setString(6, participationEventDetail.getResult());
//
//            // Execute the PreparedStatement to perform the insert
//            int rowsInserted = stmt.executeUpdate();
//
//            // Check if the insert was successful
//            if (rowsInserted > 0) {
//                success = true;
//            }
//        } catch (SQLException ex) {
//            // Handle any SQL errors
//            ex.printStackTrace();
//        } finally {
//            // Close the PreparedStatement and Connection objects
//            try {
//                if (stmt != null) {
//                    stmt.close();
//                }
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
//
//        return success;
//    }
    public boolean addStudentToEvent(ParticipationEventDetail participation){
        String sql = "INSERT INTO [SROMS].[dbo].[ParticipationEventDetail] (eventID, studentProfileID, roleEvent, isPresent, report, result) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, participation.getEventID());
            ps.setInt(2, participation.getStudentProfileID());
            ps.setString(3, participation.getRoleEvent());
            ps.setBoolean(4, participation.getIsPresent());
            ps.setString(5, participation.getReport());
            ps.setString(6, participation.getResult());
            int acffectew = ps.executeUpdate();
            return acffectew > 0;
        } catch (SQLException ex) {
//            Logger.getLogger(EventsDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}
