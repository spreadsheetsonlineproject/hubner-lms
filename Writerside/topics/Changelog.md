# Changelog

Track changes of the LMS applications and databases.

## V0.3.5.2

> Updated: **2024-10-20**

1. Blocking VHU depends on metadata config
   1. BLOCK_VHU_ON_QA_NOK_CHECK define if the VHU will be blocked after a not OK quality result
   2. BLOCK_VHU_ON_DISASSEMBLY_PROCESS define if the VHU will be blocked after disassembly

## V0.3.5.1

> Updated: **2024-10-13**

1. Applications are completely responsive
2. Filtering option on the history gallery:
   1. See only quality related job history
   2. See history without quality related jobs
   3. See every history item

## V0.3.4.7

> Updated: **2024-10-13**

1. LMS production app full responsive.
2. Quality app scale to fit off and orientation locked.

## V0.3.4.6

> Updated: **2024-10-06**

1. Scanner button hide functionality on desktop devices modified.

## V0.3.4.5

> Updated: **2024-10-02**

1. Virtual handling unit is blocked when disassemble happens or profiles are blocked.

## V0.3.4.4

> Updated: **2024-10-01**

1. Scanner buttons are hidden on desktop devices
2. Quality and Rework applications first scanned barcode mark fixed
3. Quality reason list ordered by a new field, DisplayOrder

## V0.3.4.3

> Updated: **2024-09-08**

1. Barcode reader buttons are added to user, production order number and product
   id fields

## V0.3.4.2

> Updated: **2024-09-01**

1. Database has been replaced by Dataverse tables. The Power Automate API and
   CRUD layers have been removed.
2. Applications connect to Dataverse tables directly.

## V0.1.0.3

> Updated: **2024-06-09**

1. Production version of the application with self served MsSQL database.
