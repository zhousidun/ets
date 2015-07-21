package com.ets.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * StuResult entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "stu_result", catalog = "exam")
public class StuResult implements java.io.Serializable {

	// Fields

	private Integer id;
	private Paper paper;
	private Student student;
	private Integer resSingle;
	private Integer resMore;
	private Integer resTotal;
	private String joinTime;

	// Constructors

	/** default constructor */
	public StuResult() {
	}

	/** full constructor */
	public StuResult(Paper paper, Student student, Integer resSingle,
			Integer resMore, Integer resTotal, String joinTime) {
		this.paper = paper;
		this.student = student;
		this.resSingle = resSingle;
		this.resMore = resMore;
		this.resTotal = resTotal;
		this.joinTime = joinTime;
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
	@JoinColumn(name = "paper_id")
	public Paper getPaper() {
		return this.paper;
	}

	public void setPaper(Paper paper) {
		this.paper = paper;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "stu_id")
	public Student getStudent() {
		return this.student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	@Column(name = "res_single")
	public Integer getResSingle() {
		return this.resSingle;
	}

	public void setResSingle(Integer resSingle) {
		this.resSingle = resSingle;
	}

	@Column(name = "res_more")
	public Integer getResMore() {
		return this.resMore;
	}

	public void setResMore(Integer resMore) {
		this.resMore = resMore;
	}

	@Column(name = "res_total")
	public Integer getResTotal() {
		return this.resTotal;
	}

	public void setResTotal(Integer resTotal) {
		this.resTotal = resTotal;
	}

	@Column(name = "join_time", length = 20)
	public String getJoinTime() {
		return this.joinTime;
	}

	public void setJoinTime(String joinTime) {
		this.joinTime = joinTime;
	}

}