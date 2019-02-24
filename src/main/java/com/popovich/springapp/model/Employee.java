package com.popovich.springapp.model;

import javax.persistence.*;
import java.util.Date;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "employees")
@Getter
@Setter
@ToString
public class Employee extends BaseEntity {
    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "last_name", nullable = false)
    private String lastName;

    @Column(name = "salary", nullable = false)
    private Integer salary;

    @ManyToOne
    @JoinColumn(name = "department_id", nullable = false)
    private Department department;

    @DateTimeFormat(pattern = "MM-dd-yyyy")
    @Column(name = "date_of_birth", nullable = false)
    private Date dateOfBirth;

    @Column(name = "date_of_employment", nullable = false)
    private Date dateOfEmployment;

    @Transient
    private String departmentName;
}
