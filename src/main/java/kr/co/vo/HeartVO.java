package kr.co.vo;

import lombok.Data;

@Data
public class HeartVO {
	private Integer heartid;
	private Integer mr_id;
	private String userId;
	private Integer heart;
	
	/*
	 * public HeartVO(){} //기본생성자 public HeartVO(Integer heart) { //하트만 받는 생성자
	 * this.heart = heart; }
	 */
	
	/*
	 * @Override public String toString() { return "heartDto{" + "heartId=" +
	 * heartid + ", mr_id=" + mr_id + ", userId='" + userId + '\'' + ", heart=" +
	 * heart + '}'; }
	 */
}
