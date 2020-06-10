package com.dest.dao;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.dest.controller.Encrypted;
import com.dest.entity.Item;
import com.dest.util.DbConnectionUtil;


public class ItemDaoImp implements ItemDao 
{
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;

	@Override
	public List<Item> get() {
		
		List<Item> list = null;
		Item item = null;
		
		
		try {
			
			
			list = new ArrayList<Item>();
			String sql = "SELECT * FROM item";
			connection = DbConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			 
			while(resultSet.next()) {
			String room = resultSet.getString("room");
			String itemName = resultSet.getString("itemName");
			String serialNo = resultSet.getString("serialNo");
			String dest = "Dest-";
			String coma = "-";
				item = new Item();
				item.setId(resultSet.getInt("id"));
				item.setRoom(resultSet.getString("room"));
				item.setRoom(Encrypted.decode(room));
				item.setItemName(resultSet.getString("itemName"));
				item.setItemName(Encrypted.decode(itemName));
				item.setSerialNo(resultSet.getString("serialNo"));
				item.setSerialNo(Encrypted.decode(serialNo));
				item.setSerialNo(("Dest-")+(item.getItemName())+("-")+(item.getSerialNo()));
				list.add(item);
				
			}
		}catch(SQLException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return list;
	}

	
	@Override
	public Item get(int id) {
		Item item = null;
		try {
			item = new Item();
			String sql = "SELECT * FROM item where id="+id;
			connection = DbConnectionUtil.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				String room = resultSet.getString("room");
				String itemName = resultSet.getString("itemName");
				String serialNo = resultSet.getString("serialNo");
				item.setId(resultSet.getInt("id"));
				item.setRoom(resultSet.getString("room"));
				item.setRoom(Encrypted.decode(room));
				item.setItemName(resultSet.getString("itemName"));
				item.setItemName(Encrypted.decode(itemName));
				item.setSerialNo(resultSet.getString("serialNo"));
				 item.setSerialNo(Encrypted.decode(serialNo));
			}
		}catch(SQLException | UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return item;
	}

	@Override
	public boolean save(Item e) {
		boolean flag = false;
	
		try {
			
			String sql = "INSERT INTO item(room, itemName, serialNo)VALUES"
					+ "('"+e.getRoom()+"', '"+e.getItemName()+"', '"+e.getSerialNo()+"')";
			connection = DbConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean delete(int id) {
		boolean flag = false;
		try {
			String sql = "DELETE FROM item where id="+id;
			connection = DbConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean update(Item item) {
		boolean flag = false;
		try {
			String sql = "UPDATE item SET room = '"+item.getRoom()+"', "
					+ "itemName = '"+item.getItemName()+"', serialNo = '"+item.getSerialNo()+"' where id="+item.getId();
			connection = DbConnectionUtil.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	

}
