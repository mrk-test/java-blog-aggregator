package com.mnazareno.jba.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mnazareno.jba.entity.Item;

public interface ItemRepository extends JpaRepository<Item, Integer> {

}
