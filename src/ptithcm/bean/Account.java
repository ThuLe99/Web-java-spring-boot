package ptithcm.bean;

import org.hibernate.validator.constraints.NotBlank;

public class Account {
	@NotBlank(message = "Tên đăng nhập không được để trống")
	private String account;
	
	@NotBlank(message = "Mật khẩu không được để trống")
	private String password;

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
	
	
}
