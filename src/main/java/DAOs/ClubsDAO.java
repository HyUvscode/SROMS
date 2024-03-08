package DAOs;

import Models.Club;
import Models.ClubMember;
import Models.Semester;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ClubsDAO {

    private Connection conn;

    public ClubsDAO() {
        try {
            conn = DB.DBConnection.connect();
        } catch (SQLException ex) {
            Logger.getLogger(ClubsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Retrieve the club with the latest establishment date
     *
     * @return the Club object with the latest establishment date, or null if
     * not found
     */
    public Club getClubByLatestEstablishDate() {
        Club club = null;
        try {
            String sql = "SELECT TOP 1 * FROM Club ORDER BY EstablishDate DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                club = new Club(
                        rs.getInt("ClubID"),
                        rs.getString("ClubName"),
                        rs.getDate("EstablishDate"),
                        rs.getString("Description"),
                        rs.getBoolean("IsApprove"),
                        rs.getBoolean("IsActive"),
                        rs.getInt("ManagerProfileID")
                );
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return club;
    }

    /**
     * Retrieve all clubs
     *
     * @return a list of all Club objects in the database
     */
    public List<Club> getAllClubs() {
        List<Club> clubsList = new ArrayList<>();
        try {
            String sql = "SELECT * FROM Club";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club(
                        rs.getInt("ClubID"),
                        rs.getString("ClubName"),
                        rs.getDate("EstablishDate"),
                        rs.getString("Description"),
                        rs.getBoolean("IsApprove"),
                        rs.getBoolean("IsActive"),
                        rs.getInt("ManagerProfileID")
                );
                clubsList.add(club);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clubsList;
    }

    public List<Club> getClubsForStudent(int userProfileID) {
        List<Club> clubList = new ArrayList<>();
        try {
            String sql = "SELECT c.* "
                    + "FROM Club c "
                    + "JOIN ClubMember cm ON c.clubID = cm.clubID "
                    + "JOIN StudentProfile sp ON cm.studentProfileID = sp.studentProfileID "
                    + "WHERE sp.userProfileID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userProfileID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Club club = new Club(
                        rs.getInt("clubID"),
                        rs.getString("clubName"),
                        rs.getDate("establishDate"),
                        rs.getString("description"),
                        rs.getBoolean("isApprove"),
                        rs.getBoolean("isActive"),
                        rs.getInt("managerProfileID")
                );
                clubList.add(club);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clubList;
    }

    /**
     * Retrieve the semester name based on clubID
     *
     * @param clubID the ID of the club
     * @return the name of the semester associated with the club, or null if not
     * found
     */
    public String getSemesterNameByClubID(int clubID) {
        String semesterName = null;
        try {
            String sql = "SELECT s.semesterName "
                    + "FROM Club c "
                    + "INNER JOIN ClubMember cm ON c.clubID = cm.clubID "
                    + "INNER JOIN Semester s ON cm.semesterID = s.semesterID "
                    + "WHERE c.clubID = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, clubID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                semesterName = rs.getString("semesterName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return semesterName;
    }

    public boolean participateInClub(int userProfileID, int clubID, int semesterID, String clubRole, int clubPoint, String report, boolean status) {
        boolean success = false;
        try {
            String sql = "INSERT INTO ClubMember (studentProfileID, clubID, semesterID, clubRole, clubPoint, report, status) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userProfileID);
            ps.setInt(2, clubID);
            ps.setInt(3, semesterID);
            ps.setString(4, clubRole);
            ps.setInt(5, clubPoint);
            ps.setString(6, report);
            ps.setBoolean(7, status);

            int rowsAffected = ps.executeUpdate();
            if (rowsAffected > 0) {
                success = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ClubsDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return success;
    }
}
