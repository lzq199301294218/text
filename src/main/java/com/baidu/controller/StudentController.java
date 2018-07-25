package com.baidu.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.baidu.entity.Student;
import com.baidu.service.StudentService;

@Controller
public class StudentController {
	@Autowired
	private StudentService ss;
	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> listStudnet(Student s){
		s.setPage((s.getPage()-1)*s.getRows());
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("total", ss.getcount(s));
		map.put("rows", ss.listStudent(s));
		return map;
	}
	@RequestMapping("/delAll")
	@ResponseBody
	public boolean delAll(String ids){
		try {
			ss.dellAll(ids);
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
