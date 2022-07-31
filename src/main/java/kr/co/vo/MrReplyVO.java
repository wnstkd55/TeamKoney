package kr.co.vo;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MrReplyVO {
	private int mr_no;
	private int mr_bno;
	private String mr_writer;
	private String mr_content;
	
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd")
	private Date mr_regdate;
	
}