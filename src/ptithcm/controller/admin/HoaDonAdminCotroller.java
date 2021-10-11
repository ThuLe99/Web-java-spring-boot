package ptithcm.controller.admin;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sun.org.apache.xpath.internal.operations.Or;

import ptithcm.bean.Order;
import ptithcm.bean.Product;
import ptithcm.bean.ProductOrder;

@Controller
@RequestMapping("/admin/bill")
@Transactional
public class HoaDonAdminCotroller {
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	ServletContext context;
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String index(ModelMap model, @RequestParam(required = false) String message) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM Order";
		Query query = session.createQuery(hql);
		List<Order> list = query.list();
		model.addAttribute("orders", list);
		model.addAttribute("message", message);
		return "/admin/bill/index";
	}
	
	@RequestMapping(value = "/detail/{idOrder}", method = RequestMethod.GET)
	public String detail(ModelMap model,@PathVariable Integer idOrder, @RequestParam(required = false) String message) {
		int totalMoney =0;
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM ProductOrder where order = :order";
		Query query = session.createQuery(hql);
		query.setInteger("order", idOrder);
		List<Product> pd= new ArrayList<Product>();		
		List<ProductOrder> list = query.list();
		for (ProductOrder p :list )
		{
			String hql1 = "FROM Product where id = :idorder";
			Query query1 = session.createQuery(hql1);
			query1.setInteger("idorder", p.getProduct().getId());
			Product pro = (Product) query1.list().get(0);
			pd.add(pro);
			totalMoney += p.getPrice();
		}
		String hql2 = "FROM Order where id = :idOrder";
		Query query3 = session.createQuery(hql2);
		query3.setInteger("idOrder", idOrder);
		Order ord = (Order) query3.list().get(0);
		model.addAttribute("ttM", totalMoney);
		model.addAttribute("pdo", list);
		model.addAttribute("pro", pd);
		model.addAttribute("ord", ord);
		
		model.addAttribute("message", message);
		return "/admin/bill/detail";
	}
	@RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
	public String delete(ModelMap model, @PathVariable Integer id) {
		Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		String message = "";
		try {
			Order u = (Order) session.get(Order.class, id);
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
		return "redirect:/admin/bill/home.htm";
	}
}
