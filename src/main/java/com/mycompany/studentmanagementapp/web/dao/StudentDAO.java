package com.mycompany.studentmanagementapp.web.dao;

import com.mycompany.studentmanagementapp.web.entities.Student;
import com.mycompany.studentmanagementapp.web.helper.CP;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    public static boolean insertStudentToDB(Student student) {
        boolean status = false;
        try {
            Connection con = CP.getConnection();
            DatabaseMetaData meta = con.getMetaData();

            ResultSet set = meta.getTables(null, null, "student", null);

            if (set.next()) {
                //Table Exists..

                //Now insert....
                String insertQuery = "INSERT INTO Student(sname,sNumber,sCity) values(?,?,?)";
                PreparedStatement preparedstatement = con.prepareStatement(insertQuery);

                preparedstatement.setString(1, student.getName());
                preparedstatement.setString(2, student.getNumber());

                preparedstatement.setString(3, student.getCity());

                preparedstatement.executeUpdate();
            } else {
                //creating the table....
                String createTable = "create table student(sid int,sName varchar(200),sNumber varchar(20),sCity varchar(100),primary key(sid)";
                Statement statement = con.prepareStatement(createTable);
                statement.executeUpdate(createTable);

                //Now insert....
                String insertQuery = "INSERT INTO Student(sname,sNumber,sCity) values(?,?,?)";
                PreparedStatement preparedstatement = con.prepareStatement(insertQuery);

                preparedstatement.setString(1, student.getName());
                preparedstatement.setString(2, student.getNumber());

                preparedstatement.setString(3, student.getCity());

                preparedstatement.executeUpdate();

            }
            status = true;
        } catch (Exception e) {
            e.printStackTrace();
            return status;
        }
        return status;
    }

    public static boolean updateStudent(int sid, int option, String val) {
        boolean status = false;
        try {
            Connection con = CP.getConnection();
            if (option == 1) {
                //Update Name........
                String query = "Update Student set sname = ? where sid = ?";
                PreparedStatement preparedstatement = con.prepareStatement(query);
                preparedstatement.setString(1, val);
                preparedstatement.setInt(2, sid);

                preparedstatement.executeUpdate();
            } else if (option == 2) {
                //Update Phone number.....
                String query = "Update Student set sNumber = ? where sid = ?";
                PreparedStatement preparedstatement = con.prepareStatement(query);
                preparedstatement.setString(1, val);
                preparedstatement.setInt(2, sid);
                preparedstatement.executeUpdate();
            } else {
                //Update City
                String query = "Update Student set sCity = ? where sid = ?";
                PreparedStatement preparedstatement = con.prepareStatement(query);
                preparedstatement.setString(1, val);
                preparedstatement.setInt(2, sid);
                preparedstatement.executeUpdate();
            }
            status = true;

        } catch (Exception e) {
            e.printStackTrace();
            return status;
        }
        return status;
    }
    
    
    
    public static boolean updateStudentWeb(Student s)
    {
        boolean f= false;
        try{
            
            Connection con = CP.getConnection();
            String query="UPDATE STUDENT SET SNAME=?,SNUMBER=?,SCITY=? WHERE SID=?";
            PreparedStatement pstmt=con.prepareStatement(query);
            pstmt.setString(1, s.getName());
            pstmt.setString(2, s.getNumber());
            pstmt.setString(3, s.getCity());
            pstmt.setInt(4, s.getId());
            
            pstmt.executeUpdate();
            f=true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    

    public static boolean deleteStudent(int sid) {
        boolean status = false;
        try {
            Connection con = CP.getConnection();

            //Now insert....
            String query = "DELETE from student where sid = ?";
            PreparedStatement preparedstatement = con.prepareStatement(query);

            preparedstatement.setInt(1, sid);

            preparedstatement.executeUpdate();
            status = true;

        } catch (Exception e) {
            e.printStackTrace();
            return status;
        }
        return status;
    }

    public static List<Student> displayStudent() {

        List<Student> students = new ArrayList<>();
        Student s = null;

        boolean status = false;
        try {
            Connection con = CP.getConnection();
            String query = "Select * from student";

            Statement statement = con.createStatement();
            ResultSet set = statement.executeQuery(query);

            while (set.next()) {

                s = new Student(set.getInt(1), set.getString(2), set.getString(3), set.getString(4));
                students.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();

        }

        return students;
    }

    public static Student getStudentById(int id) {
        Student s = null;
        try {

            String sql = "SELECT * FROM STUDENT WHERE sid = ?";
            Connection con = CP.getConnection();
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {

                s = new Student(set.getInt(1), set.getString(2), set.getString(3), set.getString(4));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

}
