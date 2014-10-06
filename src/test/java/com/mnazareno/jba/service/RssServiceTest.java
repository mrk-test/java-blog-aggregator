package com.mnazareno.jba.service;

import static org.junit.Assert.*;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.mnazareno.jba.entity.Item;
import com.mnazareno.jba.exception.RssException;

public class RssServiceTest {
	
	private RssService rssService;

	@Before
	public void setUp() throws Exception {
		rssService = new RssService();
	}

	@Test
	public void testGetItemsFile() throws RssException {
		List<Item> items = rssService.getItems(new File("test-rss/javavids.xml"));
		assertEquals(10, items.size());
		
		Item first = items.get(0);
		assertEquals("How to solve Source not found error during debug in Eclipse", first.getTitle());
	
		assertEquals("23 Jun 2014 04:35:49", new SimpleDateFormat("dd MMM yyyy HH:mm:ss").format(first.getPublishedDate()));
	}

}
