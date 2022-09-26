package bit.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ProductController {
	
	@GetMapping("/product/detail")
	public String detail() {
		
		return "/bit/product/detail";
	}
	
}
