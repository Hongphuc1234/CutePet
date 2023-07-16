package com.fa.demomvc.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.List;

import javax.validation.Valid;
import javax.enterprise.inject.New;
import javax.servlet.http.HttpSession;

import org.apache.naming.java.javaURLContextFactory;
import org.hibernate.annotations.common.util.impl.LoggerFactory;
import org.jboss.logging.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.fa.demomvc.entity.Account;
import com.fa.demomvc.entity.Addproduct;
import com.fa.demomvc.entity.Product;
import com.fa.demomvc.entity.buy;
import com.fa.demomvc.page.PageAble;
import com.fa.demomvc.service.AccountService;
import com.fa.demomvc.service.CommentService;
import com.fa.demomvc.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private AccountService accountService;
	@Autowired
	private CommentService comSe;

	@RequestMapping(value = "/list")
	public String Home(HttpSession session) {
		return "home";
	}

	@RequestMapping("/listA")
	public String getAlllProduct(Model model, HttpSession session , @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		
		List<Product> products = productService.findByName(pageAble);
		model.addAttribute("product", products);
		List<Product> productnew = productService.findNew(pageAble);
		model.addAttribute("newp",productnew);
			model.addAttribute("totalPages", productService.totalPages(pageAble));
			model.addAttribute("currentPage", page);
		System.out.println(session.getAttribute("acc"));
		return "home";
	}

	@GetMapping("/search")
	public String search(Model model,@RequestParam("keyword") String keyword, HttpSession session, @RequestParam(defaultValue = "1") Integer page) {
		PageAble pageAble = new PageAble(page);
		model.addAttribute("keyword",keyword);
		List<Product> products = productService.SearchByName(keyword,pageAble);
		System.out.println(productService.totalPagesearch(keyword,pageAble));
		List<Product> productnew = productService.findNew(pageAble);
		model.addAttribute("newp",productnew);
		model.addAttribute("product", products);
		model.addAttribute("totalPages", productService.totalPagesearch(keyword,pageAble));
		model.addAttribute("currentPage", page);
		return "search";
	}

	
	// show manf hinh quản lí bài đăng cuar admin
    @RequestMapping(path = { "/manager-topic" }, method = { RequestMethod.GET })
    public String managerTopic(Model model, @RequestParam(defaultValue = "1") Integer page , HttpSession session) {
    	if (session.getAttribute("accA") == null) {
			model.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		}else {
    	PageAble pageAble = new PageAble(page);
        List<Product> products = productService.findByName(pageAble);
        model.addAttribute("products", products);
        model.addAttribute("totalPages", productService.totalPages(pageAble));
        model.addAttribute("currentPage", page);
        return "manager-topic";
    }
    }
    // show man hinh quản lí user cua admin
    @RequestMapping(path = {"/manager-user" }, method = { RequestMethod.GET })
    public String managerUser(Model model, @RequestParam(defaultValue = "1") Integer page,HttpSession session) {
    	if (session.getAttribute("accA") == null) {
			model.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		}else {
    	
    	PageAble pageAble = new PageAble(page);
        List<Account> user = accountService.findAll();
        model.addAttribute("users", user);
        return "manager-user";
    }
	
    }
	
	@GetMapping("/add")
	public String showAddForm(Model model, HttpSession session) {
		if (session.getAttribute("accA") == null) {
			model.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		} else {
			model.addAttribute("productForm", new Product());
			return "add";
		}
	}
	
	@GetMapping("/showupdate1")
	public String showupdateForm(Model model, HttpSession session,@RequestParam(name="ProductID") int ProductID ,@RequestParam(name="message")String mes) {
		if (session.getAttribute("accA") == null) {
			model.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		} else {
			Product p = productService.findById(ProductID);
			model.addAttribute("p",p);
			model.addAttribute("message",mes);
			model.addAttribute("updateForm", new Product());
			return "updateproduct";
		}
	}

	@GetMapping("/showupdate")
	public String showupdateForm(Model model, HttpSession session,@RequestParam(name="ProductID") int ProductID ) {
		if (session.getAttribute("accA") == null) {
			model.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		} else {
			Product p = productService.findById(ProductID);
			model.addAttribute("p",p);
			model.addAttribute("updateForm", new Product());
			return "updateproduct";
		}
	}

	@PostMapping("/save")
	public String addNewProduct(@ModelAttribute(name = "productForm") Product product, BindingResult result, Model m,
			HttpSession session) {
		if (session.getAttribute("accA") == null ) {
			m.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		} else {
			if (product.getProductname().trim().isEmpty() || product.getDescription().trim().isEmpty()
					|| product.getImg().trim().isEmpty() || product.getPrice() == 0) {
				m.addAttribute("message", "Vui lòng nhập đầy đủ thông tin");
				return "add";
			}
			 LocalDateTime current = LocalDateTime.now();
			    //sử dụng class DateTimeFormatter và class FormatStyle để định dạng ngày giờ hiện tại theo dạng localized
			    DateTimeFormatter formatter = DateTimeFormatter.ofLocalizedDateTime(FormatStyle.MEDIUM);
			    //gán ngày giờ sau khi format cho chuỗi formatted
			    String formatted = current.format(formatter);
			product.setDatatime(formatted);
			product.setImg("/resources/image/" + product.getImg());
			productService.saveOrUpdate(product);

			return "redirect:/listA";
		}
	}
	///chua xong
	@PostMapping("/saveupdateproduct")
	public String addupdateProduct(@ModelAttribute(name = "updateForm") Product product, BindingResult result, Model m,
			HttpSession session) {
		if (session.getAttribute("accA") == null ) {
			m.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		} else {
			if (product.getProductname().trim().isEmpty() || product.getDescription().trim().isEmpty()
					|| product.getImg().trim().isEmpty() || product.getPrice() == 0) {
				m.addAttribute("message", "Vui lòng nhập đầy đủ thông tin");
				m.addAttribute("ProductID",product.getProductID());
				return "redirect:/showupdate1";
			}
			product.setStatus(1);
			product.setImg("/spring-demo/resources/image/" + product.getImg());
			productService.saveOrUpdate(product);

			return "redirect:/listA";
		}
	}
	//save vào hàng chờ 
	@PostMapping("/saveAdd")
	public String addNewProduct(@ModelAttribute(name = "productForm") Addproduct product, BindingResult result, Model m,
			HttpSession session) {
		if (session.getAttribute("accA") == null ) {
			m.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		} else {
			if (product.getProductnameA().trim().isEmpty() || product.getDescriptionA().trim().isEmpty()|| product.getSoluong()==0
					|| product.getImgA().trim().isEmpty() || product.getPriceA() == 0) {
				m.addAttribute("message", "Vui lòng nhập đầy đủ thông tin");
				return "add";
			}
			product.setImgA("/resources/image/" + product.getImgA());
			productService.saveOrUpdateAddproduct(product);
			m.addAttribute("messages", "bài viết bạn đã vào hàng chờ phê duyệt!");
			return "add";
		}
	}
	
//save account

	
	@GetMapping("/delete")
	public String delete(@RequestParam(name = "ProductID") int productId ,@RequestParam(name="AccountID") int AccountID,Model m) {
	System.out.println("productId=" + productId);
	productService.delete(productId);
	m.addAttribute("AccountID",AccountID);
		return "loading";
	}
//
//	@RequestMapping("/update/{id}")
//	public String update(@PathVariable(name = "id") long productId, Model model) {
//		Product product = productService.findById(productId);
//		model.addAttribute("productForm", product);
//		return "newProduct";
//	}
	//search by cateogoryID
	@GetMapping("/searchByCat")
	public String searchByCategory(@RequestParam("cid") int cid, HttpSession session ,@RequestParam(defaultValue = "1") Integer page,Model model) {
		System.out.println(cid);
		PageAble pageAble = new PageAble(page);
		model.addAttribute("cid",cid);
		List<Product> productnew = productService.findNew(pageAble);	
		List<Product> products = productService.SearchByCateogory(cid,pageAble);
		model.addAttribute("newp",productnew);
		model.addAttribute("product", products);
		model.addAttribute("totalPages", productService.totalPagescateo(cid,pageAble));
		model.addAttribute("currentPage", page);
		return "searchbycat";
	}
	// show man hinh detail
    @GetMapping("/detail")
    public String detailpage(@RequestParam("pid") int ProductID  ,Model m  ) {
        Product products = productService.findById(ProductID);
        Account accountD = accountService.findAccById(products.getAccountID()); 
        String datas = comSe.findAllComment( ProductID);
        m.addAttribute("comDto", datas);
        m.addAttribute("product",products);
        m.addAttribute("accountD", accountD);
        
        return "detail";
    }
    
    
    //donhang
    @GetMapping("/donhang")
    public String donhangpage(@RequestParam("bid") int bid ,Model m  ) {
        buy buy = accountService.findcart(bid); 
        m.addAttribute("buy",buy);
        Account accB = accountService.findAccById(buy.getSelerID());
		Product prob = productService.findById(buy.getProductID());	
		m.addAttribute("accb",accB);
		m.addAttribute("image",prob);
        return "bill";
    }
    
    //buy
    @GetMapping("/buy")
    public String buypage(@RequestParam("pid") int ProductID  ,Model m ,HttpSession session ) {
    	if (session.getAttribute("accA") == null ) {
			m.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		}else {
        Product products = productService.findById(ProductID);
        Account ac =accountService.findAccById(products.getAccountID());
        m.addAttribute("productbuy",products);
        m.addAttribute("ac",ac);
        
        
        return "buy";
    }
    }
    @PostMapping("/savebuy")
    public String savebuy(@ModelAttribute( name = "buyForm" ) buy Buy ,@RequestParam("diachi") String diachi,BindingResult result,Model m ) {
    	System.out.println(Buy.getProductID());
    	System.out.println(Buy.getProductname());
    	System.out.println(Buy.getDiachi());
    		Account accB = accountService.findAccById(Buy.getSelerID());
    		Product prob = productService.findById(Buy.getProductID());	
    		prob.setStatus(prob.getStatus()- Buy.getSoluongmua());
    		productService.saveOrUpdate(prob);
    		productService.saveOrUpdateBuy(Buy);
    		m.addAttribute("buy",Buy);
    		m.addAttribute("accb",accB);
    		m.addAttribute("image",prob);
    	return "bill";
    }
    
    @GetMapping("/baidang")
    public String baidang(@RequestParam(name="AccountID") int AccountID , Model m,HttpSession session ) {
    	if (session.getAttribute("accA") == null ) {
			m.addAttribute("message", "vui lòng đăng nhập !");
			return "Login";
		}else{
			List<Product> products = productService.SearchByAccountID(AccountID);
			long count= productService.countproduct(AccountID);
    	m.addAttribute("products",products);
    	m.addAttribute("count",count);
    	return "baidang";
    }
    }
   
}
