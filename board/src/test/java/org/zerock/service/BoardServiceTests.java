package org.zerock.service;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {
	@Setter(onMethod_ = {@Autowired})
	private BoardService service;
	
	@Test
	public void testExists() {
		log.info(service);
		log.info("hhhhhhhhhhhhhhhhh");
		assertNotNull(service);
	}
	@Test
	public void testRegis() {
		BoardVO b = new BoardVO();
		b.setTitle("xxx");
		b.setContent("ccc");
		b.setWriter("mmm");
		service.register(b);
		log.info("new num:"+b.getBno());
	}
	@Test
	public void testL() {
		service.getList(new Criteria(2,10)).forEach(b -> log.info(b));
	}
	@Test
	public void testRead() {
		log.info(service.get(2L));
	}
	@Test
	public void testDel() {
		log.info(service.remove(1L));
	}
}
