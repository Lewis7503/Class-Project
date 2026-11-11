CREATE DATABASE IF NOT EXISTS StudentDB;
USE StudentDB;
DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Student_Major;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Courses;
DROP TABLE IF EXISTS Major;

CREATE TABLE Students ( 
		student_id INT PRIMARY KEY,
    	first_name VARCHAR (45) NOT NULL,
    	last_name VARCHAR (45) NOT NULL,
    	email VARCHAR (100) unique NOT NULL
);

CREATE TABLE Courses (
	course_id INT PRIMARY KEY,
    	course_code INT UNIQUE NOT NULL,
    	course_name VARCHAR (45),
    	total_seats INT
);

CREATE TABLE Major (
	major_id INT PRIMARY KEY,
	major_name VARCHAR (45)
);

CREATE TABLE Enrollment (
	student_id INT,
    	course_id INT,
    	PRIMARY KEY (student_id,course_id),
    	FOREIGN KEY(student_id) REFERENCES Students(student_id),
    	FOREIGN KEY(course_id) REFERENCES Courses(course_id)
);

CREATE TABLE Student_Major (
	student_id INT PRIMARY KEY,
	major_id INT,
	FOREIGN KEY(student_id) REFERENCES Students(student_id),
	FOREIGN KEY(major_id) REFERENCES Major(major_id)
);
