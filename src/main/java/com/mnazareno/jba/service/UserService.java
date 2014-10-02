package com.mnazareno.jba.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mnazareno.jba.entity.Blog;
import com.mnazareno.jba.entity.Item;
import com.mnazareno.jba.entity.User;
import com.mnazareno.jba.repository.BlogRepository;
import com.mnazareno.jba.repository.ItemRepository;
import com.mnazareno.jba.repository.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Autowired
	private ItemRepository itemRepository;
	
	public List<User> findAll() {
		return userRepository.findAll();
	}

	public User findOne(int id) {
		return userRepository.findOne(id);
	}

	@Transactional
	public Object findOneWithBlogs(int id) {
		User user = findOne(id);
		List<Blog> blogs = blogRepository.findByUser(user);
		
		for (Blog blog : blogs) {
			List<Item> items = itemRepository.findByBlog(blog);
			blog.setItems(items);
		}
		
		user.setBlogs(blogs);
		
		return user;
	}
}
