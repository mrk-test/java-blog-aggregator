package com.mnazareno.jba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mnazareno.jba.entity.Blog;
import com.mnazareno.jba.entity.User;

public interface BlogRepository extends JpaRepository<Blog, Integer> {
	List<Blog> findByUser(User user);
}
