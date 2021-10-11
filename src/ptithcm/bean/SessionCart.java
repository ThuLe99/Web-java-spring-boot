package ptithcm.bean;

import java.util.ArrayList;
import java.util.List;

public class SessionCart {
	private Long price;//tong tien
	private Integer item;//tong sp
	List<ProductOrder> listpdo ;
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public Integer getItem() {
		return item;
	}
	public void setItem(Integer item) {
		this.item = item;
	}
	public List<ProductOrder> getListpdo() {
		return listpdo;
	}
	public void setListpdo(List<ProductOrder> listpdo) {
		this.listpdo = listpdo;
	}
	public SessionCart() {
		super();
		this.price = (long) 0;
		this.item = 0;
		this.listpdo = new ArrayList<ProductOrder>();
	}
	
	
}
