package com.baidu.service;

import java.util.List;

import com.baidu.entity.Student;

public interface StudentService {

	Object getcount(Student s);

	List<Student> listStudent(Student s);


	void dellAll(String ids);
	

}
