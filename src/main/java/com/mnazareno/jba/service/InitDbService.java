package com.mnazareno.jba.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.PostConstruct;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.mnazareno.jba.entity.Blog;
import com.mnazareno.jba.entity.Item;
import com.mnazareno.jba.entity.Role;
import com.mnazareno.jba.entity.User;
import com.mnazareno.jba.repository.BlogRepository;
import com.mnazareno.jba.repository.ItemRepository;
import com.mnazareno.jba.repository.RoleRepository;
import com.mnazareno.jba.repository.UserRepository;

@Transactional
@Service
public class InitDbService {
	
	@Autowired
	private RoleRepository roleRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	@PostConstruct
	public void init() {
		if (roleRepository.findByName("ROLE_ADMIN") == null) {
			Role roleUser = new Role();
			roleUser.setName("ROLE_USER");
			roleRepository.save(roleUser);
			
			Role roleAdmin = new Role();
			roleAdmin.setName("ROLE_ADMIN");
			roleRepository.save(roleAdmin);
			
			User userAdmin = new User();
			userAdmin.setName("admin");
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			userAdmin.setPassword(encoder.encode("admin"));
			userAdmin.setEnabled(true);
			List<Role> roles = new ArrayList<Role>();
			roles.add(roleAdmin);
			roles.add(roleUser);
			userAdmin.setRoles(roles);
			userRepository.save(userAdmin);
			
			Blog blog = new Blog();
			blog.setName("JavaVids");
			blog.setUrl("http://feeds.feedburner.com/javavids?format=xml");
			blog.setUser(userAdmin);
			blogRepository.save(blog);
			
//			Item item1 = new Item();
//			item1.setBlog(blog);
//			item1.setTitle("first");
//			item1.setLink("http://www.javavids.com");
//			item1.setPublishedDate(new Date());
//			itemRepository.save(item1);
//			
//			Item item2 = new Item();
//			item2.setBlog(blog);
//			item2.setTitle("second");
//			item2.setLink("http://www.javavids.com");
//			item2.setPublishedDate(new Date());
//			itemRepository.save(item2);
//			
//			Item item3 = new Item();
//			item3.setBlog(blog);
//			item3.setTitle("three");
//			item3.setLink("http://www.javavids.com");
//			item3.setPublishedDate(new Date());
//			itemRepository.save(item3);
//			
//			Item item4 = new Item();
//			item4.setBlog(blog);
//			item4.setTitle("four");
//			item4.setLink("http://www.javavids.com");
//			item4.setPublishedDate(new Date());
//			itemRepository.save(item4);
//			
//			Item item5 = new Item();
//			item5.setBlog(blog);
//			item5.setTitle("five");
//			item5.setLink("http://www.javavids.com");
//			item5.setPublishedDate(new Date());
//			itemRepository.save(item5);
//			
//			Item item6 = new Item();
//			item6.setBlog(blog);
//			item6.setTitle("six");
//			item6.setLink("http://www.javavids.com");
//			item6.setPublishedDate(new Date());
//			itemRepository.save(item6);
		}
	}
}
