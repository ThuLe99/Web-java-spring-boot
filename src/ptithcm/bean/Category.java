package ptithcm.bean;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name = "Category")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@NotBlank(message = "Tên danh mục không được bỏ trống")
	@Column(name = "Name", nullable = false, columnDefinition = "nvarchar(250)")
	private String name;

	@OneToMany(mappedBy = "category", fetch = FetchType.EAGER)
	private List<Product> listSP = new ArrayList<Product>();

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Product> getListSP() {
		return listSP;
	}

	public void setListSP(List<Product> listSP) {
		this.listSP = listSP;
	}

	
}
