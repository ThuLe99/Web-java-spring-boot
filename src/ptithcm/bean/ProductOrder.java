package ptithcm.bean;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "ProductOrder")
public class ProductOrder implements Serializable{


	@Id
	@ManyToOne
	@JoinColumn(name = "product_id")
	private Product product;

	@Id
	@ManyToOne
	@JoinColumn(name = "order_id")
	private Order order;
	
	@NotNull(message = "Số lượng không được để trống")
	@Column(name = "count", nullable = false)
	private int count;
	
	@NotNull(message = "Giá không được để trống")
	@Column(name = "price", nullable = false)
	private long price;

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	
	
}
