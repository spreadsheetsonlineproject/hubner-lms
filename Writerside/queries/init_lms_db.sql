insert into users
	(id, first_name, last_name, badge_number)
values
	(1, 'Auto', 'LMS', 1),
	(2, 'Arnold', 'Szűcs', 2),
	(3, 'József', 'Bereczky', 3);

insert into groups
	(code_name, name)
values
	('qa_inspector', 'Quality Inspector'),
	('extruder_worker', 'Extruder Worker'),
	('extruder_manager', 'Extruder Manager'),
	('assembly_worker', 'Assembly Worker'),
	('rework_worker', 'Rework Worker');

insert into jobs
	(code_name, name, description)
values
	('K1', 'Create product', 'Create new product'),
	('A1', 'Assemble products', 'Assemble products'),
	('Q1', 'Quality inspection', 'Quality inspection on the product');

insert into workstations
	(code_name, name)
values
	('assembly1', 'Assembly area1'),
	('assebmly2', 'Assembly area2'),
	('qa1', 'Quality area1');

insert into applications
	(code_name, name)
values
	('assembly1', 'Assembly 1'),
	('assembly2', 'Assembly 2')

insert into job_workstation_links
	(workstation_id, job_id)
values
	(1, 1), (1, 2),
	(2, 1), (2, 2),
	(3, 3);

insert into application_workstation_links
	(application_id, workstation_id)
values
	(1, 1), (1, 2)

insert into group_job_links
	(group_id, job_id)
values
	(1, 3),
	(3, 1), (3, 2);

insert into user_group_links
	(user_id, group_id)
values
	(1, 1), (1, 2), (1, 3), (1, 4), (1, 5),
	(2, 1), (2, 3),
	(3, 5);

insert into qa_reasons
	(code_name, name, description, ok_status, active)
values
	('QADOK', 'Default OK', 'Default OK QA reason', 1, 1),
	('QADNOK', 'Default not OK', 'Default not OK QA reason', 1, 1)
