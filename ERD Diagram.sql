-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/UJqbeA
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Modify this code to update the DB schema diagram.
-- To reset the sample schema, replace everything with
-- two dots ('..' - without quotes).

CREATE TABLE "Employee_Titles" (
    "Title_id" string   NOT NULL,
    "Title" string   NOT NULL
);

CREATE TABLE "Employees" (
    "employee_no" int   NOT NULL,
    "Title_id" string   NOT NULL,
    "Birthdate" datetime   NOT NULL,
    "First_Name" string   NOT NULL,
    "Last_Name" string   NOT NULL,
    "Sex" string   NOT NULL,
    "Hire_date" datetime   NOT NULL
);

CREATE TABLE "Departments" (
    "Dept_number" string   NOT NULL,
    "Dept_name" string   NOT NULL
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "Salary" (
    "employee_no" int   NOT NULL,
    "Salary" money   NOT NULL
);

CREATE TABLE "Dept_Manager" (
    "Dept_number" string   NOT NULL,
    "employee_no" int   NOT NULL
);

CREATE TABLE "Dept_Employee" (
    "employee_no" int   NOT NULL,
    "Dept_number" string   NOT NULL
);

CREATE INDEX "idx_Employee_Titles_Title_id"
ON "Employee_Titles" ("Title_id");

