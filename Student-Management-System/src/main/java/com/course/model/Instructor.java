package com.course.model;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import java.util.List;

@Entity
public class Instructor extends User {
    
    @OneToMany(mappedBy = "instructor")
    private List<CourseRegistration> courses;

    // Getter and setter for courses
    public List<CourseRegistration> getCourses() {
        return courses;
    }

    public void setCourses(List<CourseRegistration> courses) {
        this.courses = courses;
    }
}
