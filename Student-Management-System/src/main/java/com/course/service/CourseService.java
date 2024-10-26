package com.course.service;

import com.course.model.CourseRegistration;
import com.course.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {

    @Autowired
    private CourseRepository courseRepository;

    public List<CourseRegistration> getAllCourses() {
        return courseRepository.findAll();
    }

    public void addCourse(CourseRegistration course) {
        courseRepository.save(course);
    }

    public CourseRegistration getCourseById(int courseNo) {
        return courseRepository.findById(courseNo).orElse(null);
    }

    public void updateCourse(CourseRegistration course) {
        courseRepository.save(course);
    }

    public void deleteCourse(int courseNo) {
        courseRepository.deleteById(courseNo);
    }
}
