package com.course.controller;

import com.course.model.CourseRegistration;
import com.course.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/instructor")
public class InstructorController {

    @Autowired
    private CourseService courseService;

    @GetMapping
    public String instructorDashboard() {
        return "instructor/dashboard";
    }

    @GetMapping("/courses")
    public String listCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "instructor/courses";
    }

    @GetMapping("/assignments")
    public String listAssignments() {
        // TODO: Implement assignment listing
        return "instructor/assignments";
    }
}
