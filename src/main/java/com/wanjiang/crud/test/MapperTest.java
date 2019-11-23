package com.wanjiang.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.wanjiang.crud.bean.ClassName;
import com.wanjiang.crud.bean.Student;
import com.wanjiang.crud.dao.ClassNameMapper;
import com.wanjiang.crud.dao.StudentMapper;

/**
 * 测试dao层的工作
 * @author lfy
 *推荐Spring的项目就可以使用Spring的单元测试，可以自动注入我们需要的组件
 *1、导入SpringTest模块
 *2、@ContextConfiguration指定Spring配置文件的位置
 *3、直接autowired要使用的组件即可
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:/applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	ClassNameMapper classNameMapper;
	
	@Autowired
	StudentMapper studentMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * 测试DepartmentMapper
	 */
	@Test
	public void testCRUD(){
	    //1、创建SpringIOC容器
		/*ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		//2、从容器中获取mapper
		ClassNameMapper bean = ioc.getBean(ClassNameMapper.class);*/
		System.out.println(classNameMapper);
		
		//1、插入几个部门
//		classNameMapper.insertSelective(new ClassName(3, "开发部"));
//		classNameMapper.insertSelective(new ClassName(4, "测试部"));
		
		//2、生成员工数据，测试员工插入
//		studentMapper.insertSelective(new Student(1, 1, "Jerry@atguigu.com", "M", 23, "wanjaing"));
		
		//3、批量插入多个员工；批量，使用可以执行批量操作的sqlSession。
		
		StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
		for(int i = 1001;i<100000;i++){
			if (i==1) {
				continue;
			}
			String uid = UUID.randomUUID().toString().substring(0,5)+i;
			mapper.insertSelective(new Student(i, 1, "wanjiang" + i + "@bonc.con.com", "F", 23, "wanjaing" + i));
		}
		System.out.println("批量完成");
		
	}

}
