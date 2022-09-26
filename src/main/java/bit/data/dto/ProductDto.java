package bit.data.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ProductDto {
	private int num;
	private String name;
	private int price;
	private boolean deleveryOption;
	private String country;
	private String description;
	private String thumbnailImageUrl;
	private String brand;
	private String brandLogoUrl;
	private String brandEventImage;
	private int age;
	private boolean messageCard;
	private boolean engrave;
	private int readCount;
	private Timestamp createdAt;
	private int sellerNum;
}
