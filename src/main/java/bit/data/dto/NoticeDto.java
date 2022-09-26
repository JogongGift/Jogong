package bit.data.dto;

import java.sql.Timestamp;
import lombok.Data;

@Data
public class NoticeDto {
	private int num;
	private String title;
	private String content;
	private String imageUrl;
	private Timestamp createdAt;
}
