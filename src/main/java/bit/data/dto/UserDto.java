package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class UserDto {
	private int num;
	private String email;
	private String password;
	private String nickname;
	private String profileImage;
	private String phone;
	private String address;
	private int gender;
	private int point;
	private int year;
	private int date;
	private String loginType;
	private Timestamp createdAt;
	private int isAdmin;
}
