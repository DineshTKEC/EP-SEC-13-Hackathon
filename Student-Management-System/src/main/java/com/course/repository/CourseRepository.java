package com.course.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.course.model.CourseRegistration;

public interface CourseRepository extends CrudRepository<CourseRegistration, Integer> {

	List<CourseRegistration> findAll();

}
