package ptithcm.bean;

import java.util.ArrayList;
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

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "`User`")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@NotBlank(message = "Họ tên không được để trống")
	@Column(name = "hoTen", nullable = false, columnDefinition = "nvarchar(250)")
	private String hoTen;

	@NotBlank(message = "Tên đăng nhập không được để trống")
	@Column(name = "account", nullable = false, columnDefinition = "nvarchar(250)")
	private String account;

	@NotBlank(message = "Mật khẩu không được để trống")
	@Column(name = "password", nullable = false, columnDefinition = "nvarchar(250)")
	private String password;

	@NotBlank(message = "Email không được để trống")
	@Column(name = "email", columnDefinition = "nvarchar(250)")
	private String email;

	@NotBlank(message = "Số điện thoại không được để trống")
	@Column(name = "sdt", nullable = false)
	private String sdt;

	@ManyToOne
	@JoinColumn(name = "roleID")
	private Role role;

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private List<Order> listOrder = new ArrayList<Order>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getHoTen() {
		return hoTen;
	}

	public void setHoTen(String hoTen) {
		this.hoTen = hoTen;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSdt() {
		return sdt;
	}

	public void setSdt(String sdt) {
		this.sdt = sdt;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Order> getListOrder() {
		return listOrder;
	}

	public void setListOrder(List<Order> listOrder) {
		this.listOrder = listOrder;
	}

}
