package com.kupid.manager.feed.model.dao;

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

import com.kupid.feed.model.dto.Feed;
import com.kupid.member.model.dto.MemberDto;

public class FeedManagerDAO {

Properties sql=new Properties();
	
	{
		String path=FeedManagerDAO.class.getResource("/sql/sql_feedmanager.properties").getPath();
		try(FileReader fr=new FileReader(path)){
			sql.load(fr);
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Feed> selectFeedAll(Connection conn,int cPage,int numPerpage){
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Feed> feed=new ArrayList<>();
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFeedAll"));
			pstmt.setInt(1,(cPage-1)*numPerpage+1);
			pstmt.setInt(2, cPage*numPerpage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				feed.add(getFeed(rs));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return feed;
	}
	
	public int selectFeedAllCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("selectFeedAllCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) result=rs.getInt(1);
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
	
	public int deleteFeed(Connection conn,int no) {
		PreparedStatement pstmt=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(sql.getProperty("deleteFeed"));
			pstmt.setInt(1, no);
			result=pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
	
	private Feed getFeed(ResultSet rs) throws SQLException{
		return Feed.builder()
				.feedNo(rs.getInt("FEED_NO"))
				.feedMemberName(rs.getString("MEMBER_NO"))
				.feedWriterName(rs.getString("WRITER_NAME"))
				.feedContent(rs.getString("CONTENT"))
				.feedWriteDate(rs.getDate("WRITEDATE"))
				.feedUpdateDate(rs.getDate("UPDATEDATE"))
				.likes(rs.getInt("LIKES"))
				.report(rs.getInt("REPORT"))
				.memberGrade(rs.getString("member_grade"))
				.build();
	}
	
	
	
}
