package com.dish.model;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.store.model.StrJDBCDAO;
import com.store.model.StrVO;

public class TestDishJDBCGet implements DishDAO_interface{
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String userid = "easyfood";
	String passwd = "easyfood";
	
	private static final String INSERT = "INSERT INTO DISH(DISH_NO, DISH_NAME, DISH_PRI, DCLA_NO, STR_NO, DISH_STA, DISH_IMG, DISH_NOTE) "
			+ "VALUES('DISH_'||LPAD(DISH_SQ.NEXTVAL, 4, '0'), ?, ?, ?, ?, ?, ?, ?)";
	private static final String UPDATE = "UPDATE DISH SET DISH_NAME = ?, DISH_PRI = ?, DISH_STA = ?, DISH_IMG = ?, DISH_NOTE = ? WHERE DISH_NO = ?";
	private static final String FIND_BY_DISH_NO = "SELECT * FROM DISH WHERE DISH_NO = ?";
	private static final String FIND_BY_DISH_CLASS = "SELECT * FROM DISH WHERE DCLA_NO = ?";
	private static final String FIND_BY_STORE = "SELECT * FROM DISH WHERE STR_NO = ?";
	private static final String FIND_BY_PRICE = "SELECT * FROM DISH WHERE DISH_PRI BETWEEN ? AND ?";
	private static final String FIND_BY_AREA 
										= "SELECT D.DISH_NO, D.DISH_NAME, D.DISH_PRI, D.STR_NO, D.DISH_IMG, D.DISH_NOTE, S.STR_NAME,"
										+ "S.STR_COU, S.STR_CITY, S.STR_ADDR, S.STR_LONG, S.STR_LAT FROM DISH D JOIN"
										+ "(SELECT * FROM STORE WHERE STR_COU||STR_CITY||STR_ADDR LIKE ?) S ON D.STR_NO = S.STR_NO";
	private static final String GET_ALL = "SELECT * FROM DISH";
	private static final String GET_ONE_STR = "SELECT DISTINCT DCLA_NO FROM DISH WHERE STR_NO = ?";

	public static void main(String[] args) throws IOException {
		
		TestDishJDBCGet dao = new TestDishJDBCGet();
		
//		
		List<DishVO> vo = dao.getDishClassForStr("STR_0001"); 
		for (DishVO list : vo){
		System.out.print(list.getDcla_no());		
		}
		
		
		
	}
	
	
//	public static void readPicture(byte[] bytes) throws IOException {
//		
//		FileOutputStream out = null;
//		if(bytes.length != 0) {
//			out = new FileOutputStream("show/"+ dishNo + ".png");
//			out.write(bytes);
//			out.flush();
//		}
//		
//		out.close();
//		
//	}
//	
//	public static void readFile(String str) throws IOException {
//		
//		PrintWriter out = null;
//		if(str.length() != 0) {
//			out = new PrintWriter("show/" + dishName + ".txt");
//			out.write(str);
//			out.flush();
//		}
//		
//		out.close();
//		
//	}


	@Override
	public void insert(DishVO dishVO) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void update(DishVO dishVO) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public DishVO findByDishNo(String dish_no) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<DishVO> findByDishClass(String dcla_no) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<DishVO> findByStore(String str_no) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<DishVO> findByPrice(Double minPrice, Double maxPrice) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<DishVO> findByArea(String area) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<DishVO> getALL() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public List<DishVO> getDishClassForStr(String str_no) {
		Connection con = null;
		PreparedStatement state = null;
		ResultSet rs = null;
		DishVO dishVO = null;
		List<DishVO> list = new ArrayList<DishVO>();
		
		try {
			try {
				Class.forName(driver);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			con = DriverManager.getConnection(url, userid, passwd);
			state = con.prepareStatement(GET_ONE_STR);
			state.setString(1, str_no);
			rs = state.executeQuery();
			
		
			
			
			while(rs.next()) {
				dishVO = new DishVO();
				dishVO.setDcla_no(rs.getString("DCLA_NO"));
				
				list.add(dishVO);
				
			}
		} catch (SQLException se) {
			throw new RuntimeException("Database error occured. " + se.getMessage());
		} finally {
			try {
				if(con != null) {
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
		
		return list;
	}


	@Override
	public DishVO findByDishNo_Str_no(String dish_no) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public DishVO findByDishNo_ForName(String dish_no) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
