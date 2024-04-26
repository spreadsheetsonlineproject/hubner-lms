-- create users table
CREATE TABLE users (
    id BIGINT PRIMARY KEY NOT NULL,
    active BIT DEFAULT 1,
    deleted BIT DEFAULT 0,
    deleted_at DATETIME,
    badge_number NVARCHAR(40) UNIQUE,
    first_name NVARCHAR(60) NOT NULL,
    last_name NVARCHAR(60) NOT NULL,
    password NVARCHAR(MAX)
);

-- create sap placeholder table
CREATE TABLE production_orders (
    id INT PRIMARY KEY NOT NULL
);

-- create virtual assemblies table
CREATE TABLE virtual_handling_units (
    id INT PRIMARY KEY IDENTITY(1,1),
    active BIT DEFAULT 1
);

-- create applications
CREATE TABLE applications (
	id INT PRIMARY KEY IDENTITY(1,1),
	code_name NVARCHAR(20) NOT NULL,
	name NVARCHAR(120) NOT NULL,
	default_language NVARCHAR(10)
);

-- create workstations
CREATE TABLE workstations (
    id INT PRIMARY KEY IDENTITY(1,1),
	code_name NVARCHAR(20),
    name NVARCHAR(120),
    active BIT DEFAULT 1,
);

-- create application workstation links
CREATE TABLE application_workstation_links (
	application_id INT REFERENCES applications(id),
	workstation_id INT REFERENCES workstations(id),
	PRIMARY KEY (application_id, workstation_id)
);

-- create products table
CREATE TABLE products (
    id BIGINT PRIMARY KEY NOT NULL,
	production_order INT NOT NULL,
    active BIT DEFAULT 1,
    virtual_handling_unit_id INT REFERENCES virtual_handling_units(id),
	qa_status BIT,
    last_job_history INT,
	last_qa_history INT
);
CREATE INDEX idx_products_virtual_handling_unit_id ON products(virtual_handling_unit_id);
CREATE INDEX idx_products_production_order on products(production_order);

-- create product histories table
CREATE TABLE product_histories (
    id INT PRIMARY KEY IDENTITY(1,1),
    created_at DATETIMEOFFSET(7) DEFAULT GETUTCDATE(),
    created_by BIGINT REFERENCES users(id) NOT NULL,
    product_id BIGINT REFERENCES products(id) NOT NULL,
	workstation_id INT REFERENCES workstations(id),
	virtual_handling_unit_id_from INT REFERENCES virtual_handling_units(id),
	virtual_handling_unit_id_to INT REFERENCES virtual_handling_units(id),
	production_order_from INT,
	production_order_to INT
);

-- create jobs table
CREATE TABLE jobs (
    id INT PRIMARY KEY IDENTITY(1,1),
	code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(120) UNIQUE NOT NULL,
    description NVARCHAR(255),
    active BIT DEFAULT 1,
    disassemble BIT,
    create_product BIT
);

-- create qa reasons table
CREATE TABLE qa_reasons (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(120),
	description NVARCHAR(255),
	ok_status BIT DEFAULT 0,
    active BIT DEFAULT 1
);

-- create job items
CREATE TABLE product_history_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    job_id INT REFERENCES jobs(id) NOT NULL,
	product_history_id INT REFERENCES product_histories(id) NOT NULL,
    qa_reason_id INT REFERENCES qa_reasons(id),
	comment NVARCHAR(255)
);

-- create job and workstation links
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES workstations(id),
    job_id INT REFERENCES jobs(id),
    PRIMARY KEY (workstation_id, job_id)
);

-- create groups
CREATE TABLE groups (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(120) NOT NULL
);
CREATE INDEX idx_groups_code_name ON groups(code_name);

-- create group and job links
CREATE TABLE group_job_links (
    job_id INT REFERENCES jobs(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (job_id, group_id)
);

-- create user and group links
CREATE TABLE user_group_links (
    user_id BIGINT REFERENCES users(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (user_id, group_id)
);
