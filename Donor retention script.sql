CREATE PROCEDURE DONORRETENTION(@enddate VARCHAR(10)  = '01/01/1800')
AS
DECLARE @NADfirstdonationofcommitmentplan  TABLE (rvngroupid INT,firstdonation VARCHAR(11))
Insert into @NADfirstdonationofcommitmentplan
select rvngroup.rvngroupid, min(revenue.RvnDate) as firstdonation
from revenue, rvngroup, rvngrpitem
where revenue.FlgRvnType1ID = 207
and revenue.revenueid = rvngrpitem.RevenueID
and RvnGrpItem.RvnGroupID = RvnGroup.RvnGroupID
and rvngroup.RvnGrpType = 24
and revenue.FlgRvnStatusID = 222
and revenue.Archived = 0 
and rvngroup.Archived = 0
and RvnGrpItem.Archived = 0
and reversal = 0 and revenue.revenueid not in
(select ClnParentID from revenue where ClnParentID <> 0)
group by rvngroup.RvnGroupID 



DECLARE @NADfirstdonationofcommitmentplan2  TABLE (rvngroupid INT,Entfromid INT, FDMNTH VARCHAR(20), FDYR VARCHAR(40), DMNTH VARCHAR(20), DYR VARCHAR(40), RVNAMOUNT INT)

INSERT INTO @NADfirstdonationofcommitmentplan2

select rvngroup.rvngroupid, rvngroup.entfromid,month(convert(date,firstdonation,103)) as attmonth, Year(convert(date,firstdonation,103)) as attyear, 
month(revenue.rvndate) as donationmonth, year(revenue.rvndate) as donationyear,
revenue.rvnamount 
from rvngroup, @NADfirstdonationofcommitmentplan as stdt, rvngrpitem, revenue, RvnISPlan
where rvngrptype= 24
and rvngroup.rvngroupid = stdt.RvnGroupID
and rvngroup.rvngroupid = rvngrpitem.RvnGroupID
and rvngrpitem.revenueid = revenue.revenueid 
and rvnisplan.rvngroupid = rvngroup.rvngroupid 
and rvngroup.archived = 0 
and revenue.archived = 0
and revenue.flgrvnstatusid = 222
and FlgIntervalID = 251
and reversal = 0 and revenue.revenueid not in
(select ClnParentID from revenue where ClnParentID <> 0)


update attribute
set attmonth = '0' + attmonth
 where len(attmonth) = 1



select count(rvngroupid), attribute.attyear, attmonth from rvngroup, attribute 
where rvngroup.rvngroupid = attribute.parentid 
and attfieldid = 1190
and rvngroup.RvnGrpType = 24
and attyear > 2017 
and rvngroup.Archived = 0
and rvngroupid not in
(select rvngroupid from RvnGrpItem where rvngrpitem.Archived = 0)
group by attribute.attyear, attmonth
order by attyear, attmonth

CREATE VIEW [dbo].[vwNADDonorlosstrackingYear] AS
select rvngroup.rvngroupid, rvngroup.entfromid,rvngrpamount, month(firstdonation) as attmonth, Year(stdt.firstdonation) as attyear, 
month(revenue.rvndate) as donationmonth, year(revenue.rvndate) as donationyear,
revenue.rvnamount 
from rvngroup, NADfirstdonationofcommitmentplan2 as stdt, rvngrpitem, revenue, RvnISPlan
where rvngrptype= 24
and rvngroup.rvngroupid = stdt.RvnGroupID
and rvngroup.rvngroupid = rvngrpitem.RvnGroupID
and rvngrpitem.revenueid = revenue.revenueid 
and rvnisplan.rvngroupid = rvngroup.rvngroupid 
and rvngroup.archived = 0 
and revenue.archived = 0
and revenue.flgrvnstatusid = 222
and reversal = 0 and revenue.revenueid not in
(select ClnParentID from revenue where ClnParentID <> 0)


select * from vwNADDonorlosstracking where attmonth = 12 and donationmonth = 2

order by entfromid, donationmonth

select * from rvngroup where rvngroupid = 2236

--and (Year(stdt.firstdondate) = YEAR(getdate())-1 and month(stdt.firstdondate) > MONTH(getdate())-1)
--or (year(stdt.firstdondate) = year(getdate())) and month(stdt.firstdondate) < month(getdate())

CREATE VIEW [dbo].[vwNADDonorlosstrackingYr] AS
select rvngroup.rvngroupid, rvngroup.entfromid,rvngrpamount, attyear, 
year(revenue.rvndate) as donationyear,
revenue.rvnamount 
from rvngroup, attribute as stdt, rvngrpitem, revenue, rvnisplan
where rvngrptype= 24
and rvngroup.rvngroupid = stdt.ParentID
and rvngroup.rvngroupid = rvngrpitem.RvnGroupID
and rvngrpitem.revenueid = revenue.revenueid 
and rvnisplan.rvngroupid = rvngroup.rvngroupid 
and stdt.AttFieldID = 1190  -- startdate attribute
and (stdt.attyear > 2013 )
and (stdt.attyear < 2020 )
and year(revenue.rvndate)  > YEAR(getdate())-6 
and year(revenue.rvndate)  < YEAR(getdate())

-----add that transaction channel = debit order.

select * from RvnISPlan

select * from entity where entityid = 70056


select count(distinct entfromid) as donorcount, sum(rvnamount) 
as totaldon,  attmonth,donationmonth, attyear , donationyear
from NADDonorlosstracking
group by attmonth, donationmonth,attyear , donationyear 
order by attyear, attmonth 


select count(distinct entfromid) as donorcount, sum(rvnamount) as totdonations,  
attyear,donationyear from vwNADDonorlosstrackingyear
group by attyear, donationyear
order by attyear

select count(rvngroup.RvnGroupID), stdt.attmonth, stdt.AttYear 
from rvngroup, attribute as stdt 
where rvngrptype= 24 and rvngroup.archived = 0
and rvngroup.rvngroupid = stdt.parentid and stdt.AttFieldID = 1190
and ((stdt.attyear = 2018 and stdt.attmonth > 6)
or ( stdt.attyear= 2019 and stdt.attmonth < 7))

and rvngroupid not in
(Select rvngrpitem.rvngroupid from rvngrpitem,revenue where 
revenue.archived =0 and rvngrpitem.Archived = 0 
and revenue.FlgRvnStatusID = 222 and rvngrpitem.revenueid = revenue.revenueid)

group by stdt.attmonth, stdt.AttYear 


select * from entity where entityid = 59877

update attribute
set attmonth = 09
where attmonth = 9

select * from vwNADDonorlosstracking

select * from revenue where flgrvntype1id = 207 order by rvnamount


and reversal = 0 and revenueid not in
(select ClnParentID from revenue where ClnParentID <> 0)
 

 select * from RvnISPlan

select * from flag where flagid = 251

select * from rvngroup where rvngroupid = 37493
select * from entity where entityid = 72069


--ALTER VIEW [dbo].[VWNADfirstdonationofcommitmentplan]
--AS
--select rvngroup.rvngroupid, min(revenue.RvnDate) as firstdonation
--from revenue, rvngroup, rvngrpitem
--where revenue.FlgRvnType1ID = 207
--and revenue.revenueid = rvngrpitem.RevenueID
--and RvnGrpItem.RvnGroupID = RvnGroup.RvnGroupID
--and rvngroup.RvnGrpType = 24
--and revenue.FlgRvnStatusID = 222
--and revenue.Archived = 0 
--and rvngroup.Archived = 0
--and RvnGrpItem.Archived = 0
--and reversal = 0 and revenue.revenueid not in
--(select ClnParentID from revenue where ClnParentID <> 0)
--group by rvngroup.RvnGroupID


 exec DONORRETENTION '30/05/2019'