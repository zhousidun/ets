package com.ets.entity;

import java.util.*;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Paper entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "paper", catalog = "exam")
public class Paper implements java.io.Serializable {

	// Fields

	private Integer id;
	private Lesson lesson;
	private String name;
	private String joinTime;
	private List<Question> questions = new ArrayList<Question>(0);
	private List<StuResult> stuResults = new ArrayList<StuResult>(0);

	// Constructors

	/** default constructor */
	public Paper() {
	}

	/** full constructor */
	public Paper(Lesson lesson, String name, String joinTime,
			List<Question> questions, List<StuResult> stuResults) {
		this.lesson = lesson;
		this.name = name;
		this.joinTime = joinTime;
		this.questions = questions;
		this.stuResults = stuResults;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "lesson_id")
	public Lesson getLesson() {
		return this.lesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}

	@Column(name = "name", length = 50)
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "paper")
	public List<Question> getQuestions() {
		return this.questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "paper")
	public List<StuResult> getStuResults() {
		return this.stuResults;
	}

	public void setStuResults(List<StuResult> stuResults) {
		this.stuResults = stuResults;
	}

}