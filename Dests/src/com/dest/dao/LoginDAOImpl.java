package com.dest.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.dest.entity.Login;
import com.dest.util.DbConnectionUtil;


public class LoginDAOImpl implements LoginDAO {

	@Override
	public String loginCheck(Login loginBean) {
		String query="select * from admin where email=? and password=?";
		
		try{
			Connection con=DbConnectionUtil.openConnection();
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,loginBean.getEmail());
			ps.setString(2,loginBean.getPassword());
			ResultSet rs=ps.executeQuery();
			
			if(rs.next()){
				return "true";
			}
			else{
				return "false";
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return "error";
	}

}
