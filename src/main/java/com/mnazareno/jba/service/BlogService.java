package com.mnazareno.jba.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Service;

import com.mnazareno.jba.entity.Blog;
import com.mnazareno.jba.entity.User;
import com.mnazareno.jba.repository.BlogRepository;
import com.mnazareno.jba.repository.UserRepository;

@Service
public class BlogService {

	@Autowired
	private BlogRepository blogRepo;
	
	@Autowired
	private UserRepository userRepo;
	
	public void save(Blog blog, String name) {
		User user = userRepo.findByName(name);
		blog.setUser(user);
		blogRepo.save(blog);
	}

	@PreAuthorize("#blog.user.name == authentication.name or hasRole('ROLE_ADMIN')")
	public void delete(@P("blog") Blog id) {
		blogRepo.delete(id);
	}

	public Blog findOne(int id) {
		return blogRepo.findOne(id);
	}
}
