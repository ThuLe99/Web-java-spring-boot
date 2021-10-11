package ptithcm.controller.admin;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ptithcm.bean.Category;
import ptithcm.bean.Product;

@Controller
@RequestMapping("/admin/product")
@Transactional
public class HomeAdminComtroller {
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	ServletContext context;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index(ModelMap model, @RequestParam(required = false) String message) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("products", list);
		model.addAttribute("message", message);
		return "/admin/product/index";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(ModelMap model) {
		model.addAttribute("products", new Product());
		return "/admin/product/insert";
	}

	@RequestMapping(value = "/insert", method = RequestMethod.POST)
	public String insert(ModelMap model, @RequestParam("img") MultipartFile photo, @Validated @ModelAttribute("products") Product products, BindingResult bindingResult) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("products", products);
			return "/admin/product/insert";
		}
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		products.setCreateDt(new Date());
		products.setUpdateDt(new Date());
		try {
			if (photo.isEmpty()) {
				model.addAttribute("message", "Vui lòng chọn file");
			} else {
				String photoPath = context.getRealPath("/file/" + photo.getOriginalFilename());
				System.out.println(photoPath);
				File sp = new File(photoPath);
				photo.transferTo(sp);
				products.setImage("/file/" + photo.getOriginalFilename());
				session.save(products);
				t.commit();
				model.addAttribute("message", "Thêm Thành Công");
			}
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			System.out.println(e.getMessage());
			model.addAttribute("message", "Thêm Thất Bại");
		}

		return "redirect:/admin/product/home.htm";
	}

	@RequestMapping(value = "/update/{id}", method = RequestMethod.GET)
	public String update(ModelMap model, @PathVariable Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Product s = (Product) session.get(Product.class, id);
		model.addAttribute("products", s);
		return "admin/product/update";
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(ModelMap model, @Validated @ModelAttribute("products") Product product , BindingResult bindingResult, @RequestParam("img") MultipartFile photo) {
		if(bindingResult.hasErrors()) {
			model.addAttribute("products", product);
			return "/admin/product/insert";
		}
		Session session = null;
		session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		product.setUpdateDt(new Date());
		try {
			if (!photo.isEmpty()) {
				File oldsp = new File(context.getRealPath(product.getImage()));
				oldsp.delete();
				String photoPath = context.getRealPath("/file/" + photo.getOriginalFilename());
				System.out.println(photoPath);
				File sp = new File(photoPath);
				photo.transferTo(sp);
				product.setImage("/file/" + photo.getOriginalFilename());
			} 
			
			session.update(product);
			t.commit();
			model.addAttribute("message", "Sửa Thành Công");
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			System.out.println(e.getMessage());
			model.addAttribute("message", "Sửa  Thất Bại");

		}
		return "redirect:/admin/product/home.htm";
	}

	@RequestMapping(value = "/delete/{id}")
	public String delete(ModelMap model, @PathVariable Integer id) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		String message = "";
		try {
			Product u = (Product) session.get(Product.class, id);

			session.delete(u);

			t.commit();
			model.addAttribute("message", "Xóa thành công");
		} catch (Exception e) {
			t.rollback();
			model.addAttribute("message", "Xóa thất bại");
			// TODO: handle exception
		} finally {
			session.close();
		}
		return "redirect:/admin/product/home.htm";
	}

	@ModelAttribute("categorys")
	public List<Category> getCategorys() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Category";
		Query query = session.createQuery(hql);
		List<Category> list = query.list();
		return list;
	}
	
}
