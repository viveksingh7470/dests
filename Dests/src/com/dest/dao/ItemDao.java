package com.dest.dao;

import java.io.UnsupportedEncodingException;
import java.util.List;

import com.dest.entity.Item;

public interface ItemDao 
{
List<Item> get() throws UnsupportedEncodingException;
	
	Item get(int id);
	
	boolean save(Item item);
	
	boolean delete(int id);
	
	boolean update(Item item);
}
