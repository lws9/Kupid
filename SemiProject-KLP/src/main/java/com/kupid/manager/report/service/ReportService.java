package com.kupid.manager.report.service;

import java.sql.Connection;
import java.util.List;

import static com.kupid.common.JDBCTemplate.getConnection;
import static com.kupid.common.JDBCTemplate.commit;
import static com.kupid.common.JDBCTemplate.rollback;
import static com.kupid.common.JDBCTemplate.close;

import com.kupid.manager.penalty.model.dto.Penalty;
import com.kupid.manager.report.model.dao.ReportDAO;
import com.kupid.manager.report.model.dto.Report;

public class ReportService {
	
	
	ReportDAO dao=new ReportDAO();

	public List<Report> selectReportAll(int cPage,int numPerpage){
		Connection conn=getConnection();
		List<Report> report=dao.selectReportAll(conn,cPage,numPerpage);
		close(conn);
		return report;
	}
	
	
	public int selectReportAllCount() {
		Connection conn=getConnection();
		int result=dao.selectReportAllCount(conn);
		close(conn);
		return result;
	}
	
	public Report selectReportByNo(int no) {
		Connection conn=getConnection();
		Report report=dao.selectReportByNo(conn,no);
		close(conn);
		return report;
	}
	
	public int insertPenalty(Penalty p) {
		Connection conn=getConnection();
		int result=dao.insertPenalty(conn,p);
		if(result>0) {
			dao.updateReportResult(conn,p);
			commit(conn);
		}
		else rollback(conn);
		close(conn);
		return result;
	}
	
}
