package com.ets.entity;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Lesson entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "lesson", catalog = "exam")
public class Lesson implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String joinTime;
	private List<Paper> papers = new ArrayList<Paper>(0);

	// Constructors

	/** default constructor */
	public Lesson() {
	}

	/** full constructor */
	public Lesson(String name, String joinTime, List<Paper> papers) {
		this.name = name;
		this.joinTime = joinTime;
		this.papers = papers;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", length = 60)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "join_time", length = 20)
	public String getJoinTime() {
		return this.joinTime;
	}

	public void setJoinTime(String joinTime) {
		this.joinTime = joinTime;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "lesson")
	public List<Paper> getPapers() {
		return this.papers;
	}

	public void setPapers(List<Paper> papers) {
		this.papers = papers;
	}

}