package com.course.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Student extends User {
    @ManyToMany
    @JoinTable(
        name = "student_course",
        joinColumns = @JoinColumn(name = "student_id"),
        inverseJoinColumns = @JoinColumn(name = "course_id")
    )
    private List<CourseRegistration> courses = new ArrayList<>();

    public List<CourseRegistration> getCourses() {
        return courses;
    }

    public void setCourses(List<CourseRegistration> courses) {
        this.courses = courses;
    }
}
