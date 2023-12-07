-- create users table
CREATE TABLE users (
    id BIGINT PRIMARY KEY NOT NULL,
    active BIT DEFAULT 1,
    deleted BIT DEFAULT 0,
    deleted_at DATETIME,
    email NVARCHAR(60) UNIQUE,
    badge_number NVARCHAR(20) UNIQUE,
    first_name NVARCHAR(60) NOT NULL,
    last_name NVARCHAR(60) NOT NULL
);

-- create production flow items for technology steps
CREATE TABLE flow_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(10) NOT NULL,
    active BIT DEFAULT 1
);
CREATE INDEX idx_flow_items_code_name on flow_items(code_name);

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

-- create jobs table
CREATE TABLE jobs (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(20) UNIQUE NOT NULL,
    description NVARCHAR(255),
    active BIT DEFAULT 1,
    flow_item_id INT REFERENCES flow_items(id) NOT NULL,
    permission_id INT REFERENCES permissions(id) NOT NULL
);
CREATE INDEX idx_jobs_flow_item_id on jobs(flow_item_id);

-- create job items
CREATE TABLE job_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    job_id INT REFERENCES jobs(id) NOT NULL,
    description NVARCHAR(255),
    created_by INT REFERENCES users(id) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);
CREATE INDEX idx_job_items_job_id ON job_items(job_id);

-- create workstations
CREATE TABLE workstations (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(60),
    active BIT DEFAULT 1,
);

-- create job and workstation links
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES workstations(id),
    job_id INT REFERENCES jobs(id),
    PRIMARY KEY (workstation_id, job_id)
);

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
    user_id INT REFERENCES users(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (user_id, group_id)
);

-- create severity levels for qa reasons
CREATE TABLE severity_levels (
    id INT PRIMARY KEY IDENTITY(1,1),
    value INT NOT NULL,
    allow_product_usage BIT NOT NULL
);

-- create qa reasons table
CREATE TABLE qa_reasons (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(20),
    active BIT DEFAULT 1,
    severity_level_id INT NOT NULL,
    FOREIGN KEY (severity_level_id) REFERENCES severity_levels(id)
);
CREATE INDEX idx_qa_reasons_code_name ON qa_reasons(code_name);

-- create the qa items field
CREATE TABLE qa_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    description NVARCHAR(255) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    created_by INT REFERENCES users(id) NOT NULL,
    qa_reason_id INT REFERENCES qa_reasons(id) NOT NULL
);

-- create sap placeholder table
CREATE TABLE sap_production_orders (
    id INT PRIMARY KEY IDENTITY(1,1),
    po_number NVARCHAR(20) UNIQUE NOT NULL
);

-- create virtual assemblies table
CREATE TABLE virtual_assemblies (
    id INT PRIMARY KEY IDENTITY(1,1),
    active BIT DEFAULT 1,
    qa_reason_id INT REFERENCES qa_reasons(id)
);

-- create products table
CREATE TABLE products (
    id BIGINT PRIMARY KEY NOT NULL,
    po_number NVARCHAR(10) NOT NULL,
    active BIT DEFAULT 1,
    sap_production_order_id INT REFERENCES sap_production_orders(id),
    virtual_assembly_id INT REFERENCES virtual_assemblies(id),
    qa_reason_id INT REFERENCES qa_reasons(id)
);
CREATE INDEX idx_products_po_number ON products(po_number);

-- create product histories table
CREATE TABLE product_histories (
    id INT PRIMARY KEY IDENTITY(1,1),
    created_at DATETIME DEFAULT GETDATE(),
    created_by INT REFERENCES users(id) NOT NULL,
    qa_item_id INT REFERENCES qa_items(id),
    job_item_id INT REFERENCES job_items(id) NOT NULL,
    product_id INT REFERENCES products(id) NOT NULL
);

-- create product and virtual assembly connection
CREATE TABLE product_virtual_assembly_links (
    product_id INT REFERENCES products(id),
    virtual_assembly_id INT REFERENCES virtual_assemblies(id),
    active BIT DEFAULT 1,
    PRIMARY KEY (product_id, virtual_assembly_id)
);
CREATE INDEX idx_product_virtual_assembly_links_product_id ON
    product_virtual_assembly_links(product_id);
CREATE INDEX idx_product_virtual_assembly_links_virtual_assembly_id ON
    product_virtual_assembly_links(virtual_assembly_id);