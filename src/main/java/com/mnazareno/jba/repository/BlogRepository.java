package com.mnazareno.jba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mnazareno.jba.entity.Blog;

public interface BlogRepository extends JpaRepository<Blog, Integer> {

}
