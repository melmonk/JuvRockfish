/****** SQL code for looking a juvenile rockfish data
        Melissa Monk, NMFS SWFSC
		
 ******/

 --Number of individual adults for species or use this search for anyhting else you want summary info for
SELECT distinct species_codes.SPECIES, common_name, SCI_NAME, MATURITY, sum(total_no) as sum_total
  FROM [juv_rockfish].[dbo].[JUV_CATCH]
  inner join species_codes on juv_catch.species=species_codes.species
  where maturity like 'U' and common_name like 'krill'
  group by species_codes.SPECIES, common_name, MATURITY, sci_name
  order by common_name


--Pull all juvenile rockfish catch data
--Catch data
Select JUV_HAUL.CRUISE,
	   JUV_HAUL.HAUL_NO,
	   JUV_CATCH.SPECIES,
	   SPECIES_CODES.COMMON_NAME,
	   MATURITY,
	   JUV_CATCH.TOTAL_NO
 from JUV_HAUL
			right join	JUV_CATCH on JUV_HAUL.CRUISE=JUV_CATCH.CRUISE and JUV_HAUL.HAUL_NO=JUV_CATCH.HAUL_NO
            inner join 	SPECIES_CODES on JUV_CATCH.SPECIES=SPECIES_CODES.SPECIES
where TOTAL_NO is not null
   and not (JUV_CATCH.SPECIES in (71,616,272,582,572,466,670,601,494,387,469,1516,595,704,442,448,655,638,
									629,2412,382,159,564,147,212,438,253,492,443,512,573,636,604,637,
									440,364,453,615,148,594,487,627,597,31,599)
			 and MATURITY like 'A')
   and PROBLEM not in (4,5,6,7,8)
   and not (PROBLEM=0 and STANDARD_STATION=0)
   


