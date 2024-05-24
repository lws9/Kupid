package com.kupid.feed.model.service;

import static com.kupid.common.JDBCTemplate.close;
import static com.kupid.common.JDBCTemplate.commit;
import static com.kupid.common.JDBCTemplate.getConnection;
import static com.kupid.common.JDBCTemplate.rollback;

import java.io.File;
import java.sql.Connection;
import java.util.Iterator;
import java.util.List;

import com.kupid.feed.model.dao.FeedDao;
import com.kupid.feed.model.dto.Feed;
import com.kupid.feed.model.dto.LikeFeed;
import com.kupid.feed.model.dto.Reply;
public class FeedService {
	private FeedDao dao = new FeedDao();
	
	public List<Reply> selectFeedComment(int feedNo) {
		Connection conn = getConnection();
		List<Reply> fc = dao.selectFeedComment(conn,feedNo);
		close(conn);
		return fc;
	}
	
	public int insertFeedReport(String category, String content, int reportMemberNo, int reportedfeedNo) {
		Connection conn = getConnection();
		System.out.println(reportedfeedNo);
		int reportedMemberNo = dao.selectMemberByFeedNo(conn, reportedfeedNo);
		System.out.println(reportedMemberNo);
		int result = dao.insertFeedReport(conn,category,content,reportMemberNo,reportedMemberNo);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
		
	}
	

	public int switchingLikes(int memberNo,int feedNo) {
		Connection conn = getConnection();
		int countClick = dao.selectLikes(conn, memberNo, feedNo); 
		int result = 0;
		int likes = 0;
		if(countClick==0) {
			 result= dao.insertLikes(conn,memberNo,feedNo);
			 likes = dao.selectFeedLikes(conn,feedNo);
			 if(result>0) commit(conn);
				else rollback(conn);
			 return likes;
		}else {
			 result = dao.deleteLikes(conn,memberNo,feedNo);
			 likes = dao.selectFeedLikes(conn,feedNo);
			 if(result>0) commit(conn);
				else rollback(conn);
			 return likes;
			 
		}
		
	}
	
	public int insertProcess(Feed f, List<String> filePath) {
		Connection conn = getConnection();
		int seq = dao.selectSeqFeed(conn);
		int memberNo = dao.selectMemberNoById(conn,f.getFeedWriterName());
		int result = dao.insertFeed(conn,f,seq,memberNo);
		Iterator<String>iter = filePath.iterator();
		while(iter.hasNext()) {
			String nextPath = iter.next();
			System.out.println(nextPath);
			result = dao.insertFeedFile(conn,nextPath,seq);
			
			if(result==0) {
				File delFile=new File(nextPath);
				if(delFile.exists()) delFile.delete();
			}
		}
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
//	public int insertFeed(Feed f,int seq){
//		Connection conn = getConnection();
//		int result = dao.insertFeed(conn,f,seq);
//		close(conn);
//		return result;
//	}
//	
	public int insertFeedComment(int loginMember,String comment,int feedNo) {
		Connection conn = getConnection();
		int result = dao.insertFeedComment(conn,loginMember,comment,feedNo);
		close(conn);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	public List<Feed> selectFeedAll(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Feed> result=dao.selectFeedAll(conn,cPage,numPerpage);
		close(conn);
		return result;
	}
	
	public int selectFeedCount() {
		Connection conn = getConnection();
		int result = dao.selectFeedCount(conn);
		close(conn);
		return result;
		
	}
	
//	public int switchingLikes() {
//		Connection conn = getConnection();
//		int result = dao.switchingLikes(conn);
//		close(conn);
//		return result;
//	}
	
}
