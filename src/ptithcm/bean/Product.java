package ptithcm.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "Product")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "createDt")
	private Date createDt;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "updateDt")
	private Date updateDt;
	
	@NotBlank(message = "Mô tả không được bỏ trống")
	@Column(name = "content", columnDefinition = "nvarchar(1000 )")
	private String content;
	
	@NotNull(message = "Số lượng không được để trống")
	@DecimalMin(value = "0",message = "Số lượng không hợp lệ")
	@Column(name = "count")
	private Integer count;
	
	@DecimalMin(value = "0",message = "Giảm giá không hợp lệ")
	@DecimalMax(value = "100",message = "Giảm không hợp lệ")
	@Column(name = "discount")
	private Long discount;
	
	@Column(name = "image", columnDefinition = "varchar(250)")
	private String image;
	
	@NotBlank(message = "Tên sản phẩm không được bỏ trống")
	@Column(name = "name", columnDefinition = "nvarchar(250)")
	private String name;
	
	@NotNull(message = "Giá sản phẩm không được để trống")
	@DecimalMin(value = "0",message = "Giá không hợp lệ")
	@Column(name = "price")
	private Long price;
	
	@ManyToOne
	@JoinColumn(name = "category")
	private Category category;
	
	@OneToMany(mappedBy = "product", fetch = FetchType.EAGER)
	private List<ProductOrder> listSPOrder = new ArrayList<ProductOrder>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public Date getUpdateDt() {
		return updateDt;
	}

	public void setUpdateDt(Date updateDt) {
		this.updateDt = updateDt;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Long getDiscount() {
		return discount;
	}

	public void setDiscount(Long discount) {
		this.discount = discount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getPrice() {
		return price;
	}

	public void setPrice(Long price) {
		this.price = price;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<ProductOrder> getListSPOrder() {
		return listSPOrder;
	}

	public void setListSPOrder(List<ProductOrder> listSPOrder) {
		this.listSPOrder = listSPOrder;
	}

	
	

}
