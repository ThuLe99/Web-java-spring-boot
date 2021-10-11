package ptithcm.bean;

public class SessionUser {
	private Integer id;
	private String hoTen;
	private Integer role;
	private Boolean checkLogin;
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

	public Integer getRole() {
		return role;
	}
	public void setRole(Integer role) {
		this.role = role;
	}
	public Boolean getCheckLogin() {
		return checkLogin;
	}
	public void setCheckLogin(Boolean checkLogin) {
		this.checkLogin = checkLogin;
	}
	
	
	
}
