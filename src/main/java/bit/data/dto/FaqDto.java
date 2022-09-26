package bit.data.dto;

import lombok.Data;

@Data
public class FaqDto {
	private int num;
	private String title;
	private String content;
	private String imageUrl;
	private String createdAt;
	private String faqCategoryNum;
}
