package com.dest.entity;

public class Item 
{
	private int id;
	private String room;
	private String itemName;
	private String serialNo;
	private String sr;
	private String dest;
	private String coma;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(String serialNo) {
		this.serialNo = serialNo;
	}
	
	public String getSr() {
		return sr;
	}
	public void setSr(String sr) {
		this.sr = sr;
	}
	
	public String getDest() {
		return dest;
	}
	public void setDest(String dest) {
		this.dest = dest;
	}
	
	public String getComa() {
		return coma;
	}
	public void setComa(String coma) {
		this.coma = coma;
	}
	@Override
	public String toString() {
		return "Item [id=" + id + ", room=" + room + ", itemName=" + itemName + ", serialNo=" + serialNo + ", sr="
				+ sr + "]";
	}
	
	
	
}
