package com.kupid.faq.model.dao;

import static com.kupid.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kupid.faq.model.dto.FaqDto;



public class FaqDao {
	private Properties sql=new Properties();
	
	{
		String path=FaqDao.class.getResource("/sql.faq/sql_faq.properties").getPath();
		try(FileReader fr=new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
	    }
	}	
		
		public List<FaqDto> selectFaqAll(Connection conn,int cPage,int numberpage){
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			List<FaqDto> faq=new ArrayList<FaqDto>();
			try {
				pstmt=conn.prepareStatement(sql.getProperty("selectFaqAll"));
				pstmt.setInt(1,(cPage-1)*numberpage+1);
				pstmt.setInt(2, cPage*numberpage);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					faq.add(getFaq(rs));
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
			}
			return faq;
		}
			
			public static FaqDto getFaq(ResultSet rs) throws SQLException{
				return FaqDto.builder()
						.faqNo(rs.getInt("faqNo"))
						.faqTitle(rs.getString("faqTitle"))
						.faqContent(rs.getString("faqContent"))
						.faqCategory(rs.getString("faqCategory"))
						.faqDate(rs.getDate("faqDate"))
						.build();
			}
		}
    

