package com.mnazareno.jba.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.mnazareno.jba.entity.Item;
import com.mnazareno.jba.repository.ItemRepository;

@Service
public class ItemService {
	@Autowired
	private ItemRepository itemRepo;
	
	public List<Item> getItems() {
		return itemRepo.findAll(new PageRequest(0, 20, Direction.DESC, "publishedDate")).getContent();
	}
}
