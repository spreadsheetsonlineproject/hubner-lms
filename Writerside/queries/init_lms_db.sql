insert into users
	(id, first_name, last_name, badge_number)
values
	(1, 'User Steinl', 'Doe', 1),
	(2, 'User Konf', 'Doe', 2),
	(3, 'User QA', 'Doe', 3),
    (4, 'User JavM', 'Doe', 4),
    (5, 'User JavS', 'Doe', 5),
    (6, 'User JavH', 'Doe', 6),
    (7, 'User JavN', 'Doe', 7);

insert into qa_reasons
    (code_name, name, description, ok_status, active)
values
    ('OK0', 'OK', 'Alapertelmezett OK statusz', 1, 1),
    ('NOK1', '1  Szkorcs szemcse', '1  Szkorcs szemcse', 0, 1),
    ('NOK2', '2  Eloszlatlan szemcse', '2  Eloszlatlan szemcse', 0, 1),
    ('NOK3', '3  Beszakadás', '3  Beszakadás', 0, 1),
    ('NOK4', '4  Karc', '4  Karc', 0, 1),
    ('NOK5', '5  Vágás', '5  Vágás', 0, 1),
    ('NOK6', '6  Repedés', '6  Repedés', 0, 1),
    ('NOK7', '7  Kapcsoló kamra repedés', '7  Kapcsoló kamra repedés', 0, 1),
    ('NOK8', '8  Horzsolás', '8  Horzsolás', 0, 1),
    ('NOK9', '9  Benyomodás', '9  Benyomodás', 0, 1),
    ('NOK10', '10  Horony', '10  Horony', 0, 1),
    ('NOK11', '11  Narancsbőr', '11  Narancsbőr', 0, 1),
    ('NOK12', '12  Deformáció', '12  Deformáció', 0, 1),
    ('NOK13', '13  Hullámosság', '13  Hullámosság', 0, 1),
    ('NOK14', '14  Letapadás', '14  Letapadás', 0, 1),
    ('NOK15', '15  Teflon szalag felválás', '15  Teflon szalag felválás', 0, 1),
    ('NOK16', '16  Lippe állás / Fül előfeszítettség ', '16  Lippe állás / Fül előfeszítettség ', 0, 1),
    ('NOK17', '17  Keresztmetszet', '17  Keresztmetszet', 0, 1),
    ('NOK18', '18  Ferde állás', '18  Ferde állás', 0, 1),
    ('NOK19', '19  Vízfeldobás', '19  Vízfeldobás', 0, 1),
    ('NOK20', '20  Hosszúság', '20  Hosszúság', 0, 1),
    ('NOK21', '21  Szennyeződés', '21  Szennyeződés', 0, 1),
    ('NOK22', '22  Elszínesződés', '22  Elszínesződés', 0, 1),
    ('NOK23', '23  Kitöltetlen vulkanizálás', '23  Kitöltetlen vulkanizálás', 0, 1),
    ('NOK24', '24  Sorjás', '24  Sorjás', 0, 1),
    ('NOK25', '25  Furat sorjás', '25  Furat sorjás', 0, 1),
    ('NOK26', '26  Elvált vulkanizálás', '26  Elvált vulkanizálás', 0, 1),
    ('NOK27', '27  Deformált tömítő bordák', '27  Deformált tömítő bordák', 0, 1),
    ('NOK28', '28  Nem egyenletes futású tömítő bordák', '28  Nem egyenletes futású tömítő bordák', 0, 1),
    ('NOK29', '29  Hullámos tömítő él', '29  Hullámos tömítő él', 0, 1),
    ('NOK30', '30  Lépcsős vulkanizálás', '30  Lépcsős vulkanizálás', 0, 1),
    ('NOK31', '31  Megcsavarodott termék', '31  Megcsavarodott termék', 0, 1),
    ('NOK32', '32  Tájolási probléma', '32  Tájolási probléma', 0, 1),
    ('NOK33', '33  Keretméret', '33  Keretméret', 0, 1),
    ('NOK34', '34  Ferde sarok', '34  Ferde sarok', 0, 1),
    ('NOK35', '35  Elvált ragasztás', '35  Elvált ragasztás', 0, 1),
    ('NOK36', '36  Túlvágás visszaragasztása válik ', '36  Túlvágás visszaragasztása válik ', 0, 1),
    ('NOK37', '37  Dugók ragasztása elválik', '37  Dugók ragasztása elválik', 0, 1),
    ('NOK38', '38  Ragasztónyom, felesleg a termék felületén', '38  Ragasztónyom, felesleg a termék felületén', 0, 1),
    ('NOK39', '39  Túlvágás', '39  Túlvágás', 0, 1),
    ('NOK40', '40  Kivágás poziciója', '40  Kivágás poziciója', 0, 1),
    ('NOK41', '41  Kivágás mérete', '41  Kivágás mérete', 0, 1),
    ('NOK42', '42  Kivágás nem egyenletes, hullámos', '42  Kivágás nem egyenletes, hullámos', 0, 1),
    ('NOK43', '43  Furat poziciója', '43  Furat poziciója', 0, 1),
    ('NOK44', '44  Furat mérete', '44  Furat mérete', 0, 1),
    ('NOK45', '45  Furat alakja', '45  Furat alakja', 0, 1),
    ('NOK46', '46  Hiányzó munkalépés', '46  Hiányzó munkalépés', 0, 1),
    ('NOK47', '47  Több munkalépés', '47  Több munkalépés', 0, 1),
    ('NOK48', '48  Tömítés (SIKAFLEX) nem egyenletes', '48  Tömítés (SIKAFLEX) nem egyenletes', 0, 1),
    ('NOK49', '49  Tömítés (SIKAFLEX) hiányzik', '49  Tömítés (SIKAFLEX) hiányzik', 0, 1),
    ('NOK50', '50  Kapcsolószegély funkciója nem megfelelő', '50  Kapcsolószegély funkciója nem megfelelő', 0, 1),
    ('NOK51', '51  Kapcsoló szegély sérült', '51  Kapcsoló szegély sérült', 0, 1),
    ('NOK52', '52  Kapcsoló szegély kábelkivezetésének hossza nok', '52  Kapcsoló szegély kábelkivezetésének hossza nok', 0, 1),
    ('NOK53', '53  Víz zárás nem megfelelő', '53  Víz zárás nem megfelelő', 0, 1),
    ('NOK54', '54  Cikkszám eltérés', '54  Cikkszám eltérés', 0, 1),
    ('NOK55', '55  Drabszám eltérés', '55  Drabszám eltérés', 0, 1),
    ('NOK56', '56  Nem megfelelő cikkszámú alkotó beépítése / felhasználása', '56  Nem megfelelő cikkszámú alkotó beépítése / felhasználása', 0, 1),
    ('NOK57', '57  Javítás nem megfelelően lett elvégezve', '57  Javítás nem megfelelően lett elvégezve', 0, 1);

insert into groups
	(code_name, name)
values
	('OPRKon', 'Operátor Konfekció'),
	('OPRSte', 'Operátor Steinl'),
	('OPRSer', 'Javítós'),
	('OPRQua', 'Quality');

insert into jobs
	(code_name, name, description, active, disassemble, create_product)
values
	('PROUTR', 'Új termék regisztráció', 'Új termék regisztrációja', 1, 0, 1),
    ('PROSz', 'Szétszerelés', 'Keret szétszerelése', 1, 1, 0),
    ('QAQE', 'Quality Ellenőrzés', 'Quality Ellenőrzés', 1, 0, 0),
    ('SERPJ', 'Profil jelölés', 'Profil jelölés', 1, 0, 0),
    ('SERHS', 'Hosszméretre szabás', 'Hosszméretre szabás', 1, 0, 0),
    ('SERAR', 'Alapozó ragasztás', 'Alapozó ragasztás', 1, 0, 0),
    ('SERR', 'Ragsztás', 'Ragsztás', 1, 0, 0),
    ('SERJ', 'Jelölés', 'Jelölés', 1, 0, 0),
    ('SERK', 'Kivágás', 'Kivágás', 1, 0, 0),
    ('SERF', 'Fúrás', 'Fúrás', 1, 0, 0),
    ('SERC', 'Csiszolás', 'Csiszolás', 1, 0, 0),
    ('SERS', 'Stancolás', 'Stancolás', 1, 0, 0),
    ('SERV', 'Vésés', 'Vésés', 1, 0, 0),
    ('SERKSB', 'Kapcsoló szegély behúzás', 'Kapcsoló szegély behúzás', 1, 0, 0),
    ('SERKSE', 'Kapcsoló szegély ellenőrzés', 'Kapcsoló szegély ellenőrzés', 1, 0, 0),
    ('SERTE', 'Tömítettség ellenőrzés', 'Tömítettség ellenőrzés', 1, 0, 0),
    ('SERVT', 'Vízteszt', 'Vízteszt', 1, 0, 0),
    ('SERP', 'Pecsételés', 'Pecsételés', 1, 0, 0),
    ('SERVJ', 'Vulkanizálás Javítás', 'Vulkanizálás', 1, 0, 0),
    ('SEROME', 'Oldalhossz méret ellenőrzés', 'Oldalhossz méret ellenőrzés', 1, 0, 0),
    ('SERSJ', 'Sorjázás Javítás', 'Sorjázás', 1, 0, 0),
    ('SERJM', 'Javító munkálatok', 'Javító munkálatok', 1, 0, 0),
    ('PROV', 'Vulkanizálás', 'Steinl munkafolyamatok', 1, 0, 0),
    ('PROS', 'Sorjázás', 'Steinl munkafolyamatok', 1, 0, 0),
    ('PROK', 'Konfekcionálás', 'Konfekcio munkafolyamatok', 1, 0, 0);

insert into workstations
	(code_name, name, active)
values
	('STEINL1', 'Steinl 1', 1),
    ('STEINL2', 'Steinl 2', 1),
    ('STEINL3', 'Steinl 3', 1),
    ('STEINL4', 'Steinl 4', 1),
    ('STEINL5', 'Steinl 5', 1),
    ('STEINL6', 'Steinl 6', 0),
    ('STEINL7', 'Steinl 7', 0),
    ('STEINL8', 'Steinl 8', 0),
    ('STEINL9', 'Steinl 9', 0),
    ('STEINL10', 'Steinl 10', 0),
    ('STEINL11', 'Steinl 11', 0),
    ('STEINL12', 'Steinl 12', 0),
    ('STEINL13', 'Steinl 13', 0),
    ('STEINL14', 'Steinl 14', 0),
    ('STEINL15', 'Steinl 15', 0),
    ('STEINL16', 'Steinl 16', 0),
    ('STEINL17', 'Steinl 17', 0),
    ('STEINL18', 'Steinl 18', 0),
    ('STEINL19', 'Steinl 19', 0),
    ('STEINL20', 'Steinl 20', 0),
    ('STEINL21', 'Steinl 21', 0),
    ('STEINL22', 'Steinl 22', 0),
    ('STEINL23', 'Steinl 23', 0),
    ('STEINL24', 'Steinl 24', 0),
    ('STEINL25', 'Steinl 25', 0),
    ('KONFEKCIO1', 'Konfekcio 1', 1),
    ('KONFEKCIO2', 'Konfekcio 2', 1),
    ('KONFEKCIO3', 'Konfekcio 3', 1),
    ('KONFEKCIO4', 'Konfekcio 4', 1),
    ('KONFEKCIO5', 'Konfekcio 5', 1),
    ('KONFEKCIO6', 'Konfekcio 6', 0),
    ('KONFEKCIO7', 'Konfekcio 7', 0),
    ('KONFEKCIO8', 'Konfekcio 8', 0),
    ('KONFEKCIO9', 'Konfekcio 9', 0),
    ('KONFEKCIO10', 'Konfekcio 10', 0),
    ('KONFEKCIO11', 'Konfekcio 11', 0),
    ('KONFEKCIO12', 'Konfekcio 12', 0),
    ('KONFEKCIO13', 'Konfekcio 13', 0),
    ('KONFEKCIO14', 'Konfekcio 14', 0),
    ('KONFEKCIO15', 'Konfekcio 15', 0),
    ('TUZFAL1', 'Tűzfal 1', 1),
    ('TUZFAL2', 'Tűzfal 2', 0),
    ('TUZFAL3', 'Tűzfal 3', 0),
    ('QW1', 'QW 1', 1),
    ('QW2', 'QW 2', 0),
    ('QW3', 'QW 3', 0),
    ('QW4', 'QW 4', 0),
    ('QW5', 'QW 5', 0),
    ('QM1', 'QA mobil 1', 1),
    ('QM2', 'QA mobil 2', 0),
    ('QM3', 'QA mobil 3', 0),
    ('QM4', 'QA mobil 4', 0),
    ('QM5', 'QA mobil 5', 0),
    ('NORM1', 'Normec 1', 1),
    ('NORM2', 'Normec 2', 0),
    ('NORM3', 'Normec 3', 0),
    ('NORM4', 'Normec 4', 0),
    ('HUTCH1', 'Hutchinson 1', 1),
    ('HUTCH2', 'Hutchinson 2', 0),
    ('HUTCH3', 'Hutchinson 3', 0),
    ('HUTCH4', 'Hutchinson 4', 0),
    ('JAVMAIN', 'Javitó', 1),
    ('JAVSTEINL', 'Javitó Steinl', 1),
    ('JAVNORM', 'Javitó Normec', 1),
    ('JAVHUTCH', 'Javitó Hutchinson', 1);

insert into applications
	(code_name, name, default_language)
values
	('PROD', 'Gyártás', 'hu-hu'),
    ('QA', 'Quality', 'hu-hu'),
    ('RW', 'Javítás', 'hu-hu');

insert into group_job_links
    (group_id, job_id)
select
    g.id,
    j.id
from
    groups g,
    jobs j
where
    g.code_name = 'OPRKon'
    and j.code_name = 'PROK';

insert into group_job_links
    (group_id, job_id)
select
    g.id,
    j.id
from
    groups g,
    jobs j
where
    g.code_name = 'OPRSte'
    and j.code_name in ('PROV', 'PROS');

insert into group_job_links
    (group_id, job_id)
select
    g.id,
    j.id
from
    groups g,
    jobs j
where
    g.code_name = 'OPRSer'
    and (
        j.code_name like 'SER%'
        or j.code_name = 'PROUTR'
        or j.code_name = 'PROSz'
    );

insert into group_job_links
    (group_id, job_id)
select
    g.id,
    j.id
from
    groups g,
    jobs j
where
    g.code_name = 'OPRQua'
    and j.code_name = 'QAQE';

insert into application_workstation_links
    (application_id, workstation_id)
select
    app.id,
    ws.id
from
    applications app,
    workstations ws
where
    app.code_name = 'PROD'
    and (
        ws.code_name like 'STEINL%'
        or ws.code_name like 'KONF%'
        or ws.code_name like 'NORM%'
        or ws.code_name like 'HUTCH%'
    );

insert into application_workstation_links
    (application_id, workstation_id)
select
    app.id,
    ws.id
from
    applications app,
    workstations ws
where
    app.code_name = 'QA'
    and (
        ws.code_name like 'QW%'
        or ws.code_name like 'TUZF%'
        or ws.code_name like 'QM%'
    );

insert into application_workstation_links
    (application_id, workstation_id)
select
    app.id,
    ws.id
from
    applications app,
    workstations ws
where
    app.code_name = 'RW'
    and ws.code_name like 'JAV%';

insert into job_workstation_links
    (workstation_id, job_id)
select
    ws.id,
    j.id
from
    workstations ws,
    jobs j
where
    ws.code_name like 'STEINL%'
    and j.code_name in ('PROV', 'PROS');

-- steinl workstation jobs
insert into job_workstation_links
    (workstation_id, job_id)
select
    ws.id,
    j.id
from
    workstations ws,
    jobs j
where
    ws.code_name like 'KONF%'
    and j.code_name = 'PROK';

insert into job_workstation_links
    (workstation_id, job_id)
select
    ws.id,
    j.id
from
    workstations ws,
    jobs j
where
    j.code_name = 'QAQE'
    and (
        ws.code_name like 'TUZF%'
        or ws.code_name like 'QW%'
        or ws.code_name like 'QM%'
    );

insert into job_workstation_links
    (workstation_id, job_id)
select
    ws.id,
    j.id
from
    workstations ws,
    jobs j
where
    ws.code_name like 'NORM%'
    and j.code_name in ('PROV', 'PROS');

insert into job_workstation_links
    (workstation_id, job_id)
select
    ws.id,
    j.id
from
    workstations ws,
    jobs j
where
    ws.code_name like 'HUTCH%'
    and j.code_name in ('PROV', 'PROS');

insert into job_workstation_links
    (workstation_id, job_id)
select
    ws.id,
    j.id
from
    workstations ws,
    jobs j
where
    ws.code_name = 'JAVMAIN'
    and (
        j.code_name like 'SER%'
        or j.code_name = 'PROUTR'
        or j.code_name = 'PROSz'
    );

insert into job_workstation_links
    (workstation_id, job_id)
select
    ws.id,
    j.id
from
    workstations ws,
    jobs j
where 1=1
    and (
        ws.code_name = 'JAVSTEINL'
        or ws.code_name = 'JAVNORM'
        or ws.code_name = 'JAVHUTCH'
    )
    and (
        j.code_name = 'SERVJ'
        or j.code_name = 'SERSJ'
    );

insert into user_group_links
    (user_id, group_id)
select
    u.id,
    g.id
from
    users u,
    groups g
where 1=1
    and u.first_name = 'User Steinl'
    and g.code_name = 'OPRSte';

insert into user_group_links
    (user_id, group_id)
select
    u.id,
    g.id
from
    users u,
    groups g
where 1=1
    and u.first_name = 'User Konf'
    and g.code_name = 'OPRKon';

insert into user_group_links
    (user_id, group_id)
select
    u.id,
    g.id
from
    users u,
    groups g
where 1=1
    and u.first_name = 'User QA'
    and g.code_name = 'OPRQua';

insert into user_group_links
    (user_id, group_id)
select
    u.id,
    g.id
from
    users u,
    groups g
where 1=1
    and u.first_name in ('User JavM', 'User JavS', 'User JavH', 'User JavN')
    and g.code_name = 'OPRSer';