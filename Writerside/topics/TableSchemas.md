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
***active*** status. When the ***deleted*** field is set as true, as the active
status should set to false, but that is not mandatory. This step just makes the
continuous development more stable.

> **Hard delete**
>
> Hard delete of any record from this table is not recommended. Instead, use the
> soft delete by setting the ***deleted*** field to `true` and the
***deleted_at***
> value to the time of deletion.

The ***badge_number*** field is useful when an old user needs to be reactivated.
This information gives the advantage of continuing the user history over an
inactive period of time.

> Table name:`users`

| Field name   | Key | Description                    | Type       | Default value | Required |
|--------------|:---:|--------------------------------|------------|:-------------:|:--------:|
| id           | PK  | Unique ID                      | BigInteger |       -       |    Y     |
| active       |  -  | Allow user to take actions     | Bool       |     true      |    N     |
| deleted      |  -  | Deny any actions               | Bool       |     false     |    N     |
| deleted_at   |  -  | Time of deletion               | Timestamp  |       -       |    N     |
| badge_number |  -  | Employee id to identify person | Varchar    |       -       |    N     |
| first_name   |  -  | First name                     | Varchar    |       -       |    Y     |
| last_name    |  -  | First name                     | Varchar    |       -       |    Y     |

**MsSQL**

``` SQL
CREATE TABLE users (
    id BIGINT PRIMARY KEY NOT NULL,
    active BIT DEFAULT 1,
    deleted BIT DEFAULT 0,
    deleted_at DATETIME,
    badge_number NVARCHAR(20) UNIQUE,
    first_name NVARCHAR(60) NOT NULL,
    last_name NVARCHAR(60) NOT NULL
);
```

**Postgresql**

``` SQL
CREATE TABLE users (
    unique_id BIGINT PRIMARY KEY NOT NULL,
    active BOOLEAN DEFAULT true,
    deleted BOOLEAN DEFAULT false,
    deleted_at TIMESTAMP,
    badge_number VARCHAR(20) UNIQUE,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL
);
```

## Production Orders

This table makes the connection between the LMS application, and it's database,
and the information from the SAP system. Only those Production Orders can be
used during any process that is registered in this table. The meta information
of the Production Orders are going to be stored here.

> Table name: `production_orders`

| Field name | Key | Description              | Type    | Default value | Required |
|------------|:---:|--------------------------|---------|:-------------:|:--------:|
| id         | PK  | PO Number                | Integer |       -       |    Y     |
| quantity   |     | Total quantity of the PO | Integer |       -       |    N     |

**MsSQL**

``` SQL
CREATE TABLE production_orders (
    id INT PRIMARY KEY NOT NULL,
    quantity INT,
);
```

**Postgresql**

``` SQL
CREATE TABLE production_orders (
    id INT PRIMARY KEY NOT NULL,
    quantity INT,
);
```

## Virtual Assemblies

Collection of assembled products. The records of this table are the foreign key
of the [products](#products) table as ***virtual_assembly_id***.

> Table name: `virtual_assemblies`

| Field name | Key | Description             | Type    | Default value  | Required |
|------------|:---:|-------------------------|---------|:--------------:|:--------:|
| id         | PK  | Unique ID               | Integer | auto increment |    -     |
| active     |  -  | Is the item active      | Bool    |      true      |    -     |
| to_id      |  -  | New Virtual Assembly ID | Integer |       -        |    N     |

The ***to_id*** field represents the new Virtual Assembly ID. That is the new
group of assembled products. This field is meant to track the history of
assembled products. For example, when an assembled product of two products is
connected to another assembled product of 3 products. One of the two virtual
assembly ID must have been deactivated. The deactivated virtual assembly will
have the other virtual ID in the ***to_id*** field.

**MsSQL**

``` SQL
CREATE TABLE virtual_assemblies (
    id INT PRIMARY KEY IDENTITY(1,1),
    active BIT DEFAULT 1,
    to_id INT
);
```

**Postgresql**

``` SQL
CREATE TABLE virtual_assemblies (
    id SERIAL PRIMARY KEY IDENTITY(1,1),
    active BOOLEAN DEFAULT true,
    qa_reason_id INT REFERENCES qa_reasons(id)
    from_id INT
);
```

## Products

The main table of the LMS system. This table stores the products that are going
to be produced. Every product has a unique data matrix number. Other tables of
the system are created to support the tracking of the products.

> Table name: `products`

| Field name                                 | Key | Description                               | Type       | Default value | Required |
|--------------------------------------------|:---:|-------------------------------------------|------------|:-------------:|:--------:|
| id                                         | PK  | Data matrix value (Unique)                | BigInteger |       -       |    Y     |
| active                                     |  -  | Is the item active                        | Bool       |       Y       |    N     |
| [production_order_id](#production-orders)  |  -  | Reference to PO                           | Integer    |       -       |    Y     |
| [virtual_assembly_id](#virtual-assemblies) | FK  | Item from the Virtual Assembly table      | Integer    |       -       |    N     |
| qa_ok_status                               |  -  | Indicates that the product is free to use | Bool       |       Y       |    N     |

The ***qa_ok_status*** field indicates any quality issue. The boolean value
helps to avoid a lot of queries to find out the product is ok or not.

**MsSQL**

``` SQL
CREATE TABLE products (
    id BIGINT PRIMARY KEY NOT NULL,
    active BIT DEFAULT 1,
	production_order_id INT REFERENCES production_orders(id) NOT NULL,
    virtual_assembly_id INT REFERENCES virtual_assemblies(id),
    qa_ok_status BIT DEFAULT 1
);
CREATE INDEX idx_products_production_order_id ON products(production_order_id);
CREATE INDEX idx_products_virtual_assembly_id ON products(virtual_assembly_id);
```

**Postgresql**

``` SQL
CREATE TABLE products (
    id BIGINT PRIMARY KEY NOT NULL,
    active BOOLEAN DEFAULT true,
    production_order_id INT REFERENCES production_orders(id) NOT NULL,
    virtual_assembly_id INT REFERENCES virtual_assemblies(id),
    qa_ok_status BOOLEAN
);
CREATE INDEX idx_products_production_order_id ON products(production_order_id);
CREATE INDEX idx_products_virtual_assembly_id ON products(virtual_assembly_id);
```

## Product Histories

One of the most important tables in the LMS system. This table stores the
history of the products. Every time when the product is going to be moved to
another workstation or the product is going to be inspected, a new row is going
to be created in the history table.

> Table name: `product_histories`

| Field name              | Key | Description              | Type      | Default value  | Required |
|-------------------------|:---:|--------------------------|-----------|:--------------:|:--------:|
| id                      | PK  | Unique ID                | Integer   | auto increment |    N     |
| created_at              |  -  | Time the item created    | Timestamp |      now       |    N     |
| created_by              |  -  | User who create the item | Integer   |       -        |    Y     |
| [product_id](#products) | FK  | Product to belong        | Integer   |       -        |    Y     |

**MsSQL**

``` SQL
CREATE TABLE product_histories (
    id INT PRIMARY KEY IDENTITY(1,1),
    created_at DATETIME DEFAULT GETDATE(),
    created_by BIGINT REFERENCES users(id) NOT NULL,
    product_id BIGINT REFERENCES products(id) NOT NULL
);
CREATE INDEX idx_product_histories_product_id on product_histories(product_id);
```

**Postgresql**

``` SQL
CREATE TABLE product_histories (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INT REFERENCES users(id) NOT NULL,
    product_id INT REFERENCES products(id) NOT NULL
);
CREATE INDEX idx_product_histories_product_id on product_histories(product_id);
```

## Jobs

This table stores the available actions that the users can perform during the
production process. These jobs are small parts of the processes in production.
An entry in this table is the main definition of the job.

> Table name: `jobs`

| Field name  | Key | Description                           | Type    | Default value  | Required |
|-------------|:---:|---------------------------------------|---------|:--------------:|:--------:|
| id          | PK  | Unique ID                             | Integer | auto increment |    N     |
| name        |  -  | Name of the job (Unique)              | Varchar |       -        |    Y     |
| description |  -  | Short description of the job          | Varchar |       -        |    N     |
| active      |  -  | Determine the availability of the job | Bool    |      true      |    N     |

Querying the table is going to be made through the **id** field in most cases.

**MsSQL**

``` SQL
CREATE TABLE jobs (
    id INT PRIMARY KEY IDENTITY(1,1),
    name NVARCHAR(20) UNIQUE NOT NULL,
    description NVARCHAR(255),
    active BIT DEFAULT 1,
);
```

**Postgresql**

``` SQL
CREATE TABLE jobs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    description VARCHAR(255),
    active BOOLEAN DEFAULT true,
);
```

## Job Product Items

A single representation of a job history item. When the user takes any action in
the production that is represented by a [job](#jobs) item. This table stores
details of the taken actions not just the metadata of the job. The timestamp and
the user are registered in the [product_histories](#product-histories) table.

> Table name: `job_product_items`

| Field name                               | Key | Description                   | Type    | Default value  | Required |
|------------------------------------------|:---:|-------------------------------|---------|:--------------:|:--------:|
| id                                       | PK  | Unique ID                     | Integer | auto increment |    -     |
| [job_id](#jobs)                          | FK  | Job item id                   | Integer |       -        |    Y     |
| description                              |  -  | Short description by the user | Varchar |       -        |    N     |
| [product_history_id](#product-histories) | FK  | The id of the product history | Integer |       -        |    Y     |

**MsSQL**

``` SQL
CREATE TABLE job_product_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    job_id INT REFERENCES jobs(id) NOT NULL,
	product_history_id INT REFERENCES product_histories(id) NOT NULL,
	description NVARCHAR(255)
);
CREATE INDEX idx_job_product_items_product_history_id on job_product_items(product_history_id);
```

**Postgresql**

``` SQL
CREATE TABLE job_product_items (
    id SERIAL PRIMARY KEY,
    job_id INT REFERENCES jobs(id) NOT NULL,
	product_history_id INT REFERENCES product_histories(id) NOT NULL,
	description NVARCHAR(255)
);
CREATE INDEX idx_job_product_items_product_history_id on job_product_items(product_history_id);
```

## Quality reasons

This table stores the available quality reason codes. These codes are going to
be used when the user inspect any product in the production.

> Table name: `qa_reasons`

| Field name  | Key | Description                       | Type    | Default value  | Required |
|-------------|:---:|-----------------------------------|---------|:--------------:|:--------:|
| id          | PK  | Unique ID                         | Integer | auto increment |    N     |
| code_name   |  -  | Short name of the reason (Unique) | Varchar |       -        |    Y     |
| name        |  -  | Descriptive name of the reason    | Varchar |       -        |    N     |
| active      |  -  | Allows to deactivate reason       | Bool    |      true      |    N     |
| description |  -  | Description of the QA status      | Varchar |       -        |    N     |
| ok_status   |  -  | Product usability indicator       | Bool    |     false      |    N     |

**MsSQL**

``` SQL
CREATE TABLE qa_reasons (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(20),
	description NVARCHAR(255),
	ok_status BIT DEFAULT 0,
    active BIT DEFAULT 1
);
```

**Postgresql**

``` SQL
CREATE TABLE qa_reasons (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(20),
	description VARCHAR(255),
	ok_status BOOLEAN DEFAULT false,
    active BOOLEAN DEFAULT true
);
```

## Quality Product Items

A single representation of a quality history item. When the user takes any
action in the production that is represented by a [qa_reasons](#quality-reasons)
item. This table stores details of the taken actions not just the metadata of
the quality reason. The timestamp and the user are registered in
the [product_histories](#product-histories) table.

> Table name: `qa_product_items`

| Field name                               | Key | Description                   | Type    | Default value  | Required |
|------------------------------------------|:---:|-------------------------------|---------|:--------------:|:--------:|
| id                                       | PK  | Unique ID                     | Integer | auto increment |    N     |
| [qa_reason_id](#quality-reasons)         | FK  | Quality Reason ID             | Integer |       -        |    Y     |
| [product_history_id](#product-histories) | FK  | Product History ID            | Integer |       -        |    Y     |
| description                              |  -  | Short description by the user | Varchar |       -        |    N     |

**MsSQL**

``` SQL
CREATE TABLE qa_product_items (
    id INT PRIMARY KEY IDENTITY(1,1),
    qa_reason_id INT REFERENCES qa_reasons(id) NOT NULL,
	product_history_id INT REFERENCES product_histories(id) NOT NULL,
	description NVARCHAR(255)
);
CREATE INDEX idx_qa_product_items_product_history_id on qa_product_items(product_history_id);
```

**Postgresql**

``` SQL
CREATE TABLE qa_product_items (
    id SERIAL PRIMARY KEY,
    qa_reason_id INT REFERENCES qa_reasons(id) NOT NULL,
	product_history_id INT REFERENCES product_histories(id) NOT NULL,
	description VARCHAR(255)
);
CREATE INDEX idx_qa_product_items_product_history_id on qa_product_items(product_history_id);
```

## Workstations

A single workstation item in the database is a single place in the production
area where workers can do their jobs. Workstation can be described as a device
where users can open an LMS application. A workstation can perform multiple type
of [jobs](#jobs), that assigned to the workstation.

Workstation and job connections are going to be defined in
the [job_workstation_links](#job-and-workstation-links)

> Table name: `workstations`

| Field name | Key | Description                      | Type    | Default value  | Required |
|------------|:---:|----------------------------------|---------|:--------------:|:--------:|
| id         | PK  | Unique ID                        | Integer | auto increment |    N     |
| code_name  |  -  | Name of the workstation (Unique) | Varchar |       -        |    Y     |
| name       |  -  | Description of the workstation   | Varchar |       -        |    N     |
| active     |  -  | Allow to use the workstation     | Bool    |      true      |    N     |

**MsSQL**

``` SQL
CREATE TABLE workstations (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) NOT NULL,
    name NVARCHAR(60),
    active BIT DEFAULT 1,
);
```

**Postgresql**

``` SQL
CREATE TABLE workstations(
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(20) NOT NULL,
    name VARCHAR(60),
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

``` SQL
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES workstations(id),
    job_id INT REFERENCES jobs(id),
    PRIMARY KEY (workstation_id, job_id)
);
```

**Postgresql**

``` SQL
CREATE TABLE job_workstation_links (
    workstation_id INT REFERENCES workstations(id),
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

| Field name | Key | Description                           | Type    | Default value  | Required |
|------------|:---:|---------------------------------------|---------|:--------------:|:--------:|
| id         | PK  | Unique ID                             | Integer | auto increment |    N     |
| code_name  |  -  | Short name of the permission (Unique) | Varchar |       -        |    Y     |
| name       |  -  | Detailed name of the permission       | Varchar |       -        |    N     |

**MsSQL**

``` SQL
CREATE TABLE permissions (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(60) NOT NULL
);
CREATE INDEX idx_permissions_code_name on permissions(code_name);
```

**Postgresql**

``` SQL
CREATE TABLE permissions (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(60) NOT NULL
);
CREATE INDEX idx_permissions_code_name on permissions(code_name);
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

| Field name | Key | Description                      | Type    | Default value  | Required |
|------------|:---:|----------------------------------|---------|:--------------:|:--------:|
| id         | PK  | Unique ID                        | Integer | auto increment |    N     |
| code_name  |  -  | Short name of the group (Unique) | Varchar |       -        |    Y     |
| name       |  -  | Detailed name of the group       | Varchar |       -        |    N     |

Indexing on **code_name** field is highly recommended.

**MsSQL**

``` SQL
CREATE TABLE groups (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(20) UNIQUE NOT NULL,
    name NVARCHAR(60) NOT NULL
);
CREATE INDEX idx_groups_code_name ON groups(code_name);
```

**Postgresql**

``` SQL
CREATE TABLE groups (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(20) UNIQUE NOT NULL,
    name VARCHAR(60) NOT NULL
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

``` SQL
CREATE TABLE group_permission_links (
    group_id INT REFERENCES groups(id),
    permission_id INT REFERENCES permissions(id),
    PRIMARY KEY (group_id, permission_id)
);
```

**Postgresql**

``` SQL
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

``` SQL
CREATE TABLE group_job_links (
    job_id INT REFERENCES jobs(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (job_id, group_id)
);
```

**Postgresql**

``` SQL
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

``` SQL
CREATE TABLE user_group_links (
    user_id INT REFERENCES users(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (user_id, group_id)
);
```

**Postgresql**

``` SQL
CREATE TABLE user_group_links (
    user_id INT REFERENCES users(id),
    group_id INT REFERENCES groups(id),
    PRIMARY KEY (user_id, group_id)
);
```

## International Languages

The LMS must be able to handle different languages for different sites. The
available list of languages are going to be defined in `languages` table.

> Table name: `international_languages`

| Field name | Key | Description                | Type    | Default value  | Required |
|------------|:---:|----------------------------|---------|:--------------:|:--------:|
| id         | PK  | Unique ID                  | Integer | auto increment |    -     |
| code_name  |  -  | Short name of the language | Bool    |       -        |    Y     |
| language   |  -  | Language                   | Varchar |       -        |    Y     |

**MsSQL**

``` SQL
CREATE TABLE international_languages (
    id INT PRIMARY KEY IDENTITY(1,1),
    code_name NVARCHAR(8) NOT NULL,
    language NVARCHAR(20) NOT NULL
);
```

**Postgresql**

``` SQL 
CREATE TABLE international_languages (
    id SERIAL PRIMARY KEY,
    code_name VARCHAR(20) NOT NULL,
    language VARCHAR(20) NOT NULL
);
```

## International Translations

> Table name: `international_translations`

Translated values of each label are defined in this table for the available
languages.

| Field name                | Key | Description          | Type    | Default value  | Required |
|---------------------------|:---:|----------------------|---------|:--------------:|:--------:|
| id                        | PK  | Unique ID            | Integer | auto increment |    -     |
| international_language_id | FK  | Defines the language | Integer |       -        |    Y     |
| label                     |  -  | Defines the use case | Varchar |       -        |    Y     |
| value                     |  -  | Text to display      | Varchar |       -        |    Y     |

**MsSQL**

``` SQL
CREATE TABLE international_translations (
    id INT PRIMARY KEY IDENTITY(1,1),
    international_language_id INT FOREIGN KEY REFERENCES international_languages(id),
    label NVARCHAR(255) NOT NULL
    value NVARCHAR(255) NOT NULL
);
CREATE INDEX idx_international_translations_international_language_id on
    international_translations(international_language_id);
```

**Postgresql**

``` SQL
CREATE TABLE international_translations (
    id SERIAL PRIMARY KEY,
    international_language_id INT REFERENCES international_languages(id),
    label VARCHAR(255) NOT NULL
    value VARCHAR(255) NOT NULL
);
CREATE INDEX idx_international_translations_international_language_id on
    international_translations(international_language_id); 
```
