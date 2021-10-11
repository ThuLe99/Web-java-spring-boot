package ptithcm.bean;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "`Order`")
public class Order {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotBlank(message = "Tên người nhận không được bỏ trống")
	@Column(name = "reciever", columnDefinition = "nvarchar(250)")
	private String reciever;
	
	@NotBlank(message = "Mô tả không được bỏ trống")
	@Column(name = "content", columnDefinition = "nvarchar(250)")
	private String content;
	
	@NotNull(message = "Tổng tiền không được để trống")
	@DecimalMin(value = "0",message = "Giá không hợp lệ")
	@Column(name = "total_money")
	private long total_money;
	
	@NotBlank(message = "Địa chỉ nhận hàng không được bỏ trống")
	@Column(name = "address", columnDefinition = "nvarchar(250)", nullable = false)
	private String address;
	
	
	@NotBlank(message = "Số điện thoạn nhận hàng không được bỏ trống")
	@Column(name = "sdt")
	private String sdt;
	
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "createDt")
	private Date createDt;

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column(name = "updateDt")
	private Date updateDt;

	@ManyToOne
	@JoinColumn(name = "userID")
	private User user;

	@OneToMany(mappedBy = "order")
	private List<ProductOrder> productOrders = new ArrayList<ProductOrder>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public long getTotal_money() {
		return total_money;
	}

	public void setTotal_money(long total_money) {
		this.total_money = total_money;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}


	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<ProductOrder> getProductOrders() {
		return productOrders;
	}

	public void setProductOrders(List<ProductOrder> productOrders) {
		this.productOrders = productOrders;
	}

	

	

}
