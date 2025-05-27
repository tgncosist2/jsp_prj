package day0512;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

public class ProductService {

	public List<ProductDTO> serchPrd() {
		List<ProductDTO> list = new ArrayList<ProductDTO>();

		list.add(new ProductDTO(1, "I_001", "키보드", "img_1.jpg", 13500, new Date()));
		list.add(new ProductDTO(2, "I_002", "마우스", "img_2.jpg", 52700, new Date()));
		list.add(new ProductDTO(3, "I_003", "모니터", "img_3.jpg", 142200, new Date()));
		list.add(new ProductDTO(4, "I_004", "본체", "img_4.jpg", 434300, new Date()));
		list.add(new ProductDTO(5, "I_005", "노트북", "img_5.jpg", 111100, new Date()));
		list.add(new ProductDTO(6, "I_006", "아이패드", "img_7.jpg", 780000, new Date()));

		return list;
	}

}
