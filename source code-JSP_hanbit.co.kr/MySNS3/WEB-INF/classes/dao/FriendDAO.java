package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.NamingException;

import org.json.simple.parser.ParseException;

import util.ConnectionPool;

public class FriendDAO {

	public String insert(String uid, String frid) throws NamingException, SQLException, ParseException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT id FROM friend WHERE id = ? AND frid = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, frid);
            
            rs = stmt.executeQuery();
            if (rs.next()) return "EX";
            
            stmt.close();
            
            sql = "INSERT INTO friend VALUES(?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, frid);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? "OK" : "ER";
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
	}

	public String remove(String uid, String frid) throws NamingException, SQLException, ParseException {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            String sql = "DELETE FROM friend WHERE id = ? AND frid = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            stmt.setString(2, frid);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? "OK" : "ER";
            
        } finally {
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
	}

	public String getList(String uid) throws NamingException, SQLException, ParseException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT frid FROM friend WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            rs = stmt.executeQuery();

            String str = ""; int cnt = 0;
            while(rs.next()) {
            	if (cnt++ > 0) str += ",";
            	str += "\"" + rs.getString("frid") + "\"";
            }
            if (cnt == 0) return "[]";
            
            rs.close(); stmt.close();
            
            sql = "SELECT jsonstr FROM user WHERE id IN (" + str + ")";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();

            str = "["; cnt = 0;
            while(rs.next()) {
            	if (cnt++ > 0) str += ",";
            	str += rs.getString("jsonstr");
            }
            str += "]";
            
            return str;
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
	}

	/*
	public String getList2(String uid) throws NamingException, SQLException, ParseException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT jsonstr FROM frcache WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            rs = stmt.executeQuery();
            return (!rs.next()) ? "[]" : rs.getString("jsonstr");
            
        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
	}

	private boolean addToCache(String uid, String frid) throws NamingException, SQLException, ParseException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT jsonstr FROM user WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, frid);
            
            rs = stmt.executeQuery();
            if (!rs.next()) return false;
            
            JSONParser parser = new JSONParser();
            JSONObject jsonobj = (JSONObject) parser.parse(rs.getString("jsonstr"));

            rs.close(); stmt.close();

            sql = "SELECT jsonstr FROM frcache WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            rs = stmt.executeQuery();
            if (!rs.next()) {
            	JSONArray jsonarr = new JSONArray();
            	jsonarr.add(jsonobj);
            	
            	stmt.close();
            	
            	sql = "INSERT INTO frcache VALUES(?, ?)";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, uid);
                stmt.setString(2, jsonarr.toJSONString());
            }
            else {
            	JSONArray jsonarr = (JSONArray) parser.parse(rs.getString("jsonstr"));
            	jsonarr.add(jsonobj);

            	sql = "UPDATE frcache SET jsonstr = ? WHERE id = ?";
                stmt = conn.prepareStatement(sql);
                stmt.setString(1, jsonarr.toJSONString());
                stmt.setString(2, uid);
            }
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;

        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
	}

	private boolean removeFromCache(String uid, String frid) throws NamingException, SQLException, ParseException {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT jsonstr FROM frcache WHERE id = ?";
            
            conn = ConnectionPool.get();
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, uid);
            
            rs = stmt.executeQuery();
            if (!rs.next()) return true;
            
        	JSONArray jsonarr = (JSONArray) (new JSONParser()).parse(rs.getString("jsonstr"));
        	for (int i=0; i<jsonarr.size(); i++) {
        		JSONObject jsonobj = (JSONObject) jsonarr.get(i); 
        		String id = jsonobj.get("id").toString();
        		if (frid.equals(id)) {
                	jsonarr.remove(i);
                	break;
        		}
        	}

        	stmt.close();
            
        	sql = "UPDATE frcache SET jsonstr = ? WHERE id = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, jsonarr.toJSONString());
            stmt.setString(2, uid);
            
            int count = stmt.executeUpdate();
            return (count == 1) ? true : false;

        } finally {
            if (rs != null) rs.close(); 
            if (stmt != null) stmt.close(); 
            if (conn != null) conn.close();
        }
	}
	*/
}
