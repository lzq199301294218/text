package com.baidu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.baidu.entity.Student;
@Mapper
public interface StudentMapper {

	List<Student> listStudent(Student s);

	Object getcount(Student s);

	void dellAll(String ids);

}
