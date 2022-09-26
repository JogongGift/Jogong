package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SellerDto {

	private int num;
	private String email;
	private String password;
	private String companyName;
	private String businessNumber;
	private String logoImage;
	private String phone;
	private String address;
	private String bank;
	private String accountNumber;
	private Timestamp createdAt;
	
}
