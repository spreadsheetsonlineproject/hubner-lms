-- create users table
CREATE TABLE users (
    id BIGINT PRIMARY KEY NOT NULL,
    active BIT DEFAULT 1,
    deleted BIT DEFAULT 0,
    deleted_at DATETIME,
    badge_number NVARCHAR(20) UNIQUE,
    first_name NVARCHAR(60) NOT NULL,
    last_name NVARCHAR(60) NOT NULL
);

-- create sap placeholder table
CREATE TABLE production_orders (
    id INT PRIMARY KEY NOT NULL,
    quantity INT,
);

-- create virtual assemblies table
CREATE TABLE virtual_assemblies (
    id INT PRIMARY KEY IDENTITY(1,1),
    active BIT DEFAULT 1,
    to_id INT
);

-- create products table
CREATE TABLE products (
    id BIGINT PRIMARY KEY NOT NULL,
    active BIT DEFAULT 1,
	production_order_id INT REFERENCES production_orders(id) NOT NULL,
    virtual_assembly_id INT REFERENCES virtual_assemblies(id),
    qa_ok_status BIT DEFAULT 1
);
CREATE INDEX idx_products_production_order_id ON products(production_order_id);
CREATE INDEX idx_products_virtual_assembly_id ON products(virtual_assembly_id);

-- create product histories table
CREATE TABLE product_histories (
    id INT PRIMARY KEY IDENTITY(1,1),
    created_at DATETIME DEFAULT GETDATE(),
    created_by BIGINT REFERENCES users(id) NOT NULL,
    product_id BIGINT REFERENCES products(id) NOT NULL
);
CREATE INDEX idx_product_histories_product_id on product_histories(product_id);

-- create jobs table
CREATE TABLE jobs (
    id INT PRIMARY KEY IDENTITY(1,1),
	code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(20) UNIQUE NOT NULL,
    description NVARCHAR(255),
    active BIT DEFAULT 1
);

-- create job items
CREATE TABLE job_product_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    job_id INT REFERENCES jobs(id) NOT NULL,
	product_history_id INT REFERENCES product_histories(id) NOT NULL,
	description NVARCHAR(255)
);

-- create qa reasons table
CREATE TABLE qa_reasons (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(20),
	description NVARCHAR(255),
	ok_status BIT DEFAULT 0,
    active BIT DEFAULT 1
);

-- create the qa items field
CREATE TABLE qa_product_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    qa_reason_id INT REFERENCES qa_reasons(id) NOT NULL,
	product_history_id INT REFERENCES product_histories(id) NOT NULL,
	description NVARCHAR(255)
);

-- create workstations
CREATE TABLE workstations (
    id INT PRIMARY KEY IDENTITY(1,1),
	code_name NVARCHAR(20),
    name NVARCHAR(60),
    active BIT DEFAULT 1,
);

-- create job and workstation links
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES workstations(id),
    job_id INT REFERENCES jobs(id),
    PRIMARY KEY (workstation_id, job_id)
);

-- create permissions table
CREATE TABLE permissions (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(60) NOT NULL
);
CREATE INDEX idx_permissions_code_name on permissions(code_name);

-- create groups
CREATE TABLE groups (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(60) NOT NULL
);
CREATE INDEX idx_groups_code_name ON groups(code_name);

-- create group and permission links
CREATE TABLE group_permission_links (
    group_id INT REFERENCES groups(id),
    permission_id INT REFERENCES permissions(id),
    PRIMARY KEY (group_id, permission_id)
);

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