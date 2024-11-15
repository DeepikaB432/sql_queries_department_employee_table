SELECT * FROM fsbootcamp2024_module_assesment.employees;
SELECT * FROM fsbootcamp2024_module_assesment.department;

-- Add a new column and foreign key constraint
alter table fsbootcamp2024_module_assesment.employees
	add department_id int not null;

alter table fsbootcamp2024_module_assesment.employees
	add FOREIGN KEY (department_id) REFERENCES department(ID);
    
-- Insert Data in both tables

INSERT INTO fsbootcamp2024_module_assesment.department(ID,name,department_namel) VALUES (1, 'HR', 'Human Resources');
INSERT INTO fsbootcamp2024_module_assesment.department(ID,name,department_namel) VALUES (2, 'FIN', 'Finance');
INSERT INTO fsbootcamp2024_module_assesment.department(ID,name,department_namel) VALUES (3, 'IT', 'information Technology');

INSERT INTO fsbootcamp2024_module_assesment.employees(ID,name,department_id) VALUES (1, 'Deepika Bansal',1);
INSERT INTO fsbootcamp2024_module_assesment.employees(ID,name,department_id) VALUES (2, 'George Smith',2);
INSERT INTO fsbootcamp2024_module_assesment.employees(ID,name,department_id) VALUES (3, 'John S',3);

-- add a salary column to employee table
alter table fsbootcamp2024_module_assesment.employees 
	ADD column salary INT NOT NULL default '10000';
    
-- delete data from employee table corresponding to department name
SET SQL_SAFE_UPDATES = 0;
DELETE FROM fsbootcamp2024_module_assesment.employees
WHERE department_id IN (SELECT ID FROM department);
SET SQL_SAFE_UPDATES = 1;

-- delete department table data
SET SQL_SAFE_UPDATES = 0;
DELETE FROM fsbootcamp2024_module_assesment.department;
SET SQL_SAFE_UPDATES = 1;
