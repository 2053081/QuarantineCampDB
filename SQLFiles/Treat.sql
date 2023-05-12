USE [Quaratine Camp]
GO

--- First Doctor ---
INSERT INTO [dbo].[Treat]
           ([Doctor_id]
           ,[Pa_number]
           ,[Startdate]
           ,[Enddate]
           ,[Result])
     VALUES
           (1118
           ,100
           ,'20211027'
           ,'20211101'
           ,'Treated')

INSERT INTO [dbo].[Treat]
           ([Doctor_id]
           ,[Pa_number]
           ,[Startdate]
           ,[Enddate]
           ,[Result])
     VALUES
           (1118
           ,101
           ,'20211010'
           ,'20211101'
           ,'Treated')

--- Second Doctor ---
INSERT INTO [dbo].[Treat]
           ([Doctor_id]
           ,[Pa_number]
           ,[Startdate]
           ,[Enddate]
           ,[Result])
     VALUES
           (1119
           ,102
           ,'20211012'
           ,'20211103'
           ,'Treated')

INSERT INTO [dbo].[Treat]
           ([Doctor_id]
           ,[Pa_number]
           ,[Startdate]
           ,[Enddate]
           ,[Result])
     VALUES
           (1119
           ,103
           ,'20211012'
           ,'20211103'
           ,'Treated')

--- Third Doctor ---
INSERT INTO [dbo].[Treat]
           ([Doctor_id]
           ,[Pa_number]
           ,[Startdate]
           ,[Enddate]
           ,[Result])
     VALUES
           (1120
           ,104
           ,'20211009'
           ,'20211027'
           ,'Treated')

INSERT INTO [dbo].[Treat]
           ([Doctor_id]
           ,[Pa_number]
           ,[Startdate]
           ,[Enddate]
           ,[Result])
     VALUES
           (1120
           ,105
           ,'20211015'
           ,'20211101'
           ,'Treated')