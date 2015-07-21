package com.ets.entity;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Student entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "student", catalog = "exam")
public class Student implements java.io.Serializable {

	// Fields

	private String id;
	private String name;
	private String pwd;
	private String sex;
	private String joinTime;
	private String question;
	private String answer;
	private String profession;
	private String cardNo;
	private Set<StuResult> stuResults = new HashSet<StuResult>(0);

	// Constructors

	/** default constructor */
	public Student() {
	}

	/** minimal constructor */
	public Student(String id) {
		this.id = id;
	}

	/** full constructor */
	public Student(String id, String name, String pwd, String sex,
			String joinTime, String question, String answer, String profession,
			String cardNo, Set<StuResult> stuResults) {
		this.id = id;
		this.name = name;
		this.pwd = pwd;
		this.sex = sex;
		this.joinTime = joinTime;
		this.question = question;
		this.answer = answer;
		this.profession = profession;
		this.cardNo = cardNo;
		this.stuResults = stuResults;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 16)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Column(name = "name", length = 20)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "pwd", length = 20)
	public String getPwd() {
		return this.pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	@Column(name = "sex", length = 2)
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "join_time", length = 20)
	public String getJoinTime() {
		return this.joinTime;
	}

	public void setJoinTime(String joinTime) {
		this.joinTime = joinTime;
	}

	@Column(name = "question", length = 50)
	public String getQuestion() {
		return this.question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Column(name = "answer", length = 50)
	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Column(name = "profession", length = 30)
	public String getProfession() {
		return this.profession;
	}

	public void setProfession(String profession) {
		this.profession = profession;
	}

	@Column(name = "cardNo", length = 18)
	public String getCardNo() {
		return this.cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "student")
	public Set<StuResult> getStuResults() {
		return this.stuResults;
	}

	public void setStuResults(Set<StuResult> stuResults) {
		this.stuResults = stuResults;
	}

}