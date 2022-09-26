package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaDto {

	private int num;
	private String title;
	private String content;
	private String imageUrl;
	private Timestamp createdAt;
	private String email;
	private int userNum;
	private int orderNum;
	private int qnaCategoryNum;
}
