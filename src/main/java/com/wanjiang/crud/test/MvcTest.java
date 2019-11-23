package com.wanjiang.crud.test;

import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.wanjiang.crud.bean.Student;

/**
 * 测试
 * 
 * @author wanjiang spring4测试的时候，需要servlet3.0的支持
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@WebAppConfiguration  
@ContextConfiguration(locations = { "classpath:applicationContext.xml",  
        "file:src/main/webapp/WEB-INF/dispatcherServlet-servlet.xml" }) 
public class MvcTest {

	// 传入springmvc的ioc容器，因为该注解只能传入ioc里已经具有的，并不能传入ioc本身，所以需要注解
	// @WebAppConfiguration 方可将ioc本身传入进来
	@Autowired
	WebApplicationContext context;

	// 虚拟mvc请求，获取道处理结果
	MockMvc mockMvc;

	@Before  
    public void initMokcMvc() {  
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();  
    } 

	@Test
	public void testPage() throws Exception {
		// 模拟请求拿到返回值
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/studentAll").param("pn", "10"))
				.andReturn();
		// 请求成功后，请求域中会后pegeInfo，我们可以去除pegeInfo进行校验
		MockHttpServletRequest request = result.getRequest();
		PageInfo pi = (PageInfo) request.getAttribute("pageInfo");
		if (pi != null){
			System.out.println("当前页码：" + pi.getPageNum());
			System.out.println("总页码：" + pi.getPages());
			System.out.println("总记录数：" + pi.getTotal());
			System.out.println("在页面需要连续现世的页码：");
			int[] num = pi.getNavigatepageNums();
			for (int i : num) {
				System.out.print(" " + i);
			}
			
			System.out.println("=======================================");
			
			// 获取学生信息
			List<Student> list = pi.getList();
			for (Student student : list) {
				System.out.println("ID:" + student.getStuId() + "===> Name:" + student.getStuName());
			}
		}
	}
}
