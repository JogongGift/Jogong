package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderDto {
	private int num;
	private Timestamp orderData;
	private int totalPrice;
	private int deleveryCharge;
	private String deleveryAdress;
	private String orderStatus;
	private int paidPoint;
	private int userNum;
}
