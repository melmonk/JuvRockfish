/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [SPECIES]
      ,[COMMON_NAME]
      ,[SCI_NAME]
      ,[PACFIN_CODE]
      ,[MATURITY_CODES]
      ,[SPECIES_GROUP]
      ,[NOTES]
  FROM [juv_rockfish].[dbo].[SPECIES_CODES]
  where species_group in (  'gelatinous','jellyfish')
  order by species