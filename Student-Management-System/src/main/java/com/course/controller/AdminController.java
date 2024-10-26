package com.course.controller;

import com.course.model.Instructor;
import com.course.model.Student;
import com.course.model.CourseRegistration;
import com.course.service.InstructorService;
import com.course.service.StudentService;
import com.course.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private InstructorService instructorService;

    @Autowired
    private CourseService courseService;

    @GetMapping
    public String adminDashboard() {
        return "admin/dashboard";
    }

    @GetMapping("/students")
    public String listStudents(Model model) {
        model.addAttribute("students", studentService.getAllStudents());
        return "admin/students";
    }

    @GetMapping("/instructors")
    public String listInstructors(Model model) {
        model.addAttribute("instructors", instructorService.getAllInstructors());
        return "admin/instructors";
    }

    @GetMapping("/courses")
    public String listCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "admin/courses";
    }

    @GetMapping("/addStudent")
    public String addStudentForm(Model model) {
        model.addAttribute("student", new Student());
        return "admin/addStudent";
    }

    @PostMapping("/addStudent")
    public String addStudent(Student student) {
        studentService.save(student);
        return "redirect:/admin/students";
    }

    @GetMapping("/addInstructor")
    public String addInstructorForm(Model model) {
        model.addAttribute("instructor", new Instructor());
        return "admin/addInstructor";
    }

    @PostMapping("/addInstructor")
    public String addInstructor(Instructor instructor) {
        instructorService.save(instructor);
        return "redirect:/admin/instructors";
    }

    @GetMapping("/addCourse")
    public String addCourseForm(Model model) {
        model.addAttribute("course", new CourseRegistration());
        model.addAttribute("instructors", instructorService.getAllInstructors());
        return "admin/addCourse";
    }

    @PostMapping("/addCourse")
    public String addCourse(CourseRegistration course) {
        courseService.addCourse(course);
        return "redirect:/admin/courses";
    }

    @GetMapping("/editCourse/{courseNo}")
    public String editCourseForm(@PathVariable int courseNo, Model model) {
        CourseRegistration course = courseService.getCourseById(courseNo);
        model.addAttribute("course", course);
        model.addAttribute("instructors", instructorService.getAllInstructors());
        return "admin/editCourse";
    }

    @PostMapping("/editCourse")
    public String editCourse(CourseRegistration course) {
        courseService.updateCourse(course);
        return "redirect:/admin/courses";
    }

    @GetMapping("/deleteCourse/{courseNo}")
    public String deleteCourse(@PathVariable int courseNo) {
        courseService.deleteCourse(courseNo);
        return "redirect:/admin/courses";
    }

    @GetMapping("/deleteInstructor/{id}")
    public String deleteInstructor(@PathVariable Long id) {
        instructorService.deleteInstructor(id);
        return "redirect:/admin/instructors";
    }
}
