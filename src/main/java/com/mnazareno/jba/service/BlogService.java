package com.mnazareno.jba.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.mnazareno.jba.entity.Blog;
import com.mnazareno.jba.entity.Item;
import com.mnazareno.jba.entity.User;
import com.mnazareno.jba.exception.RssException;
import com.mnazareno.jba.repository.BlogRepository;
import com.mnazareno.jba.repository.ItemRepository;
import com.mnazareno.jba.repository.UserRepository;

@Service
public class BlogService {

	@Autowired
	private BlogRepository blogRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	@Autowired
	private RssService rssService;
	
	@Autowired
	private ItemRepository itemRepo;
	
	public void saveItems(Blog blog) {
		try {
			List<Item> items = rssService.getItems(blog.getUrl());
			for (Item item : items) {
				Item savedItem = itemRepo.findByBlogAndLink(blog, item.getLink());
				if (savedItem == null) {
					item.setBlog(blog);
					itemRepo.save(item);
				}
			}
		} catch (RssException e) {
			e.printStackTrace();
		}
	}
	
	public void save(Blog blog, String name) {
		User user = userRepo.findByName(name);
		blog.setUser(user);
		blogRepo.save(blog);
		saveItems(blog);
	}

	@PreAuthorize("#blog.user.name == authentication.name or hasRole('ROLE_ADMIN')")
	public void delete(@P("blog") Blog id) {
		blogRepo.delete(id);
	}

	public Blog findOne(int id) {
		return blogRepo.findOne(id);
	}
}
