-- Quaratine Camp --

CREATE DATABASE [Quaratine Camp];
GO

USE [Quaratine Camp]
GO

CREATE TABLE [People] (
    ID                  INT                     IDENTITY(1000,1),
    [Full name]         VARCHAR(25)             NOT NULL,
    Gender              CHAR(1)					DEFAULT NULL		CHECK(Gender='M' OR Gender='F'),
    Phone               VARCHAR(10),
    [Address]           VARCHAR(50),
	PRIMARY KEY (ID)
)
GO

CREATE TABLE [Head doctor] (
    ID                  INT,

    PRIMARY KEY(ID),

    FOREIGN KEY (ID)	REFERENCES People(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE [Volunteer] (
    ID                  INT,

    PRIMARY KEY(ID),

    FOREIGN KEY (ID)	REFERENCES People(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE [Manager] (
    ID                  INT,

    PRIMARY KEY(ID),

    FOREIGN KEY (ID)	REFERENCES People(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE [Doctor] (
    ID              INT,

    PRIMARY KEY(ID),

    FOREIGN KEY (ID)	REFERENCES People(ID)
	ON DELETE CASCADE ON UPDATE CASCADE                                 
)
GO

CREATE TABLE [Staff] (
    ID              INT,

    PRIMARY KEY(ID),

    FOREIGN KEY (ID)	REFERENCES People(ID)
	ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE [Nurse] (
    ID                  INT,

    PRIMARY KEY(ID),
    FOREIGN KEY (ID)	REFERENCES
	People(ID) ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE [Room] (
    ID                  INT                     NOT NULL,
    Capacity            INT                     NOT NULL,
    [Type]				VARCHAR(12)
	CHECK ([Type] = 'normal' OR [Type] = 'emergency' OR [Type] = 'recuperation'),
    [Floor number]      INT                     NOT NULL,
    [Building id]       VARCHAR(5)              NOT NULL,

    PRIMARY KEY (ID, [Floor number], [Building id]),
)
GO

CREATE TABLE [Patient] (
	[Identity number]	INT						UNIQUE,
	[Unique number]		INT                     IDENTITY(100,1),
	[Full name]			VARCHAR(25)				NOT NULL,	Phone				VARCHAR(10),
	[Address]			VARCHAR(50),			
	[Discharge date]	DATE					DEFAULT NULL,
	[Nurses id]			INT						NOT NULL,
	[Delivered from]	VARCHAR(50),
	[Admission date]	DATE					DEFAULT GETDATE()       NOT NULL,
	[Commorbidities]	VARCHAR(50),

	PRIMARY KEY ([Unique number]),

	FOREIGN KEY ([Nurses id])
	REFERENCES Nurse (ID) ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE [Medication] (
	[Unique code]		INT						IDENTITY(1,1),
	[Name]				VARCHAR(50)				NOT NULL,
	Effect				VARCHAR(50),
	Price				MONEY					NOT NULL,
	[Expdate]			DATE                    NOT NULL,
	[Patient number]	INT						NOT NULL,

    PRIMARY KEY ([Unique code]),

    FOREIGN KEY ([Patient number])	REFERENCES Patient([Unique number])
	ON DELETE CASCADE ON UPDATE CASCADE
)
GO

CREATE TABLE [Assign] (
    [Room id]           INT,
    [Floor number]      INT,
    [Building id]       VARCHAR(5),
    [Staff id]          INT,
    [Patient number]    INT,

    PRIMARY KEY ([Patient number]),

    FOREIGN KEY ([Room id], [Floor number], [Building id])
	REFERENCES Room([ID], [Floor number], [Building id])
	ON DELETE CASCADE ON UPDATE CASCADE,

    FOREIGN KEY ([Staff id])
    REFERENCES Staff(ID) ON DELETE CASCADE,

    FOREIGN KEY ([Patient number])
    REFERENCES Patient([Unique number]) ON DELETE NO ACTION,
)
GO

CREATE TABLE [Treat] (
    [Doctor id]         INT,
    [Patient number]    INT,
    [Start date]        DATE					DEFAULT GETDATE()		NOT NULL,
    [End date]          DATE					DEFAULT NULL,
    Result              VARCHAR(50),

    PRIMARY KEY ([Doctor id], [Patient number]),

    FOREIGN KEY ([Doctor id])	REFERENCES Doctor(ID)
	ON DELETE NO ACTION ON UPDATE NO ACTION,

    FOREIGN KEY ([Patient number])
    REFERENCES Patient([Unique number])
	ON DELETE NO ACTION ON UPDATE NO ACTION,
)
GO

CREATE TABLE [Tests] (
	[Date]				DATE			DEFAULT GETDATE(),
	[PCR test]			VARCHAR(10)		DEFAULT NULL
	CHECK([PCR test] = 'Positive' OR [PCR test] = 'Negative'),
	[Quick test]		VARCHAR(10),
	SPO2				INT,
	Respiratory			VARCHAR(50),
	Warning				VARCHAR(10),
	[CT value]			INT,
	[Patient number]	INT,

	FOREIGN KEY ([Patient number])	REFERENCES Patient ([Unique number])
	ON DELETE NO ACTION ON UPDATE CASCADE
)
GO

CREATE TABLE [Track] (
	[Symptom]			VARCHAR(50),
	[Date]				DATE			DEFAULT GETDATE(),
	[Patient number]	INT,

	FOREIGN KEY ([Patient number])	REFERENCES Patient ([Unique number])
	ON DELETE NO ACTION ON UPDATE CASCADE
)
GO

CREATE TABLE [Location History] (
	[Patient number]	INT,
	Locations			VARCHAR(50),

	FOREIGN KEY ([Patient number])	REFERENCES Patient ([Unique number])
	ON DELETE NO ACTION ON UPDATE CASCADE
)
GO

------------------------------------------------------------------------
-- INSERT DATA --
-- INSERT PEOPLE --
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Mark Goldbridge','M','2382848321','1013 Brown Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Henry Marshaw','M','2543828481','1172 Hickory Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('David Smith','M','8017304665','1096 Hickory Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Douglas Brown','M','9898351644','4318 Juniper Drive')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Maria Johnson','F','7572575831','569 Kildeer Drive')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('John Castle','M','3053330512','2350 Tyler Avenue')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Robert Stones','M','4156822413','357 Boring Lane')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Wanda Johnson','F','8033041699','3215 Wexford Way')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Frank Castle','M','4409888261','1208 Flynn Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Scott Atkinson','M','3055187614','4019 Poplar Lane')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Mary Bergin','F','2163620851','2711 Glenwood Avenue')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Lilly Teague','F','3125714777','4846 Patterson Fork Road')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Wendy Byrde','F','3055952620','1295 Poplar Lane')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Marty Byrde','M','4082533833','4830 Hide A Way Road')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Ruth Langmore','F','6128596428','1818 Rocket Drive')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Omar Navarro','M','5033143614','4321 Watson Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Helen Pierce','F','9164010999','2234 Pearl Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Petty Moore','M','5303788087','1634 Riverwood Drive')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Matt Murdock','M','3042771891','4572 Froe Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Jayson Williams','M','7742845302','4043 Oak Way')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Adam Zapel','M','3465871156','6314 Oak Way')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Barb E. Dahl','M','7411123549','3432 Watson Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Biff Wellington','M','9865656233','3332 Poplar Lane')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Jack Pott','M','7981546346','297 Boring Lane')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Earl E. Bird','M','1133456217','716 Juniper Drive')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Agnes Pierce','F','9456315487','2103 Juniper Drive')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Ellis Collins ','F','2389716786','862 Maddox Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Marie Lopez','F','2234876412','441 Riverwood Drive')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Bethany Howard','F','7439216931','619 Abbey Road')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Hollie Reid','F','3541275129','123 Carnaby Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Paige Brown','F','4243651975','2031 Carnaby Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Kyla Russell','F','7576213491','1421 Monument Road')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Niall Doyle','M','7112978412','753 Monument Road')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Ralph Roberts','M','4131423691','2424 Shaftesbury Avenue')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Frederick Jenkins','M','9634789741','477 Downing Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Isaiah Griffin','M','3211467913','79 Manciple Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Haris Cook','M','3974136491','793 Newgate Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Kelly Kelly','M','4741369236','2333 Fleet Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Brett Cruz','M','3126431387','631 Fleet Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Aaron Miller','M','1349178643','346 Charterhouse Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Erica Mccarthy','M','7134615965','953 Waterloo Road')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Conner Powell','M','2645935731','1469 Lambeth Road')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Farhan Wright','M','4136514275','2310 Eagle Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Harley Garcia','M','5469713523','553 Brooke Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Erik Griffiths','M','3549135678','1532 Great Ormond Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Robbie Owen','M','3123649785','346 Portpool Lane')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Omar Murray','M','4231658712','691 Cole Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Omar Murray','M','4789145236','72 Cole Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Alec Murphy','M','3124678561','113 Heygate Street')
GO
INSERT INTO [dbo].[People]  ([Full name],[Gender],[Phone],[Address])
VALUES  ('Eddie Graham','M','1975843611','113 Rodney Road')
GO

-- INSERT HEAD DOCTOR --
INSERT INTO [dbo].[Head doctor] VALUES (1000)
GO

-- INSERT DOCTOR --
INSERT INTO [dbo].[Doctor] VALUES (1000)
GO
INSERT INTO [dbo].[Doctor] VALUES (1001)
GO
INSERT INTO [dbo].[Doctor] VALUES (1002)
GO
INSERT INTO [dbo].[Doctor] VALUES (1003)
GO
INSERT INTO [dbo].[Doctor] VALUES (1004)
GO

-- INSERT NURSE --
INSERT INTO [dbo].[Nurse] VALUES (1005)
GO
INSERT INTO [dbo].[Nurse] VALUES (1006)
GO
INSERT INTO [dbo].[Nurse] VALUES (1007)
GO
INSERT INTO [dbo].[Nurse] VALUES (1008)
GO
INSERT INTO [dbo].[Nurse] VALUES (1009)
GO

-- INSERT ROOM --
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (1,3,'normal',1,'A')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (2,3,'emergency',1,'A')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (3,3,'recuperation',1,'A')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (1,3,'normal',2,'A')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (2,3,'emergency',2,'A')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (3,3,'recuperation',2,'A')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (1,3,'normal',1,'B')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (2,3,'emergency',1,'B')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (3,3,'recuperation',1,'B')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (1,3,'normal',2,'B')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (2,3,'emergency',2,'B')
GO
INSERT INTO [dbo].[Room]    ([ID],[Capacity],[Type],[Floor number],[Building id])
VALUES  (3,3,'recuperation',2,'B')
GO

-- INSERT PATIENT --
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1125,'Ruth Langmore','6128596428','1818 Rocket Drive','20211101',1008,'Sai Gon','20211027','Healthy')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1126,'Omar Navarro','5033143614','4321 Watson Street','20211101',1005,'A201','20211010', 'Asthma, Arthritis')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1127,'Helen Pierce','9164010999','2234 Pearl Street','20211103',1009,'A203','20211012','Healthy')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1128,'Petty Moore','5303788087','1634 Riverwood Drive','20211103',1009,'A103','20211012', 'Stroke, Cardiovascular disease')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1129,'Matt Murdock','3042771891','4572 Froe Street','20211027',1005,'A103','20211009','Asthma, Hypertension')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1130,'Jayson Williams','7742845302','4043 Oak Way','20211101',1005,'A103','20211015','Healthy')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1131,'Frank Lampard','6723984624','3542 Abbey Road','20211030',1009,'A301','20211014','Healthy')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1132,'Peter Cech','7443194412','1002 Carnaby Street','20211113',1008,'A201','20211025','Asthma')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1133,'Wayne Rooney','3546971122','1354 Cranbourn Street','20211120',1005,'A301','20211105','Healthy')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1134,'Paul School','4653987516','1056 Shaftesbury Avenue','20211107',1008,'A103','20211013', 'Cardiovascular disease, Stroke')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1135,'Steven Gerard','7896315216','3049 Maddox Street','20211105',1005,'A203','20211015','Pneumonia, Sleep apnea, Hypertension')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1136,'Asley Cole','7778462112','1112 Teignmouth Road','20211107',1008,'A103','20211021','Healthy')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1137,'Christian Benteke','4231648956','2640 Ruby Street','20211113',1009,'A301','20211028','Healthy')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1138,'Peter Crouch','1341688946','1955 Woodford Avenue','20211117',1005,'A203','20211023', 'Pneumonia, Hypertension, Dyslipidemia' )
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1139,'Selena Harmony','6794134466','3146 Monument Road','20211106',1005,'A103','20211021','Healthy')
GO
INSERT INTO [dbo].[Patient]([Identity number],[Full name],[Phone],[Address],[Discharge date],[Nurses id],[Delivered from],[Admission date],[Commorbidities])
VALUES  (1140,'Miley Senestria','3461782612','1777 Rochester Way','20211104',1008,'A203','20211018','Asthma')
GO

-- INSERT TESTS --
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211027','Positive','Positive',98,'Normal','Level 0',28,100) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211031','Negative','Negative',98,'Normal','Level 0',32,100) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211101','Negative','Negative',99,'Normal','Level 0',33,100) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211010','Positive','Positive',93,'Abnormal - Asthma','Level 2',25,101) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211015','Positive','Positive',94,'Abnormal - Asthma','Level 1',27,101) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211031','Negative','Negative',98,'Normal','Level 0',31,101) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211101','Negative','Negative',97,'Normal','Level 0',34,101) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211012','Positive','Positive',98,'Normal','Level 0',28,102) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211102','Negative','Negative',99,'Normal','Level 0',32,102) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211103','Negative','Negative',100,'Normal','Level 0',33,102) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211012','Positive','Positive',92,'Abormal - Congestive heart failure','Level 3',26,103) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211015','Positive','Positive',94,'Abormal - Congestive heart failure','Level 3',27,103) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211102','Negative','Negative',98,'Normal','Level 0',30,103) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211103','Negative','Negative',101,'Normal','Level 0',32,103) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211009','Positive','Positive',95,'Abnormal - asthma','Level 1',25,104) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211016','Positive','Positive',96,'Abnormal - asthma','Level 1',26,104) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211026','Negative','Negative',98,'Normal','Level 0',31,104) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211027','Negative','Negative',99,'Normal','Level 0',35,104) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211015','Positive','Positive',97,'Normal','Level 0',25,105) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211031','Negative','Negative',99,'Normal','Level 0',29,105) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211101','Negative','Negative',100,'Normal','Level 0',31,105) 
GO

-- INSERT VOLUNTEER --
INSERT INTO [dbo].[Volunteer] VALUES (1010)
GO
INSERT INTO [dbo].[Volunteer] VALUES (1011)
GO
INSERT INTO [dbo].[Volunteer] VALUES (1012)
GO
INSERT INTO [dbo].[Volunteer] VALUES (1013)
GO
INSERT INTO [dbo].[Volunteer] VALUES (1014)
GO
INSERT INTO [dbo].[Volunteer] VALUES (1015)
GO
INSERT INTO [dbo].[Volunteer] VALUES (1016)
GO
INSERT INTO [dbo].[Volunteer] VALUES (1017)
GO
INSERT INTO [dbo].[Volunteer] VALUES (1018)
GO
INSERT INTO [dbo].[Volunteer] VALUES (1019)
GO

-- INSERT MANAGER --
INSERT INTO [dbo].[Manager] VALUES (1020)
GO
INSERT INTO [dbo].[Manager] VALUES (1021)
GO
INSERT INTO [dbo].[Manager] VALUES (1022)
GO
INSERT INTO [dbo].[Manager] VALUES (1023)
GO

-- INSERT Staff --
INSERT INTO [dbo].[Staff] VALUES (1024)
GO
INSERT INTO [dbo].[Staff] VALUES (1025)
GO
INSERT INTO [dbo].[Staff] VALUES (1026)
GO
INSERT INTO [dbo].[Staff] VALUES (1027)
GO
INSERT INTO [dbo].[Staff] VALUES (1028)
GO
INSERT INTO [dbo].[Staff] VALUES (1029)
GO
INSERT INTO [dbo].[Staff] VALUES (1030)
GO
INSERT INTO [dbo].[Staff] VALUES (1031)
GO
INSERT INTO [dbo].[Staff] VALUES (1032)
GO
INSERT INTO [dbo].[Staff] VALUES (1033)
GO
INSERT INTO [dbo].[Staff] VALUES (1034)
GO
INSERT INTO [dbo].[Staff] VALUES (1035)
GO
INSERT INTO [dbo].[Staff] VALUES (1036)
GO
INSERT INTO [dbo].[Staff] VALUES (1037)
GO
INSERT INTO [dbo].[Staff] VALUES (1038)
GO
INSERT INTO [dbo].[Staff] VALUES (1039)
GO
INSERT INTO [dbo].[Staff] VALUES (1040)
GO

-- INSERT MEDICATION --
INSERT INTO [dbo].[Medication] ([Name],[Effect],[Price],[Expdate],[Patient number])
VALUES ('Thiazide Diuretic','Control high blood pressure','$8', '20231231',100)
GO
INSERT INTO [dbo].[Medication] ([Name],[Effect],[Price],[Expdate],[Patient number])
VALUES ('Aspirin','Reduces blood clotting','$9.75', '20220630',101)
GO
INSERT INTO [dbo].[Medication] ([Name],[Effect],[Price],[Expdate],[Patient number])
VALUES ('Angiotensin-converting enzyme','Relax the veins','$9', '20230630',105)
GO
INSERT INTO [dbo].[Medication] ([Name],[Effect],[Price],[Expdate],[Patient number])
VALUES ('Levofloxacin','Treat infections','$11.7', '20231231',102)
GO
INSERT INTO [dbo].[Medication] ([Name],[Effect],[Price],[Expdate],[Patient number])
VALUES ('Fluticasone','Treat allergic rhinitis','$14.13', '20221231',103)
GO

-- INSERT TEST --
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211027','Positive','Positive',98,'Normal','Level 0',28,100) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211031','Negative','Negative',98,'Normal','Level 0',32,100) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211101','Negative','Negative',99,'Normal','Level 0',33,100) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211010','Positive','Positive',93,'Abnormal - Asthma','Level 1',25,101) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211015','Positive','Positive',94,'Abnormal - Asthma','Level 1',27,101) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211031','Negative','Negative',98,'Normal','Level 0',31,101) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211101','Negative','Negative',97,'Normal','Level 0',34,101) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211012','Positive','Positive',98,'Normal','Level 0',28,102) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211102','Negative','Negative',99,'Normal','Level 0',32,102) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211103','Negative','Negative',100,'Normal','Level 0',33,102) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211012','Positive','Positive',92,'Abormal - Congestive heart failure','Level 3',26,103) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211015','Positive','Positive',94,'Abormal - Congestive heart failure','Level 3',27,103) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211102','Negative','Negative',98,'Normal','Level 0',30,103) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211103','Negative','Negative',101,'Normal','Level 0',32,103) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211009','Positive','Positive',95,'Abnormal - asthma','Level 1',25,104) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211016','Positive','Positive',96,'Abnormal - asthma','Level 1',26,104) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211026','Negative','Negative',98,'Normal','Level 0',31,104) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211027','Negative','Negative',99,'Normal','Level 0',35,104) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211015','Positive','Positive',97,'Normal','Level 0',25,105) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211031','Negative','Negative',99,'Normal','Level 0',29,105) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211101','Negative','Negative',100,'Normal','Level 0',31,105) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211014','Positive','Positive',99,'Normal','Level 0',29,106) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211029','Negative','Negative',99,'Normal','Level 0',32,106) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211030','Negative','Negative',101,'Normal','Level 0',33,106) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211025','Positive','Positive',96,'Abnormal - asthma','Level 1',26,107) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211112','Negative','Negative',97,'Abnormal - asthma','Level 1',33,107) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211113','Negative','Negative',99,'Abnormal - asthma','Level 1',34,107) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211105','Positive','Positive',99,'Normal','Level 0',27,108) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211119','Negative','Negative',100,'Normal','Level 0',31,108) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211120','Negative','Negative',100,'Normal','Level 0',33,108) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211013','Positive','Positive',94,'Abormal - Congestive heart failure','Level 3',22,109) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211020','Positive','Positive',95,'Abormal - Congestive heart failure','Level 3',23,109) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211027','Positive','Positive',96,'Abormal - Congestive heart failure','Level 3',25,109) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211106','Negative','Negative',99,'Normal','Level 0',31,109) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211107','Negative','Negative',100,'Normal','Level 0',33,109) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211015','Positive','Positive',95,'Abnormal - Pneumonia','Level 2',23,110) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211022','Positive','Positive',96,'Abnormal - Pneumonia','Level 2',25,110) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211104','Negative','Negative',98,'Normal','Level 0',32,110) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211105','Negative','Negative',99,'Normal','Level 0',32,110) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211021','Positive','Positive',98,'Normal','Level 0',28,111) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211106','Negative','Negative',99,'Normal','Level 0',34,111) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211107','Negative','Negative',101,'Normal','Level 0',35,111) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211028','Positive','Positive',99,'Normal','Level 0',27,112) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211112','Negative','Negative',100,'Normal','Level 0',30,112) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211113','Negative','Negative',99,'Normal','Level 0',31,112) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211023','Positive','Positive',94,'Abnormal - Pneumonia','Level 2',23,113) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211030','Positive','Positive',95,'Abnormal - Pneumonia','Level 2',24,113) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211116','Negative','Negative',98,'Normal','Level 0',32,113) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211117','Negative','Negative',99,'Normal','Level 0',33,113) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211021','Positive','Positive',98,'Normal','Level 0',27,114) 
GO 
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211105','Negative','Negative',100,'Normal','Level 0',30,114) 
GO
INSERT INTO [dbo].[Tests] ([Date],[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value],[Patient number]) 
VALUES  ('20211106','Negative','Negative',100,'Normal','Level 0',32,114) 
GO 

-- INSERT ASSIGN --
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,1,'A',1029,100)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,1,'A',1024,101)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,1,'A',1025,102)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (3,1,'A',1030,103)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,2,'A',1026,104)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,2,'A',1025,105)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,2,'A',1027,106)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,2,'A',1025,107)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,2,'A',1031,108)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (2,2,'A',1028,109)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,1,'B',1034,110)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,2,'B',1037,111)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,2,'B',1040,112)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (3,1,'B',1039,113)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,1,'B',1034,114)
GO
INSERT INTO [dbo].[Assign] ([Room id],[Floor number],[Building id],[Staff id],[Patient number])
VALUES (1,2,'B',1035,115)
GO


-- INSERT LOCATION HISTORY
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (100,'1.1A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (101,'1.1A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (102,'1.1A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (103,'3.1A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (103,'2.1A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (103,'1.2A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (104,'1.2A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (105,'1.2A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (106,'1.3A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (107,'1.3A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (108,'1.4A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (109,'3.2A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (109,'2.2A')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (109,'1.1B')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (110,'1.1B')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (111,'1.2B')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (112,'1.2B')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (113,'3.1B')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (113,'2.1B')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (113,'1.3B')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (114,'1.3B')
GO
INSERT INTO [dbo].[Location History] ([Patient number],Locations)
VALUES (115,'1.4B')
GO

-- INSERT TREAT --
INSERT INTO [dbo].[Treat] ([Doctor id],[Patient number],[Start date],[End date],Result)
VALUES (1000,101,'20211015','20211020','Successful')
GO
INSERT INTO [dbo].[Treat] ([Doctor id],[Patient number],[Start date],[End date],Result)
VALUES (1000,104,'20211016','20211022','Successful')
GO
INSERT INTO [dbo].[Treat] ([Doctor id],[Patient number],[Start date],[End date],Result)
VALUES (1001,107,'20211025','20211031','Successful')
GO
INSERT INTO [dbo].[Treat] ([Doctor id],[Patient number],[Start date],[End date],Result)
VALUES (1001,115,'20211018','20211023','Successful')
GO
INSERT INTO [dbo].[Treat] ([Doctor id],[Patient number],[Start date],[End date],Result)
VALUES (1003,103,'20211012','20211023','Successful')
GO
INSERT INTO [dbo].[Treat] ([Doctor id],[Patient number],[Start date],[End date],Result)
VALUES (1004,109,'20211013','20211025','Successful')
GO
INSERT INTO [dbo].[Treat] ([Doctor id],[Patient number],[Start date],[End date],Result)
VALUES (1002,110,'20211015','20211023','Successful')
GO
INSERT INTO [dbo].[Treat] ([Doctor id],[Patient number],[Start date],[End date],Result)
VALUES (1002,113,'20211023','20211101','Successful')
GO

-- INSERT TRACK --
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Cough, Headache','20211030',100)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Fast heartbeat, Wheezing','20211015',101)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Cough','20211020',101)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Headache, Sore throat','20211012',102)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Difficulty breathing','20211015',103)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Headache','20211022',103)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Cough, Headache','20211012',104)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Headache, Diarrhea','20211018',105)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Cough, Headache','20211017',106)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Fast heartbeat, Wheezing','20211028',107)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Headache, Diarrhea','20211108',108)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fatigue, Irregular heartbeat','20211016',109)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Headache','20211026',109)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Sweating, Shivering, difficulty breathing','20211018',110)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Cough,','20211028',110)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Cough, Headache','20211024',111)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Cough, Headache','20211031',112)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Sweating, Shivering, Headache','20211026',113)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Headache','20211024',114)
GO
INSERT INTO [dbo].[Track] ([Symptom],[Date],[Patient number])
VALUES ('Fever, Fast heartbeat, Wheezing','20211021',115)
GO

USE [Quaratine Camp]
GO

-- a)
UPDATE
	[dbo].[Tests]
SET
	[PCR test] = 'Positive',
	[CT value] = NULL
WHERE
	[Date] >= '2020-01-09'
GO

-- b)
SELECT *
FROM
	[dbo].[Patient]
WHERE
	[Full name] = 'Nguyen Van A'
GO

-- c)
CREATE FUNCTION CalculateTesting (@PatientID INT)
RETURNS TABLE
AS
RETURN (
	SELECT
		[Date],[Identity number],[Unique number],[Full name],
		[PCR test],[Quick test],[SPO2],[Respiratory],[Warning],[CT value]
	FROM 
		[dbo].[Tests] AS test INNER JOIN [dbo].[Patient] AS patient
		ON (test.[Patient number] = patient.[Unique number])
	WHERE
		patient.[Identity number] = @PatientID
)
GO

-- d)
CREATE PROCEDURE Sort_Nurses
	@Start DATE,
	@End DATE
AS BEGIN
	WITH temp AS
	(SELECT 
		[Nurses id],
		COUNT(*) AS patient_count
	FROM
		[Nurse] AS n INNER JOIN [Patient] AS p 
		ON n.[ID] = p.[Nurses id]
	WHERE
		p.[Admission date] >= @Start
		AND p.[Discharge date] <= @End
	GROUP BY 
		[Nurses id])
	SELECT [ID],[Full name],[Gender],[Phone],[Address],[patient_count]
	FROM
		temp INNER JOIN [People] AS p ON temp.[Nurses id] = p.[ID]
	ORDER BY
		[patient_count] DESC;
END

----------------------------------------------------------------------

SELECT * FROM CalculateTesting(1125)
EXEC Sort_Nurses @Start='2021-10-09', @End='2021-11-01';