package bit.data.dao;

import java.util.List;
import java.util.Map;

import bit.data.dto.CategoryDto;
import bit.data.dto.ProductDto;

public interface ProductDaoInter {
	public List<ProductDto> getFriendWishlist(int userNum);
	public List<ProductDto> getCart(int userNum);
	public List<ProductDto> getProduct(int price);
	public List<ProductDto> getProductTheme(int themeNum);
//	public List<ProductDto> getTag(int themeNum);
	public ProductDto getProductDetail(int num);
<<<<<<< HEAD
	public List<CategoryDto> getCategory();
	public String getCategoryByNum(int categoryNum);
	public int getTotalProductByCateNum(int categoryNum);
	public List<ProductDto> getProductByNum(Map<String, Object> map);
	
	
=======
	public void updateReadCount(int num);
	public List<ProductDto> selectWriteableList(int userNum);

>>>>>>> 46aa0c4c68f641a8a44aef67e8fc3f078826bce7
}
