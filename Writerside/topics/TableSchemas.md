# Schemas of the tables in the database

The schema of a table describes the different fields and gives an overview about
the usage of the table.

Every section describes a single table in the database. You are going to find
extra information about the tables.

SQL queries are also attached to this documentation with the index creation
queries as well.

## Users

Users table stores the individual's information. Only those people can make any
actions in the LMS system, who is member of the table, and they are in
**active** status. When the **deleted** field is set as true, as the active
status should set to false but that is not mandatory. This step just makes the
continuous development more stable.

> Hard delete of any record from this table is not recommended. Instead, use the
> soft delete by setting the **deleted** field to `true` and the **deleted_at**
> value to the time of deletion.

**Email** or **badge_number** fields are useful when an old user needs to be
activated again. This information gives the advantage of continuing the user
history over an inactive period of time.

> Table name:`users`

| Field name   | Key | Description                        | Type       | Default value | Required |
|--------------|:---:|------------------------------------|------------|:-------------:|:--------:|
| id           | PK  | Unique ID                          | Integer    |   sequence    |    N     |
| unique_id    |  -  | User's Data matrix number (Unique) | BigInteger |       -       |    Y     |
| active       |  -  | Allow user to take actions         | Bool       |     true      |    N     |
| deleted      |  -  | Deny any actions                   | Bool       |     false     |    N     |
| deleted_at   |  -  | Time of deletion                   | Timestamp  |       -       |    N     |
| email        |  -  | Email to identify person           | Varchar    |       -       |    Y     |
| badge_number |  -  | Employee id to identify person     | Varchar    |       -       |    Y     |
| first_name   |  -  | First name                         | Varchar    |       -       |    Y     |
| last_name    |  -  | First name                         | Varchar    |       -       |    Y     |

Indexes of the table should be the **unique_id**. This field is going to be the
most queried field in this table.

**MsSQL**

``` sql
CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
    unique_id BIGINT UNIQUE,
    active BIT DEFAULT 1,
    deleted BIT DEFAULT 0,
    deleted_at DATETIME,
    email NVARCHAR(MAX) NOT NULL,
    badge_number NVARCHAR(MAX) NOT NULL,
    first_name NVARCHAR(MAX) NOT NULL,
    last_name NVARCHAR(MAX) NOT NULL
);
CREATE INDEX idx_users_unique_id ON users(unique_id);
```

**Postgresql**

``` sql
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    unique_id BIGINT UNIQUE NOT NULL,
    active BOOLEAN DEFAULT true,
    deleted BOOLEAN DEFAULT false,
    deleted_at TIMESTAMP,
    email VARCHAR(255) NOT NULL,
    badge_number VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);
CREATE INDEX idx_users_unique_id ON users(unique_id);
```

## Production Flow items

Through the production, different orders require different steps to take. These
steps are defined by the production order. The instances of the table gives the
ability to track the technology steps and journey of a single product.

> Hard delete not recommended in this table. In case, the flow item is not
> used, the active field should be set to `false` value. Please note that
> the [jobs](#jobs) table has a foreign key to these items. That means the
> jobs where the deactivated flow item is member, should be deactivated as well.

*This is the table, where the flow of production can be followed.*
*Additional fields can make the tracking more precise.*

> Table name: `flow_items`

| Field name | Key | Description                | Type    | Default value | Required |
|------------|:---:|----------------------------|---------|:-------------:|:--------:|
| id         | PK  | Unique ID                  | Integer |   sequence    |    N     |
| code_name  |  -  | Codename of the flow item  | Varchar |       -       |    Y     |
| active     |  -  | Allow user to take actions | Bool    |     true      |    N     |

Indexing of the table can be made by the **code_name** field.

**MsSQL**

``` sql
CREATE TABLE flow_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(MAX) NOT NULL,
    active BIT DEFAULT 1
);
CREATE INDEX idx_code_name on flow_items(code_name);
```

**Postgresql**

``` sql
CREATE TABLE flow_items (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT true
);
CREATE INDEX idx_code_name on flow_items(code_name);
```

## Jobs

This table stores the available actions that the users can perform during the
production process. These jobs are small parts of the processes in production.
An entry in this table is the main definition of the job.

This is the place where the required permission is set on the specific job.

> Table name: `jobs`

| Field name                             | Key | Description                           | Type    | Default value | Required |
|----------------------------------------|:---:|---------------------------------------|---------|:-------------:|:--------:|
| id                                     | PK  | Unique ID                             | Integer |   sequence    |    N     |
| name                                   |  -  | Name of the job (Unique)              | Varchar |       -       |    Y     |
| description                            |  -  | Short description of the job          | Varchar |       -       |    N     |
| active                                 |  -  | Determine the availability of the job | Bool    |     true      |    N     |
| [flow_item_id](#production-flow-items) | FK  | Flow item made by this job            | Integer |       -       |    Y     |
| [permission_id](#permissions)          | FK  | Required permission                   | Integer |       -       |    Y     |

Querying the table is going to be made through the **id** field in most cases.
Sometimes the query will look for **flow_item_id** so indexing of these fields
should be helpful.

**MsSQL**

``` sql
CREATE TABLE jobs (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(MAX) UNIQUE NOT NULL,
    description NVARCHAR(MAX),
    active BIT DEFAULT 1,
    flow_item_id INT REFERENCES flow_items(id) NOT NULL,
    permission_id INT REFERENCES permissions(id) NOT NULL
);
CREATE INDEX idx_flow_item_id on jobs(flow_item_id);
```

**Postgresql**

``` sql
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) UNIQUE NOT NULL,
    description VARCHAR(255),
    active BOOLEAN DEFAULT true,
    flow_item_id INT REFERENCES flow_items(id) NOT NULL,
    permission_id INT REFERENCES permissions(id) NOT NULL
);
CREATE INDEX idx_flow_item_id on jobs(flow_item_id);
```

## Job Items

A single representation of a job. When the user takes any action in the
production that is represented by a [job](#jobs) item. This table stores details
of the taken actions not just the metadata of the job.

> Table name: `job_items`

| Field name           | Key | Description                   | Type      | Default value | Required |
|----------------------|:---:|-------------------------------|-----------|:-------------:|:--------:|
| id                   | PK  | Unique ID                     | Integer   |   sequence    |    -     |
| [job_id](#jobs)      | FK  | Job item id                   | Integer   |       -       |    Y     |
| description          |  -  | Short description by the user | Varchar   |       -       |    N     |
| [created_by](#users) | FK  | User id                       | Integer   |       -       |    Y     |
| created_at           |  -  | Time of creation              | Timestamp |      now      |    N     |

Indexing should be created on the **job_id** field. Most queries are going to
look for **id** or **job_id**.

**MsSQL**

``` sql
CREATE TABLE job_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    job_id INT REFERENCES jobs(id) NOT NULL,
    description NVARCHAR(MAX),
    created_by INT REFERENCES users(id) NOT NULL,
    created_at DATETIME DEFAULT GETDATE()
);
CREATE INDEX idx_job_items_job_id ON job_items(job_id);
```

**Postgresql**

``` sql
CREATE TABLE job_items (
    id SERIAL PRIMARY KEY,
    job_id INT REFERENCES jobs(id) NOT NULL,
    description VARCHAR(255),
    created_by INT REFERENCES users(id) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_job_items_job_id ON job_items(job_id);
```

## Workstations

A single workstation item in the database is a single place in the production
area where workers can do their jobs. Workstation can be described as a device
where users can open an LMS application. A workstation can perform multiple type
of [jobs](#jobs), that assigned to the workstation.

Workstation and job connections are going to be defined in
the [job_workstation_links](#job-and-workstation-links)

> Table name: `workstations`

| Field name | Key | Description                      | Type    | Default value | Required |
|------------|:---:|----------------------------------|---------|:-------------:|:--------:|
| id         | PK  | Unique ID                        | Integer |   sequence    |    N     |
| name       |  -  | Name of the workstation (Unique) | Varchar |       -       |    Y     |
| active     |  -  | Allow to use the workstation     | Bool    |     true      |    N     |

**MsSQL**

``` sql
CREATE TABLE workstations (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(MAX),
    active BIT DEFAULT 1,
);
```

**Postgresql**

``` sql
CREATE TABLE workstations(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    active BOOLEAN DEFAULT true
);
```

## Job and Workstation links

A single workstation can perform multiple jobs. This table is meant to create
the connection between jobs and workstations.

> Table name: `job_workstation_links`

| Field name                      |  Key   | Description                | Type    | Default value | Required |
|---------------------------------|:------:|----------------------------|---------|:-------------:|:--------:|
| [workstation_id](#workstations) | PK, FK | Id of the workstation      | Integer |       -       |    Y     |
| [job_id](#jobs)                 | PK, FK | Id of the job that allowed | Integer |       -       |    Y     |

**MsSQL**

``` sql
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES work_stations(id),
    job_id INT REFERENCES jobs(id),
    PRIMARY KEY (workstation_id, job_id)
);
```

**Postgresql**

``` sql
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES work_stations(id),
    job_id INT REFERENCES jobs(id),
    PRIMARY KEY (workstation_id, job_id)
);
```

## Permissions

Content of permissions table define the level of access when the user tries to
perform actions. Processes require different types of permissions. The checking
of the necessary permission is validated through
the [user_job_links](#group-and-job-links) table.

> Table name: `permissions`

| Field name | Key | Description                           | Type    | Default value | Required |
|------------|:---:|---------------------------------------|---------|:-------------:|:--------:|
| id         | PK  | Unique ID                             | Integer |   sequence    |    N     |
| code_name  |  -  | Short name of the permission (Unique) | Varchar |       -       |    Y     |
| name       |  -  | Detailed name of the permission       | Varchar |       -       |    N     |

**MsSQL**

``` sql
CREATE TABLE permissions (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(MAX) UNIQUE NOT NULL,
    name NVARCHAR(MAX) NOT NULL
);
CREATE INDEX idx_code_name on permissions(code_name);
```

**Postgresql**

``` sql
CREATE TABLE permissions (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL
);
CREATE INDEX idx_code_name on permissions(code_name);
```

> Recommended values:
> 1. `can_view`
> 2. `can_create`
> 3. `can_update`
> 4. `can_delete`
>
> Values above and their combinations can define any access level.

## Groups

Instance of the table represents multiple permissions grouped in one. This
allows to customize different access levels for different areas in the LMS
system.

> Table name: `groups`

| Field name | Key | Description                      | Type    | Default value | Required |
|------------|:---:|----------------------------------|---------|:-------------:|:--------:|
| id         | PK  | Unique ID                        | Integer |   sequence    |    N     |
| code_name  |  -  | Short name of the group (Unique) | Varchar |       -       |    Y     |
| name       |  -  | Detailed name of the group       | Varchar |       -       |    N     |

Indexing on **code_name** field is highly recommended.

**MsSQL**

``` sql
CREATE TABLE groups (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(MAX) UNIQUE NOT NULL,
    name NVARCHAR(MAX) NOT NULL
);
CREATE INDEX idx_groups_code_name ON groups(code_name);
```

**Postgresql**

``` sql
CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL
);
CREATE INDEX idx_groups_code_name ON groups(code_name);
```

## Group and Permission links

Define the connections between [groups](#groups) and [permissions](#permissions)
tables. With these links any access, role can be defined.

> Table name: `group_permission_links`

| Field name                    |  Key   | Description                       | Type    | Default value | Required |
|-------------------------------|:------:|-----------------------------------|---------|:-------------:|:--------:|
| [group_id](#groups)           | PK, FK | Id of the group                   | Integer |       -       |    Y     |
| [permission_id](#permissions) | PK, FK | Id of the permission that allowed | Integer |       -       |    Y     |

This table is going to be queried a lot. Creating index on both fields is done
by database server by default.

**MsSQL**

``` sql
CREATE TABLE group_permission_links (
    group_id INT REFERENCES groups(id),
    permission_id INT REFERENCES permissions(id),
    PRIMARY KEY (group_id, permission_id)
);
```

**Postgresql**

``` sql
CREATE TABLE group_permission_links (
    group_id INT REFERENCES groups(id),
    permission_id INT REFERENCES permissions(id),
    PRIMARY KEY (group_id, permission_id)
);
```

> For example
>
> There are rows in the [permissions](#permissions) table where the values are
>
> | id | code_name  | name                        |
> |----|------------|-----------------------------|
> | 1  | can_view   | User can view content       |
> | 2  | can_update | User can update content     |
> | 3  | can_delete | User can delete content     |
> | 4  | can_create | User can create new content |
>
> Some groups are defined in the [groups](#groups) table, like
>
> | id | code_name    | name                                   |
> |----|--------------|----------------------------------------|
> | 1  | default_user | Worker in the production               |
> | 2  | qa_inspector | QA reason can be modified by this user |
>
> Let's define the necessary permissions for these groups.
>
> | group_id | permission_id |
> |:--------:|:-------------:| 
> |    2     |       2       |
> |    2     |       4       |
> |    2     |       1       |
> |    1     |       4       |
> |    1     |       1       |
>
> This small sample table shows that the qa_inspector group is able to
> update a value in tables, but the default_user is allowed to create a new
> item. That would mean, if a user find some qa issue, they can register the
> problem, but not allowed to change a qa item. The quality inspector is
> able to change the status of the quality item.

## Group and Job links

This is the place, where jobs are going to be assigned for different groups. A
job can be assigned for multiple groups and group can have multiple jobs of
course.

> Table name: `group_job_links`

| Field name          |  Key   | Description         | Type    | Default value | Required |
|---------------------|:------:|---------------------|---------|:-------------:|:--------:|
| [job_id](#jobs)     | PK, FK | Job id              | Integer |       -       |    Y     |
| [group_id](#groups) | PK, FK | Permission group id | Integer |       -       |    Y     |

Required to create index on every field.

**MsSQL**

``` sql
CREATE TABLE group_job_links (
    job_id INT REFERENCES jobs(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (job_id, group_id)
);
```

**Postgresql**

``` sql
CREATE TABLE group_job_links (
    job_id INT REFERENCES jobs(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (job_id, group_id)
);
```

## User and Group Links

When a user become member of any groups than the user will have access to the
assigned jobs based on the permission level of the group.

> Table name: 'user_group_links'

| Field name          |  Key   | Description         | Type    | Default value | Required |
|---------------------|:------:|---------------------|---------|:-------------:|:--------:|
| [user_id](#users)   | PK, FK | User id             | Integer |       -       |    Y     |
| [group_id](#groups) | PK, FK | Permission group id | Integer |       -       |    Y     |

Indexing on both fields is required.

**MsSQL**

``` sql
CREATE TABLE user_group_links (
    user_id INT REFERENCES users(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (user_id, group_id)
);
```

**Postgresql**

``` sql
CREATE TABLE user_group_links (
    user_id INT REFERENCES users(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (user_id, group_id)
);
```

## Quality reasons

This table stores the available quality reason codes. These codes are going to
be used when the user inspect any product in the production.

> Table name: `qa_reasons`

| Field name                                         | Key | Description                          | Type    | Default value | Required |
|----------------------------------------------------|:---:|--------------------------------------|---------|:-------------:|:--------:|
| id                                                 | PK  | Unique ID                            | Integer |   sequence    |    N     |
| code_name                                          |  -  | Short name of the reason (Unique)    | Varchar |       -       |    Y     |
| name                                               |  -  | Descriptive name of the reason       | Varchar |       -       |    N     |
| active                                             |  -  | Allows to deactivate reason          | Bool    |     true      |    N     |
| [severity_level_id](#severity-level-of-qa-reasons) |  -  | Define the seriousness of the reason | Integer |       Y       |    Y     |

**MsSQL**

``` sql
CREATE TABLE qa_reasons (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(MAX) UNIQUE NOT NULL,
    name NVARCHAR(MAX),
    active BIT DEFAULT 1,
    severity_level_id INT NOT NULL,
    FOREIGN KEY (severity_level_id) REFERENCES severity_levels(id)
);
CREATE INDEX idx_qa_reasons_code_name ON qa_reasons(code_name);
```

**Postgresql**

``` sql
CREATE TABLE qa_reasons (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(255) UNIQUE NOT NULL,
    name VARCHAR(255),
    active BOOLEAN DEFAULT true,
    severity_level_id INT NOT NULL REFERENCES severity_levels(id)
);
CREATE INDEX idx_qa_reasons_code_name ON qa_reasons(code_name);
```

## Severity Level of QA reasons

Set a level to a qa reason item. Extending this table with different fields can
help building more sophisticated quality tracking system.

> Table name: `severity_levels`

| Field name          | Key | Description                                   | Type    | Default value | Required |
|---------------------|:---:|-----------------------------------------------|---------|:-------------:|:--------:|
| id                  | PK  | Unique ID                                     | Integer |   sequence    |    N     |
| value               |  -  | Integer value where the 1 is the most serious | Integer |       -       |    Y     |
| allow_product_usage |  -  | Allow to use the product production           | Bool    |       -       |    Y     |

**MsSQL**

``` sql
CREATE TABLE severity_levels (
    id INT PRIMARY KEY IDENTITY(1,1),
    value INT NOT NULL,
    allow_product_usage BIT NOT NULL
);
```

**Postgresql**

``` sql
create table severity_levels (
    id SERIAL PRIMARY KEY,
    value INT NOT NULL,
    allow_product_usage BOOLEAN NOT NULL
);
```

## QA items

Represent a quality check by the user. This is the point, where the product is
going to be marked with any quality reason. Other quality related tables are
contains metadata of the quality status. This table will provide more details
about the actual inspection.

> Table name: `qa_items`

| Field name                       | Key | Description                           | Type      | Default value | Required |
|----------------------------------|:---:|---------------------------------------|-----------|:-------------:|:--------:|
| id                               | PK  | Unique ID                             | Integer   |   sequence    |    N     |
| description                      |  -  | User description of the qa inspection | Varchar   |       -       |    Y     |
| created_at                       |  -  | Time of creation                      | Timestamp |      now      |    N     |
| [created_by](#users)             | FK  | User id                               | Integer   |       -       |    Y     |
| [qa_reason_id](#quality-reasons) | FK  | Quality reason item                   | Integer   |       -       |    Y     |

**MsSQL**

``` sql
CREATE TABLE qa_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    description NVARCHAR(MAX) NOT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    created_by INT REFERENCES users(id) NOT NULL,
    qa_reason_id INT REFERENCES qa_reasons(id) NOT NULL
);
```

**Postgresql**

``` sql
CREATE TABLE qa_items (
    id SERIAL PRIMARY KEY,
    description VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT REFERENCES users(id) NOT NULL,
    qa_reason_id INT REFERENCES qa_reasons(id) NOT NULL
);
```

## SAP Production Order

Placeholder table for future development. This table is going to store the
production orders from the SAP system. Allows the LMS system to track the
production orders and get information from the SAP system.

> Table name: `sap_production_orders`

| Field name | Key | Description                      | Type    | Default value | Required |
|------------|:---:|----------------------------------|---------|:-------------:|:--------:|
| id         | PK  | Unique ID                        | Integer |   sequence    |    N     |
| po_number  |  -  | Production Order number (Unique) | Varchar |       -       |    Y     |

**MsSQL**

``` sql
CREATE TABLE sap_production_orders (
    id INT PRIMARY KEY IDENTITY(1,1),
    po_number NVARCHAR(MAX) UNIQUE NOT NULL
);
```

**Postgresql**

``` sql
CREATE TABLE sap_production_orders (
    id SERIAL PRIMARY KEY,
    po_number VARCHAR(255) UNIQUE NOT NULL
);
```

## Products

The main table of the LMS system. This table stores the products that are going
to be produced. Every product has a unique data matrix number. Other tables of
the system are created to support the tracking of the products.

> Table name: `products`

| Field name                                       | Key | Description                          | Type       | Default value | Required |
|--------------------------------------------------|:---:|--------------------------------------|------------|:-------------:|:--------:|
| id                                               | PK  | Unique ID                            | Integer    |   sequence    |    N     |
| data_matrix                                      |  -  | Data matrix value (Unique)           | BigInteger |       -       |    Y     |
| po_number                                        |  -  | PO number                            | Varchar    |       -       |    Y     |
| active                                           |  -  | Is the item active                   | Bool       |       Y       |    N     |
| [sap_production_order_id](#sap-production-order) | FK  | Item from the SAP table              | Integer    |       -       |    N     |
| [virtual_assembly_id](#virtual-assemblies)       | FK  | Item from the Virtual Assembly table | Integer    |       -       |    N     |
| [qa_reason_id](#quality-reasons)                 |  -  | Quality status                       | Integer    |       -       |    N     |

Indexing on **data_matrix** and **po_number** fields is recommended. These
fields are going to be queried a lot.

**MsSQL**

``` sql
CREATE TABLE products (
    id INT PRIMARY KEY IDENTITY(1,1),
    data_matrix BIGINT UNIQUE NOT NULL,
    po_number NVARCHAR(MAX) NOT NULL,
    active BIT DEFAULT 1,
    sap_production_order_id INT REFERENCES sap_production_orders(id),
    virtual_assembly_id INT REFERENCES virtual_assemblies(id),
    qa_reason_id INT REFERENCES qa_reasons(id)
);
CREATE INDEX idx_products_data_matrix ON products(data_matrix);
CREATE INDEX idx_products_po_number ON products(po_number);
```

**Postgresql**

``` sql
CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    data_matrix BIGINT UNIQUE NOT NULL,
    po_number VARCHAR(255) NOT NULL,
    active BOOLEAN DEFAULT true,
    sap_production_order_id INT REFERENCES sap_production_orders(id),
    virtual_assembly_id INT REFERENCES virtual_assemblies(id),
    qa_reason_id INT REFERENCES qa_reasons(id)
);
CREATE INDEX idx_products_data_matrix ON products(data_matrix);
CREATE INDEX idx_products_po_number ON products(po_number);
```

## Product Histories

One of the most important tables in the LMS system. This table stores the
history of the products. Every time when the product is going to be moved to
another workstation or the product is going to be inspected, a new rows is going
to be created in the history table.

> Table name: `product_histories`

| Field name  | Key | Description              | Type      | Default value | Required |
|-------------|:---:|--------------------------|-----------|:-------------:|:--------:|
| id          | PK  | Unique ID                | Integer   |   sequence    |    N     |
| created_at  |  -  | Time the item created    | Timestamp |      now      |    N     |
| created_by  |  -  | User who create the item | Integer   |       -       |    Y     |
| qa_item_id  | FK  | QA item                  | Integer   |       -       |    N     |
| job_item_id | FK  | Job that made by user    | Integer   |       -       |    Y     |
| product_id  | FK  | Product to belong        | Integer   |       -       |    Y     |

**MsSQL**

``` sql
CREATE TABLE product_histories (
    id INT PRIMARY KEY IDENTITY(1,1),
    created_at DATETIME DEFAULT GETDATE(),
    created_by INT REFERENCES users(id) NOT NULL,
    qa_item_id INT REFERENCES qa_items(id),
    job_item_id INT REFERENCES job_items(id) NOT NULL
    product_id INT REFERENCES products(id) NOT NULL
);
```

**Postgresql**

``` sql
CREATE TABLE product_histories (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT REFERENCES users(id) NOT NULL,
    qa_item_id INT REFERENCES qa_items(id),
    job_item_id INT REFERENCES job_items(id) NOT NULL
    product_id INT REFERENCES products(id) NOT NULL
);
```

## Virtual Assemblies

Collection of assembled products.

> Table name: `virtual_assemblies`

| Field name                       | Key | Description        | Type    | Default value | Required |
|----------------------------------|:---:|--------------------|---------|:-------------:|:--------:|
| id                               | PK  | Unique ID          | Integer |   sequence    |    -     |
| active                           |  -  | Is the item active | Bool    |     true      |    -     |
| [qa_reason_id](#quality-reasons) |  -  | Quality status     | Integer |       -       |    N     |

**MsSQL**

``` sql
CREATE TABLE virtual_assemblies (
    id INT PRIMARY KEY IDENTITY(1,1),
    active BIT DEFAULT 1,
    qa_reason_id INT REFERENCES qa_reasons(id)
);
```

**Postgresql**

``` sql
CREATE TABLE virtual_assemblies (
    id SERIAL PRIMARY KEY IDENTITY(1,1),
    active BOOLEAN DEFAULT true,
    qa_reason_id INT REFERENCES qa_reasons(id)
);
```

## Product and Virtual Assembly Links

A single product can be part of different Virtual Assembly Products.

> Table name: `product_virtual_assembly_links`

| Field name                                 |  Key   | Description                             | Type    | Default value | Required |
|--------------------------------------------|:------:|-----------------------------------------|---------|:-------------:|:--------:|
| [product_id](#products)                    | PK, FK | Product id as part of a virtual product | Integer |       -       |    Y     |
| [virtual_assembly_id](#virtual-assemblies) | PK, FK | Virtual product id                      | Integer |       -       |    Y     |
| active                                     |   -    | Connection active                       | Bool    |     true      |    N     |

Indexing on both fields is required.

**MsSQL**

``` sql
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
```

**Postgresql**

``` sql
CREATE TABLE product_virtual_assembly_links (
    product_id INT REFERENCES products(id),
    virtual_assembly_id INT REFERENCES virtual_assemblies(id),
    active BOOLEAN DEFAULT true,
    PRIMARY KEY (product_id, virtual_assembly_id)
);
CREATE INDEX idx_product_virtual_assembly_links_product_id ON 
product_virtual_assembly_links
(product_id);
CREATE INDEX idx_product_virtual_assembly_links_virtual_assembly_id ON 
product_virtual_assembly_links
(virtual_assembly_id);
```

## International

### Languages

The LMS must be able to handle different languages for different sites. The
available list of languages are going to be defined in `languages` table.

> Table name: `international_languages`

| Field name | Key | Description                | Type    | Default value | Required |
|------------|:---:|----------------------------|---------|:-------------:|:--------:|
| id         | PK  | Unique ID                  | Integer |   sequence    |    -     |
| code_name  |  -  | Short name of the language | Bool    |       -       |    Y     |
| language   |  -  | Language                   | Varchar |       -       |    Y     |

**MsSQL**

``` sql
CREATE TABLE international_languages (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(MAX) NOT NULL,
    language VARCHAR(MAX) NOT NULL
);
```

**Postgresql**

``` sql 
CREATE TABLE international_languages (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(255) NOT NULL,
    language VARCHAR(255) NOT NULL
);
```

### Labels

> Table name: `international_labels`

| Field name  | Key | Description             | Type    | Default value | Required |
|-------------|:---:|-------------------------|---------|:-------------:|:--------:|
| id          | PK  | Unique ID               | Integer |   sequence    |    -     |
| usage_label |  -  | Identifies the use case | Varchar |       -       |    Y     |

**MsSQL**

``` sql
CREATE TABLE international_labels (
    id INT PRIMARY KEY IDENTITY(1,1),
    usage_label NVARCHAR(MAX) NOT NULL
);
```

**Postgresql**

``` sql
CREATE TABLE international_labels (
    id SERIAL PRIMARY KEY,
    usage_label VARCHAR(255) NOT NULL
);
```

### Translations

> Table name: `international_translations`

| Field name                | Key | Description          | Type    | Default value | Required |
|---------------------------|:---:|----------------------|---------|:-------------:|:--------:|
| id                        | PK  | Unique ID            | Integer |   sequence    |    -     |
| international_language_id | FK  | Defines the language | Integer |       -       |    Y     |
| international_label_id    | FK  | Defines the use case | Integer |       -       |    Y     |
| value                     |  -  | Text to display      | Varchar |       -       |    Y     |

**MsSQL**

``` sql
CREATE TABLE international_translations (
    id INT PRIMARY KEY IDENTITY(1,1),
    international_language_id INT FOREIGN KEY REFERENCES international_languages(id),
    international_label_id INT FOREIGN KEY REFERENCES international_labels(id),
    value NVARCHAR(MAX) NOT NULL
);
CREATE INDEX idx_international_translations_international_language_id on
    international_translations(international_language_id);
CREATE INDEX idx_international_translations_international_label_id on
    international_translations(international_label_id);
```

**Postgresql**

``` sql
CREATE TABLE international_translations (
    id SERIAL PRIMARY KEY,
    international_language_id INT REFERENCES international_languages(id),
    international_label_id INT REFERENCES international_labels(id),
    value VARCHAR(255) NOT NULL
);
CREATE INDEX idx_international_translations_international_language_id on
    international_translations(international_language_id); 
CREATE INDEX idx_international_translations_international_label_id on
    international_translations(international_label_id);
```