-- Create departments table
CREATE TABLE "departments" (
    "dept_no" varchar NOT NULL,
    "dept_name" varchar NOT NULL,
    PRIMARY KEY ("dept_no")
);

-- Create dept_emp table
CREATE TABLE "dept_emp" (
    "emp_no" int NOT NULL,
    "dept_no" varchar NOT NULL,
    PRIMARY KEY ("emp_no", "dept_no")
);

-- Create dept_manager table
CREATE TABLE "dept_manager" (
    "dept_no" varchar NOT NULL,
	"emp_no" int NOT NULL,
    PRIMARY KEY ("emp_no", "dept_no")
);

-- Create employees table next
CREATE TABLE "employees" (
    "emp_no" int NOT NULL,
    "emp_title_id" varchar NOT NULL,
    "birth_date" date NOT NULL,
    "first_name" varchar NOT NULL,
    "last_name" varchar NOT NULL,
    "sex" varchar NOT NULL,
    "hire_date" date NOT NULL,
    PRIMARY KEY ("emp_no")
);

-- Create salaries table
CREATE TABLE "salaries" (
    "emp_no" int NOT NULL,
    "salary" int NOT NULL,
    PRIMARY KEY ("emp_no")
);

CREATE TABLE "titles" (
    "title_id" varchar NOT NULL,
    "title" varchar NOT NULL,
    PRIMARY KEY ("title_id")
);

-- Adding relationship between dept_emp to departments and employees

ALTER TABLE dept_emp
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

-- Adding relationship between dept_manager and employees

ALTER TABLE dept_manager
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

-- Adding relationship between salaires and employees

ALTER TABLE salaries
ADD FOREIGN KEY (emp_no) REFERENCES employees(emp_no);

-- Adding relationship between employees and titles

ALTER TABLE employees
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);