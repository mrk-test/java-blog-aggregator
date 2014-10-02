package com.mnazareno.jba.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mnazareno.jba.entity.Blog;
import com.mnazareno.jba.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {
	List<Item> findByBlog(Blog blog);
}
