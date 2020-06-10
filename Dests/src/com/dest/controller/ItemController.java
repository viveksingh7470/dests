package com.dest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dest.dao.ItemDao;
import com.dest.dao.ItemDaoImp;
import com.dest.entity.Item;

public class ItemController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	RequestDispatcher dispatcher = null;
	ItemDao itemDao = null;
	
	public ItemController() {
		itemDao = new ItemDaoImp();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		
		if(action == null) {
			action = "LIST";
		}
		
		switch(action) {
			
			case "LIST":
				listItem(request, response);
				
				break;
				
			case "EDIT":
				getSingleItem(request, response);
				break;
				
			case "DELETE":
				deleteItem(request, response);
				break;
				
			default:
				listItem(request, response);
				break;
				
		}
		
	}

	private void deleteItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
	
		if(itemDao.delete(Integer.parseInt(id))) {
			request.setAttribute("NOTIFICATION", "Item Deleted Successfully!");
		}
		
		listItem(request, response);
	}

	private void getSingleItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String id = request.getParameter("id");
		Item theEmployee = itemDao.get(Integer.parseInt(id));
		request.setAttribute("item", theEmployee);
		dispatcher = request.getRequestDispatcher("/views/item-form.jsp");
		dispatcher.forward(request, response);
	}

	private void listItem(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Item> theList = itemDao.get();
		request.setAttribute("list", theList);	
		
		dispatcher = request.getRequestDispatcher("/views/itemlist.jsp");
		
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String room =request.getParameter("room");
		String itemName =request.getParameter("itemName");
		String serialNo =request.getParameter("serialNo");
		String id = request.getParameter("id");
		String dest = "Dest-";
		String coma = "-";
		
		Item e = new Item();
		
		
		e.setRoom(request.getParameter("room"));
		 e.setRoom(Encrypted.encode(room));
		e.setItemName(request.getParameter("itemName"));
		 e.setItemName(Encrypted.encode(itemName));
		 e.setDest(request.getParameter("dest"));
		 e.setDest(Encrypted.encode(dest));
		 e.setComa(request.getParameter("coma"));
		 e.setComa(Encrypted.encode(coma));
		 e.setSerialNo(request.getParameter("serialNo"));
		 e.setSerialNo(Encrypted.encode(serialNo));
		e.setDest((e.getDest())+(e.getItemName())+(e.getComa())+(e.getSerialNo()));
		PrintWriter out = response.getWriter();
		if(id.isEmpty() || id == null) {
			
			if(itemDao.save(e)) {
		
				out.println("<script type=\"text/javascript\" src=\"https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>");
				out.println("<script src=\"https://unpkg.com/sweetalert/dist/sweetalert.min.js\"></script>");
				out.println("<script>");
				out.println("swal('Successfull', '', \"success\");");
				
				request.getAttribute("swal('NOTIFICATION', 'Item Saved Successfully!','success'");
				out.println("</script>");
			}
			
		
		}else {
			
			e.setId(Integer.parseInt(id));
			if(itemDao.update(e)) {
				request.setAttribute("NOTIFICATION", "Item Updated Successfully!");
			}
			
		}
		
		listItem(request, response);
	}

}
