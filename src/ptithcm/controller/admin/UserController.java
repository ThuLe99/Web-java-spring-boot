package ptithcm.controller.admin;

import java.util.List;

import javax.servlet.ServletContext;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ptithcm.bean.User;

@Controller
@RequestMapping("/admin/user")
@Transactional
public class UserController {
	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	ServletContext context;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(ModelMap model, @RequestParam(required = false) String message) {
		Session session = sessionFactory.getCurrentSession();
		String hql = "FROM User";
		Query query = session.createQuery(hql);
		List<User> list = query.list();
		model.addAttribute("users", list);
		model.addAttribute("message", message);
		return "/admin/user";
	}
}
