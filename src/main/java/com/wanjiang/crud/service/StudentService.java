package com.wanjiang.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wanjiang.crud.bean.Student;
import com.wanjiang.crud.bean.StudentExample;
import com.wanjiang.crud.bean.StudentExample.Criteria;
import com.wanjiang.crud.dao.StudentMapper;

@Service
public class StudentService {
	
	@Autowired
	StudentMapper studentMapper;

	/**
	 * 查询所有学生信息
	 * @return
	 */
	public List<Student> getAll() {
		return studentMapper.selectByExampleWithCname(null);
	}

	/**
	 * 学生保存
	 * @param student
	 */
	public void saveStudent(Student student) {
		studentMapper.insertSelective(student);
	}

	public boolean checkStuName(String stuName) {
		StudentExample example = new StudentExample();
		Criteria criteria = example.createCriteria();
		criteria.andStuNameEqualTo(stuName);
		long count = studentMapper.countByExample(example);
		return count == 0;
	}

	/**
	 * 按照Id查询学生信息
	 * @param id
	 * @return
	 */
	public Student getStudent(Integer id) {
		return studentMapper.selectByPrimaryKey(id);
	}

	public void updateStudent(Student student) {
		studentMapper.updateByPrimaryKeySelective(student);
	}

	/**
	 * 学生删除
	 * @param id
	 */
	public void deleteStudent(Integer id) {
		studentMapper.deleteByPrimaryKey(id);
	}

	public void deleteBatch(List<Integer> id_str) {
		StudentExample example = new StudentExample();
		Criteria criteria = example.createCriteria();
		//delete from xxx where stu_id in(1,2,3,4)
		criteria.andStuIdIn(id_str);
		studentMapper.deleteByExample(example);
	}
}
