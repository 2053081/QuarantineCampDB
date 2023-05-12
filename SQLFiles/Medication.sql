USE [Quaratine Camp]
GO

--- 1st Patient ---
INSERT INTO [dbo].[Medication]
           ([Unique_code]
           ,[Name_]
           ,[Effect]
           ,[Price]
           ,[Exp_date]
           ,[Pa_number])
     VALUES
           (200
           ,'Paracetamol'
           ,'Pain killer'
           ,35000
           ,'20240101'
           ,100)

INSERT INTO [dbo].[Medication]
           ([Unique_code]
           ,[Name_]
           ,[Effect]
           ,[Price]
           ,[Exp_date]
           ,[Pa_number])
     VALUES
           (201
           ,'Vitamin C'
           ,'Enhance Immunity'
           ,50000
           ,'20240110'
           ,100)	

INSERT INTO [dbo].[Medication]
           ([Unique_code]
           ,[Name_]
           ,[Effect]
           ,[Price]
           ,[Exp_date]
           ,[Pa_number])
     VALUES
           (202
           ,'Acetaminophen '
           ,'Reduce fever'
           ,30000
           ,'20240202'
           ,100)
INSERT INTO [dbo].[Medication]
           ([Unique_code]
           ,[Name_]
           ,[Effect]
           ,[Price]
           ,[Exp_date]
           ,[Pa_number])
     VALUES
           (203
           ,'Vitamin D '
           ,'Maintenance of phosphorus levels in the blood'
           ,250000
           ,'20240202'
           ,100)
