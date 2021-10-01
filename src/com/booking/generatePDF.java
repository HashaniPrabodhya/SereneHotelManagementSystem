package com.booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
//import com.lowagie.text.Image;
import com.itextpdf.text.Image;

@WebServlet("/generatePDF")
public class generatePDF extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public generatePDF() {
        super();
      
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException
    {

    	
		Document document=new Document();
		PdfContentByte over;
        Rectangle pagesize;
        float x, y;
			try {
				PdfWriter.getInstance(document, new FileOutputStream("D://sereneHotel//bookings.pdf"));
				
			} catch (FileNotFoundException | DocumentException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			document.open();
			/*
			 * Image img=Image.getInstance("Images/imgLogo.jpg");
			 * img.setAlignment(Image.MIDDLE); document.add(img);
			 */
			try {
			 Image image = Image.getInstance ("D://eclipsee//SereneHotel//WebContent//Images//imgLogo.jpg");
			
				image.setAlignment(Element.ALIGN_CENTER);

				float imageWidth = image.getWidth();

				if (imageWidth > document.getPageSize().getWidth()) {
					int indentation = 0;
					float scaler = ((document.getPageSize().getWidth() - document.leftMargin() - document.rightMargin()
							- indentation) / image.getWidth()) * 100;
					image.scalePercent(scaler);
					image.scaleAbsolute(200f, 200f);
				}
				document.add(image);
				/*
				 * // get page size and position
				 * 
				 * x = (pagesize.getLeft() + pagesize.getRight()) / 2; y = (pagesize.getTop() +
				 * pagesize.getBottom()) / 2; over = stamper.getOverContent(i);
				 * over.saveState();
				 * 
				 * // set transparency PdfGState state = new PdfGState();
				 * state.setFillOpacity(0.2f); over.setGState(state);
				 * 
				 * // add watermark text and image if (i % 2 == 1) {
				 * ColumnText.showTextAligned(over, Element.ALIGN_CENTER, p, x, y, 0); } else {
				 * over.addImage(img, w, 0, 0, h, x - (w / 2), y - (h / 2)); }
				 */

			}
				 catch (DocumentException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
			}
			 Font FONT = new Font(Font.FontFamily.HELVETICA, 34, Font.BOLD, new GrayColor(0.5f));
			Paragraph p=new Paragraph("Booking Details",FONT);
			//p.add();
			p.setAlignment(Element.ALIGN_CENTER);
			
			try {
				document.add(p);
				//document.add(new Paragraph("Booking Details",FONT));
			} catch (DocumentException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			try {
				document.add(Chunk.NEWLINE);
			} catch (DocumentException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			/*
			 * try { document.add(Chunk.NEWLINE); } catch (DocumentException e1) { // TODO
			 * Auto-generated catch block e1.printStackTrace(); }
			 */
			
			PdfPTable table=new PdfPTable(new float[] {35, 40,50,35,35,35,40});
			//PdfPTable table=new PdfPTable(8);
			
			table.setHorizontalAlignment(Element.ALIGN_CENTER);
			
			
			table.addCell("Booking Id");
			table.addCell("Customer Name");
			table.addCell("Accomodation Type");
			table.addCell("From");
			table.addCell("To");
			//table.addCell("Number of Nights");
			//table.addCell("Number of Adults");
			//table.addCell("Number of Children");
			table.addCell("Contact");
			table.addCell("Username");
			table.setHeaderRows(1);
			
			PdfPCell[] cells=table.getRow(0).getCells();
			
			
			for(int j=0;j<cells.length;j++) {
				cells[j].setBackgroundColor(BaseColor.GRAY);
			}
			
			
			String url = "jdbc:mysql://localhost:3306/hotel?autoReconnect=true&useSSL=false";
			String user = "root";
			String password = "root123";
			
			 boolean isSuccess;
			 Connection con=null;
			 Statement stmt=null;
			 ResultSet rs=null;
			
			try {
				
				con=DBConnect.getConnection();
				stmt=con.createStatement();
				String sql="select * from booking ";
				rs=stmt.executeQuery(sql);
				
				while(rs.next()) {
					table.addCell(String.valueOf(rs.getInt(1)));
					table.addCell(rs.getString(2));
					table.addCell(rs.getString(3));
					table.addCell(rs.getString(4));
					table.addCell(rs.getString(5));
					//table.addCell(rs.getString(6));
					//table.addCell(rs.getString(7));
					//table.addCell(rs.getString(8));
					table.addCell(rs.getString(9));
					table.addCell(rs.getString(10));
				}
				document.add(table);
				document.close();
				System.out.println("Done");
				con.close();
			
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    
}
}

    


    
/*
 * protected void processRequest(HttpServletRequest request,HttpServletResponse
 * response)throws ServletException,IOException, SQLException,
 * DocumentException{
 * 
 * String userName=request.getParameter("userName");
 * 
 * Document document=new Document();
 * 
 * PdfWriter.getInstance(document, new
 * FileOutputStream("D://sereneHotel//bookings.pdf")); document.open();
 * Paragraph p=new Paragraph(); p.add("Booking Details");
 * p.setAlignment(Element.ALIGN_CENTER); document.add(p);
 * 
 * document.add(Chunk.NEWLINE); document.add(Chunk.NEWLINE);
 * 
 * PdfPTable table=new PdfPTable(new float[] {5, 15,15,15,15,15,15,15});
 * 
 * table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
 * 
 * table.addCell("BookingId"); table.addCell("Customer Name");
 * table.addCell("Accomodation Type"); table.addCell("From");
 * table.addCell("To"); table.addCell("Number of Nights");
 * table.addCell("Number of Adults"); table.addCell("Number of Children");
 * table.addCell("Contact"); table.addCell("Username"); table.setHeaderRows(1);
 * 
 * PdfPCell[] cells=table.getRow(0).getCells();
 * 
 * 
 * for(int j=0;j<cells.length;j++) {
 * cells[j].setBackgroundColor(BaseColor.GRAY); }
 * 
 * 
 * String url =
 * "jdbc:mysql://localhost:3306/hotel?autoReconnect=true&useSSL=false"; String
 * user = "root"; String password = "root123";
 * 
 * boolean isSuccess; Connection con=null; Statement stmt=null; ResultSet
 * rs=null;
 * 
 * try {
 * 
 * con=DBConnect.getConnection(); stmt=con.createStatement(); String
 * sql="select * from booking where userName='"+userName+"'";
 * rs=stmt.executeQuery(sql);
 * 
 * while(rs.next()) { table.addCell(String.valueOf(rs.getInt(1)));
 * table.addCell(rs.getString(2)); table.addCell(rs.getString(3));
 * table.addCell(rs.getString(4)); table.addCell(rs.getString(5));
 * table.addCell(rs.getString(6)); table.addCell(rs.getString(7));
 * table.addCell(rs.getString(8)); table.addCell(rs.getString(9)); }
 * document.add(table); document.close(); System.out.println("Done");
 * con.close();
 * 
 * } catch (DocumentException e) { // TODO Auto-generated catch block
 * e.printStackTrace();
 * 
 * //RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
 * //rd.forward(request, response); }
 * 
 * } }
 */
	//protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	
	/*	doGet(request, response);
		
		String userName=request.getParameter("userName");
		
		Document document=new Document();
		
			PdfWriter.getInstance(document, new FileOutputStream("D://sereneHotel//bookings.pdf"));
			document.open();
			Paragraph p=new Paragraph();
			p.add("Booking Details");
			p.setAlignment(Element.ALIGN_CENTER);
			document.add(p);
			
			document.add(Chunk.NEWLINE);
			document.add(Chunk.NEWLINE);
			
			PdfPTable table=new PdfPTable(new float[] {5, 15,15,15,15,15,15,15});
			
			table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
			
			table.addCell("BookingId");
			table.addCell("Customer Name");
			table.addCell("Accomodation Type");
			table.addCell("From");
			table.addCell("To");
			table.addCell("Number of Nights");
			table.addCell("Number of Adults");
			table.addCell("Number of Children");
			table.addCell("Contact");
			table.addCell("Username");
			table.setHeaderRows(1);
			
			PdfPCell[] cells=table.getRow(0).getCells();
			
			
			for(int j=0;j<cells.length;j++) {
				cells[j].setBackgroundColor(BaseColor.GRAY);
			}
			
			
			String url = "jdbc:mysql://localhost:3306/hotel?autoReconnect=true&useSSL=false";
			String user = "root";
			String password = "root123";
			
			 boolean isSuccess;
			 Connection con=null;
			 Statement stmt=null;
			 ResultSet rs=null;
			
			try {
				
				con=DBConnect.getConnection();
				stmt=con.createStatement();
				String sql="select * from booking where userName='"+userName+"'";
				rs=stmt.executeQuery(sql);
				
				while(rs.next()) {
					table.addCell(String.valueOf(rs.getInt(1)));
					table.addCell(rs.getString(2));
					table.addCell(rs.getString(3));
					table.addCell(rs.getString(4));
					table.addCell(rs.getString(5));
					table.addCell(rs.getString(6));
					table.addCell(rs.getString(7));
					table.addCell(rs.getString(8));
					table.addCell(rs.getString(9));
				}
				document.add(table);
				document.close();
				System.out.println("Done");
				con.close();
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		
			//RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
			//rd.forward(request, response);
		}*/
	
		
	
		
	



