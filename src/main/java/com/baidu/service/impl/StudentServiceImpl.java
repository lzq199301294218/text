package com.baidu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.baidu.entity.Student;
import com.baidu.mapper.StudentMapper;
import com.baidu.service.StudentService;
@Service
public class StudentServiceImpl implements StudentService{
	@Autowired
	private StudentMapper sm;
	@Override
	public Object getcount(Student s) {
		return sm.getcount(s);
	}

	@Override
	public List<Student> listStudent(Student s) {
		return sm.listStudent(s);
	}

	@Override
	public void dellAll(String ids) {
			sm.dellAll(ids);
	}

}
