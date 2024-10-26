package com.course.service;

import com.course.model.Student;
import com.course.model.CourseRegistration;
import com.course.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentService {

    @Autowired
    private StudentRepository studentRepository;

    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    public Student save(Student student) {
        return studentRepository.save(student);
    }

    public Student getStudentById(Long id) {
        return studentRepository.findById(id).orElse(null);
    }

    public void registerStudentForCourse(Student student, CourseRegistration course) {
        student.getCourses().add(course);
        course.getStudents().add(student);
        studentRepository.save(student);
    }
}
