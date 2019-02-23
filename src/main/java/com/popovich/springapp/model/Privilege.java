package com.popovich.springapp.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import javax.persistence.*;


@Entity
@Table(name = "privileges")
@Getter
@Setter
@ToString
public class Privilege extends BaseEntity{

    @Column(name = "privilege_name", nullable = false)
    private String name;


    @ManyToOne()
    @JoinColumn(name = "role_id", nullable = false)
    private Role role;
}
