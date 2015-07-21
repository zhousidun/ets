DROP TABLE IF EXISTS lesson;
CREATE TABLE lesson (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(60) DEFAULT NULL,
  join_time varchar(20) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS manager;
CREATE TABLE manager (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(30) DEFAULT NULL,
  PWD varchar(30) DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS question;
CREATE TABLE question (
  id int(11) NOT NULL AUTO_INCREMENT,
  subject varchar(100) DEFAULT NULL,
  type char(1) DEFAULT NULL,
  join_time varchar(20) DEFAULT NULL,
  paper_id int(11) DEFAULT NULL,
  optionA varchar(50) DEFAULT NULL,
  optionB varchar(50) DEFAULT NULL,
  optionC varchar(50) DEFAULT NULL,
  optionD varchar(50) DEFAULT NULL,
  answer varchar(10) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (paper_id) REFERENCES paper(id)
  ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS paper;
CREATE TABLE paper (
  id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(50) DEFAULT NULL,
  lesson_id int(11) DEFAULT NULL,
  join_time varchar(20) DEFAULT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (lesson_id) REFERENCES lesson(id) 
  ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF exists STUDENT;
CREATE TABLE student (
  id varchar(16) PRIMARY KEY,
  name varchar(20) DEFAULT NULL,
  pwd varchar(20) DEFAULT NULL,
  sex varchar(2) DEFAULT NULL,
  join_time varchar(20) DEFAULT NULL,
  question varchar(50) DEFAULT NULL,
  answer varchar(50) DEFAULT NULL,
  profession varchar(30) DEFAULT NULL,
  cardNo varchar(18) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

drop table if exists stu_result;
CREATE TABLE stu_result (
  id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  stu_id varchar(16) DEFAULT NULL,
  paper_id int(11) DEFAULT NULL,
  res_single int(3) DEFAULT NULL,
  res_more int(3) DEFAULT NULL,
  res_total int(3) DEFAULT NULL,
  join_time varchar(20) DEFAULT NULL,
  FOREIGN KEY (paper_id) REFERENCES paper(id) 
  ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY (stu_id) REFERENCES student(id) 
  ON UPDATE CASCADE ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;