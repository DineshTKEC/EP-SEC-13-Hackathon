package com.course.controller;

import com.course.service.CourseService;
import com.course.service.StudentService;
import com.course.model.CourseRegistration;
import com.course.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private StudentService studentService;

    @GetMapping("/")
    public String home() {
        return "Home";
    }

    @GetMapping("/viewAllCourses")
    public String viewAllCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "viewAllCourses";
    }

    @GetMapping("/student/registerCourse")
    public String registerCourseForm(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        model.addAttribute("students", studentService.getAllStudents());
        return "student/registerCourse";
    }

    @PostMapping("/student/registerCourse")
    public String registerCourse(@RequestParam("courseId") int courseId, @RequestParam("studentId") Long studentId) {
        CourseRegistration course = courseService.getCourseById(courseId);
        Student student = studentService.getStudentById(studentId);
        
        if (course != null && student != null) {
            studentService.registerStudentForCourse(student, course);
            return "redirect:/student/courses?success=true";
        } else {
            return "redirect:/student/registerCourse?error=true";
        }
    }
}
