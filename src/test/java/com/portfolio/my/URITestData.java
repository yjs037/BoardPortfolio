package com.portfolio.my;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.board.dao.BoardDao;

public class URITestData {
	private static final Logger logger = LoggerFactory.getLogger(BoardDao.class);
	
	@Test
	public void uriTest() {
		int page = 6;
		int perPageNum = 10;
		
		UriComponents uriComponets = UriComponentsBuilder.newInstance()
				.path("/board/listPage")
				.queryParam("page", page)
				.queryParam("perPageNum", perPageNum)
				.build();
		
		String uri = "/board/listPage?page=" + page + "&perPageNum=" + perPageNum;
		
		logger.info(uri);
		logger.info(uriComponets.toString());
		
		assertEquals(uri, uriComponets.toString());
	}

}
