package com.tools;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.Reader;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

import com.adm.model.AdmService;
import com.adm.model.AdmVO;
import com.admp.model.AdmpService;
import com.admp.model.AdmpVO;
import com.fea.model.FeaService;
import com.fea.model.FeaVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.store.model.TestStrJDBCGetOne;

import oracle.sql.BLOB;
import oracle.sql.CLOB;

public class tools {

	// Clob頧tring
	public static String clobToString(Clob sc) throws SQLException, IOException {
		if (sc == null) {
			return "null";
		} else {
			String reString = "";
			Reader is = sc.getCharacterStream();
			BufferedReader br = new BufferedReader(is);
			String s = br.readLine();
			StringBuffer sb = new StringBuffer();
			while (s != null) {
				sb.append(s);
				s = br.readLine();
			}
			reString = sb.toString();
			return reString;

		}

	}

	// String頧lob(����蝺�)
	public static Clob stringToClob(String str, Connection con) throws SQLException {
		if (str == null) {
			return null;
		} else {
			java.sql.Clob clob = con.createClob();
			clob.setString(1, str);
			return clob;
		}
	}

	// String頧lob(����澈��蝺��甇斗瘜�)
	public static Clob stringToClob(String str) {
		if (null == str)
			return null;
		else {
			try {
				java.sql.Clob c = new javax.sql.rowset.serial.SerialClob(str.toCharArray());
				return c;
			} catch (Exception e) {
				return null;
			}
		}
	}

	public static void readPicture(byte[] bytes,String str_no){
		try{
			FileOutputStream out = null;
			if(bytes.length != 0) {
				out = new FileOutputStream("C:\\Users\\user\\Desktop\\Jenny_WebApp\\eclipse-neno3-workspace\\BA103G3_blog\\WebContent\\easyfood\\front-end\\class\\search\\images\\storeIMG\\"+ str_no + ".jpg");
				out.write(bytes);
				out.flush();
			}else{
				
			}
			
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void readDishPicture(byte[] bytes,String dish_no){
		try{
			FileOutputStream out = null;
			if(bytes.length != 0) {
				out = new FileOutputStream("C:\\Users\\user\\Desktop\\Jenny_WebApp\\eclipse-neno3-workspace\\BA103G3_blog\\WebContent\\easyfood\\front-end\\class\\search\\images\\dishIMG\\"+ dish_no + ".jpg");
				out.write(bytes);
				out.flush();
			}else{
				
			}
			
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	// byte頧lob(����蝺�)
	public static Blob byteToBlob(String path, Connection con) throws SQLException, IOException {
		Blob blob = con.createBlob();
		byte[] pic2 = getPictureByteArray(path);
		blob.setBytes(1, pic2);
		return blob;
	}

	public static byte[] getPictureByteArray(String path) throws IOException {
		File file = new File(path);
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		byte[] buffer = new byte[8192];
		int i;
		while ((i = fis.read(buffer)) != -1) {
			baos.write(buffer, 0, i);
		}
		baos.close();
		fis.close();

		return baos.toByteArray();
	}

	// BLOB頧yte
	public static byte[] blobToBytes(Blob blob) {

		BufferedInputStream is = null;

		try {
			is = new BufferedInputStream(blob.getBinaryStream());
			byte[] bytes = new byte[(int) blob.length()];
			int len = bytes.length;
			int offset = 0;
			int read = 0;

			while (offset < len && (read = is.read(bytes, offset, len - offset)) >= 0) {
				offset += read;
			}
			return bytes;
		} catch (Exception e) {
			return null;
		} finally {
			try {
				is.close();
				is = null;
			} catch (IOException e) {
				return null;
			}
		}
	}

	// string 頧� date, 憒� ("2012-05-01")
	public static Date toSqlDate(String date) {

		java.sql.Date d2 = java.sql.Date.valueOf(date);
		// System.out.println("String use sDate.valueOf to Date objcet
		// =>"+d2.toString());
		return d2;
	}

	// ��������(java.sql.Date����)
	public static Date todayTime() {
		java.util.Date now = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(now.getTime());

		return sqlDate;
	}

	// java.sql.Date頧�葡,�撘yyyy/MM/dd hh:mm:ss
	public static String sqlDateToStr(Date sqlDate) {
		java.util.Date utilDate = new java.util.Date();
		utilDate.setTime(sqlDate.getTime());
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		String strDate = sdFormat.format(sqlDate);

		return strDate;
	}

	// ------------------timestsmp--------------------

	// ������imestamp����
	public static Timestamp nowTimestamp() {
		java.util.Date utildate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utildate.getTime());
		java.sql.Time sTime = new java.sql.Time(utildate.getTime());
		java.sql.Timestamp stp = new java.sql.Timestamp(utildate.getTime());
		return stp;
	}

	// Timestamp頧tring
	public static String timestampToString(Timestamp timestamp) {

		if (timestamp == null) {
			return "null";
		} else {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");// 摰�撘��蝷箸神蝘�
			// Timestamp now = new
			// Timestamp(System.currentTimeMillis());//���頂蝏���
			String str = df.format(timestamp);
			System.out.println(str);
			return str;
		}

	}

	// String頧imestamp����,��閮�,憒� "2014-09-23 21:34:12"
	public static java.sql.Timestamp strToTimestamp(String date) {

		java.util.Date result;

		try {

			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			sdf.setLenient(false);

			result = sdf.parse(date);

		} catch (Exception e) {

			return null;

		}

		return new java.sql.Timestamp(result.getTime());

	}
	
	// 嚗��������������oin  tabl �隞踝��������������������
	public static List<FeaVO> getFeaName(AdmVO admVO){
		
		List<FeaVO> feaList=null;

		  AdmpService AdmpSvc=new AdmpService();
		  List<AdmpVO> admpList=(List<AdmpVO>) AdmpSvc.getTwoByADM(admVO.getAdm_no());
		  
		  feaList=new ArrayList<FeaVO>();
		  
		  FeaService feaSvc=new FeaService();
		  for(int i=0;i<admpList.size();i++){
		    feaList.add( feaSvc.getOneFea(admpList.get(i).getFea_no()) );
		  }
		  
		  return feaList;
		
	}
	
	public static List<AdmVO> getAmpList(FeaVO feaVO){
		AdmpService admpSvc=new AdmpService();
		List<AdmpVO> admpList=(List<AdmpVO>) admpSvc.getTwoByFEA(feaVO.getFea_no());
		
		List<AdmVO> admList=new ArrayList<AdmVO>();
		AdmService AdmSvc=new AdmService();
		for(int i=0;i<admpList.size();i++){
			admList.add(AdmSvc.getOneAdm(admpList.get(i).getAdm_no()) );
		}
		return admList;
	}
	
	public static String getMemName(String mem_no){
		MemService memSvc=new MemService();
		MemVO memVO=memSvc.getOneMem(mem_no);
		
		String mem_name=memVO.getMem_name();
		return mem_name;
	}
	
	public static byte[] getPictureByteArraypart (Part part) throws IOException {
		
		InputStream in =part.getInputStream();
		ByteArrayOutputStream out = new ByteArrayOutputStream();
		

		byte[] buffer = new byte[1024];
        int length = -1;
        while ((length = in.read(buffer)) != -1) {
            out.write(buffer, 0, length);
        }
        in.close();
        out.close();
        byte[] part2 = out.toByteArray();

		return part2;
		
	}
	

}