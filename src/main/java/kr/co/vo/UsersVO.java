package kr.co.vo;

import lombok.Data;

@Data
public class UsersVO {
	private String userId;
	private String userPwd;
	private String userName;
	private int userAge;
	private String userEmail;
	private String userIntro;
	private String stored_file_name;
}
