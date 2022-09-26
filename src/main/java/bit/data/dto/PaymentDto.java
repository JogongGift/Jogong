package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PaymentDto {
	private int num;
	private String paymentMethod;
	private Timestamp paymentDate;
	private int orderNum;
}
