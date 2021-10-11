package ptithcm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import ptithcm.bean.Account;
import ptithcm.bean.Category;
import ptithcm.bean.Order;
import ptithcm.bean.Product;
import ptithcm.bean.ProductOrder;
import ptithcm.bean.Role;
import ptithcm.bean.SessionCart;
import ptithcm.bean.SessionUser;
import ptithcm.bean.User;

@Controller
@Transactional

public class HomeController {
	private static final String SessionCart = null;
	@Autowired
	SessionFactory sessionFactory;

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index(ModelMap model, HttpSession httpSession, @RequestParam(required = false) String message) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product";
		Query query = session.createQuery(hql);
		List<Product> list = query.list();
		model.addAttribute("products", list);
		if (((SessionCart) httpSession.getAttribute("SessionCart")) == null) {
			SessionCart listCart = new SessionCart();
			httpSession.setAttribute("SessionCart", listCart);
		}
		return "/web/home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		model.addAttribute("user", new Account());
		
		return "/web/login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(ModelMap model, HttpSession httpSession, @Validated @ModelAttribute("user") Account user,
			BindingResult bindingResult) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("user", user);
			return "/web/login";
		}

		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM User WHERE account = :account1 AND password = :password1";
		Query query = session.createQuery(hql);
		query.setParameter("account1", user.getAccount());
		query.setParameter("password1", user.getPassword());
		List<User> list = query.list();
		if (list.size() > 0) {
			SessionUser su = new SessionUser();
			su.setCheckLogin(true);
			su.setHoTen(list.get(0).getHoTen());
			su.setId(list.get(0).getId());
			su.setRole(list.get(0).getRole().getId());
			httpSession.setAttribute("sessionUser", su);
			if (su.getRole() == 2) {
				return "redirect:/home.htm";
			} else {
				return "redirect:/admin/product/home.htm";
			}

		} else {
			model.addAttribute("message", "Đăng nhập Thất Bại");
			return "/web/login";
		}

	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, HttpServletRequest request) {
		session = request.getSession(false);
		session.removeAttribute("sessionUser");
		return "redirect:/home.htm";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String register(ModelMap model, @RequestParam(required = false) String message) {
		model.addAttribute("user", new User());
		model.addAttribute("message", message);
		return "/web/register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(ModelMap model, @Validated @ModelAttribute("user") User user, BindingResult bindingResult, @RequestParam(required = false) String message) {
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("user", user);
			return "/web/register";
		}
		Session session1 = sessionFactory.getCurrentSession();
		String hql = "FROM User WHERE account = :account1";
		Query query = session1.createQuery(hql);
		query.setParameter("account1", user.getAccount());
		if(query.list().size()>0)
		{
			model.addAttribute("message", "Tên đăng ký tồn tại!");
			return "redirect:/register.htm";
		}			
		Role role = new Role();
		role.setId(2);
		user.setRole(role);
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		try {

			session.save(user);
			t.commit();
			model.addAttribute("message", "Đăng ký Thành Công");
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			System.out.println(e.getMessage());
			model.addAttribute("message", "Đăng ký Thất Bại");

		}
		return "redirect:/login.htm";

	}

	@RequestMapping(value = "/cart")
	public String cart(ModelMap model, HttpSession httpSession) {
		SessionCart ssc = (SessionCart) httpSession.getAttribute("SessionCart");
		model.addAttribute("order", new Order());
		model.addAttribute("ssc", ssc);
		return "/web/cart";
	}

	@RequestMapping(value = "/cart", method = RequestMethod.POST)
	public String themCart(ModelMap model, @ModelAttribute("gioHang") ProductOrder cart, HttpSession httpSession,
			@RequestParam Integer idCategory) {

		SessionCart ssCart = (SessionCart) httpSession.getAttribute("SessionCart");
		int vitritrung = -1;
		for (int i = 0; i < ssCart.getListpdo().size(); i++) {
			if (ssCart.getListpdo().get(i).getProduct().getId() == cart.getProduct().getId()) {
				vitritrung = i;

				/* s.setCount(s.getCount()+cart.getCount()); */
			}

		}
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product WHERE id = :product1";
		Query query = session.createQuery(hql);
		query.setInteger("product1", cart.getProduct().getId());
		Product pd = (Product) query.list().get(0);
		if (vitritrung >= 0)// trung - co sp do trong cart
		{
			ProductOrder temp1= ssCart.getListpdo().get(vitritrung);
			int tempsl = cart.getCount();
			temp1.setCount(temp1.getCount() + tempsl);
			temp1.setPrice(temp1.getPrice() + pd.getPrice() * tempsl);
			ssCart.getListpdo().set(vitritrung, temp1);
			ssCart.setListpdo(ssCart.getListpdo());
		} else {
			cart.setProduct(pd);
			cart.setPrice(cart.getCount() * pd.getPrice());
			ssCart.getListpdo().add(cart);
			ssCart.setListpdo(ssCart.getListpdo());
		}
		long tongTien = 0;
		int tongSP = 0;
		for (ProductOrder pdo : ssCart.getListpdo()) {
			tongTien += pdo.getPrice();
			tongSP += pdo.getCount();
		}
		ssCart.setItem(tongSP);
		ssCart.setPrice(tongTien);
		httpSession.setAttribute("SessionCart", ssCart);
		return "redirect:/category/" + idCategory + "/product/" + cart.getProduct().getId() + ".htm";
	}

	@RequestMapping(value = "/order", method = RequestMethod.POST)
	public String order(ModelMap model, HttpSession httpSession, @Validated @ModelAttribute("order") Order orders,
			BindingResult bindingResult) {
		SessionCart ssc = (SessionCart) httpSession.getAttribute("SessionCart");
		SessionUser ssu = (SessionUser) httpSession.getAttribute("sessionUser");
		
		if (bindingResult.hasErrors()) {
			model.addAttribute("ssc", ssc);
			model.addAttribute("message", "Them that bai");
			model.addAttribute("order", orders);
			return "/web/cart";
		}
		if (ssu == null) {
			return "redirect:/login.htm";
		}
		User u = new User();
		u.setId(ssu.getId());
		orders.setUser(u);
		orders.setCreateDt(new Date());
		Session session = null;
		Transaction t = null;
		try {
			session = sessionFactory.openSession();
			t = session.beginTransaction();
			session.persist(orders);
			t.commit();
			for (ProductOrder p : ssc.getListpdo()) {
				session = sessionFactory.openSession();
				t = session.beginTransaction();
				p.setOrder(orders);
				session.persist(p);
				t.commit();
			}
			System.out.println(orders.getId());
			model.addAttribute("message", "Thêm Thành Công");
			httpSession.setAttribute("SessionCart", new SessionCart());
			return "redirect:/cart.htm";
		} catch (Exception e) {
			// TODO: handle exception
			t.rollback();
			System.out.println(e.getMessage());
			model.addAttribute("message", "Thêm Thất Bại");
			return "redirect:/cart.htm";
		}

	}

	@RequestMapping(value = "/category/{idCategory}/product/{idProduct}", method = RequestMethod.GET)
	public String detail(ModelMap model, @PathVariable Integer idProduct, @PathVariable Integer idCategory) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Product WHERE id = :product1";
		Query query = session.createQuery(hql);
		query.setInteger("product1", idProduct);
		Product s = (Product) session.get(Product.class, idProduct);

		String hql1 = "FROM Product WHERE category = :category2";
		Query query2 = session.createQuery(hql1);
		query2.setInteger("category2", idCategory);
		List<Product> list = query2.list();
		model.addAttribute("product", s);
		model.addAttribute("products", list);

		ProductOrder pdo = new ProductOrder();
		pdo.setProduct(new Product());
		pdo.setOrder(new Order());
		model.addAttribute("gioHang", pdo);
		model.addAttribute("category", idCategory);
		return "/web/detailProduct";
	}

	@RequestMapping(value = "/about")
	public String about(ModelMap model) {

		return "/web/about";
	}

	@RequestMapping(value = "/category/{idCategory}", method = RequestMethod.GET)
	public String category(ModelMap model, @PathVariable Integer idCategory) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Category WHERE id = :category1";
		Query query = session.createQuery(hql);
		query.setInteger("category1", idCategory);
		Category s = (Category) session.get(Category.class, idCategory);

		String hql1 = "FROM Product WHERE category = :category2";
		Query query2 = session.createQuery(hql1);
		query2.setInteger("category2", idCategory);
		List<Product> list = query2.list();
		model.addAttribute("product", list);
		model.addAttribute("category", s);
		return "/web/category";
	}
	@RequestMapping(value = "/delete/{id}")
	public String delete(ModelMap model, @PathVariable Integer id, HttpSession httpSession) {
		SessionCart ssCart = (SessionCart) httpSession.getAttribute("SessionCart");
		for (int i = 0; i < ssCart.getListpdo().size(); i++) {
			if (ssCart.getListpdo().get(i).getProduct().getId() == id) {
				ProductOrder temp1= ssCart.getListpdo().get(i);
				ssCart.getListpdo().remove(i);
				break;
			}
		}
			long tongTien = 0;
			int tongSP = 0;
			for (ProductOrder pdo : ssCart.getListpdo()) {
				tongTien += pdo.getPrice();
				tongSP += pdo.getCount();
			}
			ssCart.setItem(tongSP);
			ssCart.setPrice(tongTien);
			
		ssCart.setListpdo(ssCart.getListpdo());
		httpSession.setAttribute("SessionCart", ssCart);
		
		return "redirect:/cart.htm";
	}

}

