--This one is the final one!!!
CREATE PROCEDURE DONORCOUNT(@enddate VARCHAR(10)  = '01/01/1800')
AS
DECLARE @NADDonorDonationsLY  TABLE (entityid INT, rvnamount float, rvndate date, f2f varchar(3))
INSERT into @NADDonorDonationsLY 
select revenue.entfromid as entityid, revenue.rvnamount, rvndate, f2f=
case when revenue.EntCampaignID in (select entityid from entproject where entparentid = 69343) then 'f2f'
when revenue.EntCampaignID in (select entityid from entproject where entparentid = 61006) then 'f2f' end 
from revenue
where  

rvndate > DATEADD(year, -2, CONVERT(date, @enddate, 103)) and rvndate <= CONVERT(date, @enddate, 103)
and flgrvntype1id = 207 and flgrvnstatusid = 222 
and revenue.archived = 0 and revenue.revenueid in
(select rvngrpitem.revenueid from  rvngroup, rvngrpitem  
where rvngroup.RvnGrpType = 24 and rvngroup.archived = 0
and rvngroup.rvngroupid = rvngrpitem.rvngroupid)
and rvnamount > 0
and revenue.revenueid not in
(select ClnParentID from revenue where ClnParentID <> 0)

--and revenue.EntCampaignID in (126422, 126423)

--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 69343) 

--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 61006) --IE
--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 126421) --UK
--and revenue.entcampaignid = 126421
--select * from @NADDonorDonationsLY





DECLARE @naddonorlastdondateLY  TABLE (entityid INT,lastdonationdate VARCHAR(11))
Insert into @naddonorlastdondateLY
select entityid, max(rvndate) as lastdonationdate
from @NADDonorDonationsLY
group by entityid 

DECLARE @NADINddonationgroupLY  TABLE (entityid INT,rvnamount Float, inddonorgroup varchar(20),rvndate varchar(11), f2f varchar(3))
Insert into @NADINddonationgroupLY
select entityid, rvnamount,
inddonorgroup=
case when rvndate  > DATEADD(year, -1,convert(date,@enddate,103)) and rvndate <= convert(date,@enddate,103) then 'last 12 months'
when  rvndate > DATEADD(year, -5,convert(date,@enddate,103)) and rvndate <= DATEADD(year, -1,convert(date,@enddate,103)) then '13 to 24 months'
end, rvndate , f2f 
from @NADDonorDonationsLY


Declare @NADDonorGroupLY2 TABLE (entityid INT, activedonorgroup varchar(20), lastdonationdate VARCHAR(11))
Insert into @NADDonorGroupLY2 
select entityid, activedonorgroup = 
case when lastdonationdate > DATEADD(year, -1, CONVERT(date, @enddate, 103)) then 'last 12 months'
when  lastdonationdate > DATEADD(year, -2, CONVERT(date, @enddate, 103)) and lastdonationdate <= DATEADD(year, -1, CONVERT(date, @enddate, 103)) then '13 to 24 months'
end, lastdonationdate
from @naddonorlastdondateLY
 


Declare @NADtotalbygroupLY2 TABLE(Entityid INT, totalbygroup float, countbygroup int,inddonorgroup varchar(20), f2f varchar(3))
Insert into @nadtotalbygroupLY2
select entityid, sum(rvnamount) as totalbygroup, count(rvndate) as countbygroup, inddonorgroup, f2f 
from @NADINddonationgroupLY 
group by entityid, inddonorgroup, f2f 



Declare @nadtotalbygroupLY3 TABLE(Entityid INT, totalbygroup float, countbygroup int,inddonorgroup Varchar(20), activedonorgroup varchar(20), f2f varchar(3))
Insert into @nadtotalbygroupLY3
select T1.entityid, totalbygroup, countbygroup , 
inddonorgroup, T2.activedonorgroup, f2f 
from @NADtotalbygroupLY2 T1 inner join @NADDonorGroupLY2 T2
on T1.entityid = T2.entityid 
Where inddonorgroup = T2.activedonorgroup 


 select count(entityid), sum(totalbygroup), f2f, inddonorgroup
 from @nadtotalbygroupLY3
 group by inddonorgroup, f2f 

 DECLARE @NADDonorDonationsTY  TABLE (entityid INT, rvnamount float, rvndate date, f2f varchar(3))
INSERT into @NADDonorDonationsTY 
select revenue.entfromid as entityid, revenue.rvnamount, rvndate, f2f=
case when revenue.EntCampaignID in (select entityid from entproject where entparentid = 69343) then 'f2f'
when revenue.EntCampaignID in (select entityid from entproject where entparentid = 61006) then 'f2f' end 
from revenue
where  

rvndate > '2018-03-31 00:00:00.000' and rvndate <= CONVERT(date, @enddate, 103)
and flgrvntype1id = 207 and flgrvnstatusid = 222 
and revenue.archived = 0 and revenue.revenueid in
(select rvngrpitem.revenueid from  rvngroup, rvngrpitem  
where rvngroup.RvnGrpType = 24 and rvngroup.archived = 0
and rvngroup.rvngroupid = rvngrpitem.rvngroupid)
and rvnamount > 0
and revenue.revenueid not in
(select ClnParentID from revenue where ClnParentID <> 0)


--and revenue.EntCampaignID in (126422, 126423)

--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 69343) 

--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 61006) --IE
--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 126421) --UK
--and revenue.entcampaignid = 126421
--select * from @NADDonorDonationsLY





DECLARE @naddonorlastdondateTY  TABLE (entityid INT,lastdonationdate VARCHAR(11))
Insert into @naddonorlastdondateLY
select entityid, max(rvndate) as lastdonationdate
from @NADDonorDonationsTY
group by entityid 

DECLARE @NADINddonationgroupTY  TABLE (entityid INT,rvnamount Float, inddonorgroup varchar(20),rvndate varchar(11), f2f varchar(3))
Insert into @NADINddonationgroupLY
select entityid, rvnamount,
inddonorgroup=
case when rvndate  > DATEADD(year, -1,convert(date,@enddate,103)) and rvndate <= convert(date,@enddate,103) then 'last 12 months'
when  rvndate > DATEADD(year, -5,convert(date,@enddate,103)) and rvndate <= DATEADD(year, -1,convert(date,@enddate,103)) then '13 to 24 months'
end, rvndate , f2f 
from @NADDonorDonationsTY



--Declare @NADDonorGroupTY2 TABLE (entityid INT, activedonorgroup varchar(20), lastdonationdate VARCHAR(11))
--Insert into @NADDonorGroupTY2 
--select entityid, activedonorgroup = 
--case when lastdonationdate > DATEADD(year, -1, CONVERT(date, @enddate, 103)) then 'last 12 months'
--when  lastdonationdate > DATEADD(year, -2, CONVERT(date, @enddate, 103)) and lastdonationdate <= DATEADD(year, -1, CONVERT(date, @enddate, 103)) then '13 to 24 months'
--end, lastdonationdate
--from @naddonorlastdondateTY
 


--Declare @NADtotalbygroupTY2 TABLE(Entityid INT, totalbygroup float, countbygroup int,inddonorgroup varchar(20), f2f varchar(3))
--Insert into @nadtotalbygroupTY2
--select entityid, sum(rvnamount) as totalbygroup, count(rvndate) as countbygroup, inddonorgroup, f2f 
--from @NADINddonationgroupTY 
--group by entityid, inddonorgroup, f2f 



--Declare @nadtotalbygroupTY3 TABLE(Entityid INT, totalbygroup float, countbygroup int,inddonorgroup Varchar(20), activedonorgroup varchar(20), f2f varchar(3))
--Insert into @nadtotalbygroupTY3
--select T1.entityid, totalbygroup, countbygroup , 
--inddonorgroup, T2.activedonorgroup, f2f 
--from @NADtotalbygroupTY2 T1 inner join @NADDonorGroupTY2 T2
--on T1.entityid = T2.entityid 
--Where inddonorgroup = T2.activedonorgroup 


 select count(distinct entityid), sum(rvnamount), f2f
 from @NADDonorDonationsTY 
 group by f2f 


 exec DONORCOUNT'31/03/2019'

 select * from entity where entityid = 65300

 select * from revenue order by rvnamount 

--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 69343) --NL
--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 61006) --IE
--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 126421) --UK

---and revenue.EntCampaignID in(69401,69497,69498,69499,69500,69501,69502)
---and revenue.EntCampaignID in (59935, 61007, 61008) 
---and revenue.EntCampaignID in (126422, 126423)UK




CREATE PROCEDURE DONORCOUNTNOTCOMMITTED(@enddate VARCHAR(10)  = '01/01/1800')
AS
DECLARE @NADDonorDonations TABLE (revenueid INT,entityid INT, rvnamount float, rvndate date, f2f varchar(3))
INSERT into @NADDonorDonations

select revenueid, revenue.entfromid as entityid, revenue.rvnamount, rvndate, f2f=
case when revenue.EntCampaignID in (select entityid from entproject where entparentid = 69343) then 'f2f'
when revenue.EntCampaignID in (select entityid from entproject where entparentid = 61006) then 'f2f' end 
from revenue
where  rvndate > DATEADD(year, -5, CONVERT(date, @enddate, 103)) and rvndate <= CONVERT(date, @enddate, 103)
and flgrvntype1id = 207 and flgrvnstatusid = 222 
and revenue.archived = 0 and revenue.revenueid not in
(select rvngrpitem.revenueid from  rvngroup, rvngrpitem  
where rvngroup.RvnGrpType = 24 and rvngroup.archived = 0
and rvngroup.rvngroupid = rvngrpitem.rvngroupid)
and rvnamount > 0
and revenue.revenueid not in
(select ClnParentID from revenue where ClnParentID <> 0)
--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 69343)

DECLARE @NADDonorLastdondate  TABLE (entityid INT, lastdonationdate VARCHAR(11))
Insert into @NADDonorLastdondate

select entityid, max(rvndate) as lastdonationdate
from @NADDonorDonations
group by entityid 

DECLARE @NADINddonationgroup  TABLE (entityid INT, rvnamount float, indonorgroup varchar(20),rvndate VARCHAR(11), f2f varchar(3))
Insert into @NADINddonationgroup

select entityid, rvnamount,
inddonorgroup=
case when rvndate > DATEADD(year, -1, CONVERT(date, @enddate, 103)) and rvndate <= CONVERT(date, @enddate, 103) then 'last 12 months'

when  rvndate > DATEADD(year, -2, CONVERT(date, @enddate, 103)) and rvndate <= DATEADD(year, -1, CONVERT(date, @enddate, 103)) then '13 to 24 months'
--when  rvndate > DATEADD(year, -5, CONVERT(date, @enddate, 103)) and rvndate <= DATEADD(year, -2, CONVERT(date, @enddate, 103)) then '25 to 60 months'
end, rvndate, f2f 
from @NADDonorDonations

DECLARE @NADDonorGroup  TABLE (entityid INT, activedonorgroup varchar(20),lastdonationdate VARCHAR(11))
Insert into @NADDonorGroup

select entityid,activedonorgroup = 

case when lastdonationdate > DATEADD(year, -1, CONVERT(date, @enddate, 103)) then 'last 12 months'

when  lastdonationdate > DATEADD(year, -2, CONVERT(date, @enddate, 103)) and lastdonationdate <= DATEADD(year, -1, CONVERT(date, @enddate, 103)) then '13 to 24 months'
--when  lastdonationdate > DATEADD(year, -5, CONVERT(date, @enddate, 103)) and lastdonationdate <= DATEADD(year, -2, CONVERT(date, @enddate, 103)) then '25 to 60 months'
end, lastdonationdate
from @naddonorlastdondate

DECLARE @nadtotalbygroup  TABLE (entityid INT, totalbygroup float, countbygroup int, indonorgroup varchar(20))
insert into @nadtotalbygroup

select entityid, sum(rvnamount) as totalbygroup, count(rvndate) as countbygroup, indonorgroup 
from @NADINddonationgroup
group by entityid, indonorgroup 

DECLARE @nadtotalbygroup2  TABLE (entityid INT, totalbygroup float, countbygroup INT,inddonorgroup VARCHAR(20), activedonorgroup VARCHAR(20))

Insert into @nadtotalbygroup2 
select T1.entityid, totalbygroup, countbygroup , 
indonorgroup, activedonorgroup
from @NADtotalbygroup T1 inner join @NADDonorGroup T2
on T1.entityid = T2.entityid 
and indonorgroup = activedonorgroup 


 select count(entityid), sum(totalbygroup), sum(countbygroup), inddonorgroup
 from @nadtotalbygroup2
 group by inddonorgroup

 DECLARE @NADDonorDonationsTY TABLE (revenueid INT,entityid INT, rvnamount float, rvndate date)
INSERT into @NADDonorDonationsTY

select revenueid, revenue.entfromid as entityid, revenue.rvnamount, rvndate 
from revenue
Where rvndate > '2019-03-31 00:00:00.000' and rvndate <= CONVERT(date, @enddate, 103)
and flgrvntype1id = 207 and flgrvnstatusid = 222 
and revenue.archived = 0 and revenue.revenueid not in
(select rvngrpitem.revenueid from  rvngroup, rvngrpitem  
where rvngroup.RvnGrpType = 24 and rvngroup.archived = 0
and rvngroup.rvngroupid = rvngrpitem.rvngroupid)
and rvnamount > 0
and revenue.revenueid not in
(select ClnParentID from revenue where ClnParentID <> 0)
--and revenue.EntCampaignID in (select entityid from entproject where entparentid = 69343)

DECLARE @NADDonorLastdondateTY  TABLE (entityid INT, lastdonationdate VARCHAR(11))
Insert into @NADDonorLastdondateTY

select entityid, max(rvndate) as lastdonationdate
from @NADDonorDonationsTY
group by entityid 

DECLARE @NADINddonationgroupTY  TABLE (entityid INT, rvnamount float, indonorgroup varchar(20),rvndate VARCHAR(11))
Insert into @NADINddonationgroupTY

select entityid, rvnamount,
inddonorgroup=
case when rvndate > DATEADD(year, -1, CONVERT(date, @enddate, 103)) and rvndate <= CONVERT(date, @enddate, 103) then 'last 12 months'

when  rvndate > DATEADD(year, -2, CONVERT(date, @enddate, 103)) and rvndate <= DATEADD(year, -1, CONVERT(date, @enddate, 103)) then '13 to 24 months'
--when  rvndate > DATEADD(year, -5, CONVERT(date, @enddate, 103)) and rvndate <= DATEADD(year, -2, CONVERT(date, @enddate, 103)) then '25 to 60 months'
end, rvndate
from @NADDonorDonationsTY

--select * from @NADINddonationgroupTY


--DECLARE @NADDonorGroup  TABLE (entityid INT, activedonorgroup varchar(20),lastdonationdate VARCHAR(11))
--Insert into @NADDonorGroup

--select entityid,activedonorgroup = 

--case when lastdonationdate > DATEADD(year, -1, CONVERT(date, @enddate, 103)) then 'last 12 months'

--when  lastdonationdate > DATEADD(year, -2, CONVERT(date, @enddate, 103)) and lastdonationdate <= DATEADD(year, -1, CONVERT(date, @enddate, 103)) then '13 to 24 months'
--when  lastdonationdate > DATEADD(year, -5, CONVERT(date, @enddate, 103)) and lastdonationdate <= DATEADD(year, -2, CONVERT(date, @enddate, 103)) then '25 to 60 months'
--end, lastdonationdate
--from @naddonorlastdondate

--DECLARE @nadtotalbygroup  TABLE (entityid INT, totalbygroup float, countbygroup int, indonorgroup varchar(20))
--insert into @nadtotalbygroup

--select entityid, sum(rvnamount) as totalbygroup, count(rvndate) as countbygroup, indonorgroup 
--from @NADINddonationgroup
--group by entityid, indonorgroup 

--DECLARE @nadtotalbygroup2  TABLE (entityid INT, totalbygroup float, countbygroup INT,inddonorgroup VARCHAR(20), activedonorgroup VARCHAR(20))

--Insert into @nadtotalbygroup2 
--select T1.entityid, totalbygroup, countbygroup , 
--indonorgroup, activedonorgroup
--from @NADtotalbygroup T1 inner join @NADDonorGroup T2
--on T1.entityid = T2.entityid 
--and indonorgroup = activedonorgroup 


 select count(distinct entityid), sum(Rvnamount)
 from @NADINddonationgroupTY
 --group by inddonorgroup


EXEC DONORCOUNTNOTCOMMITTED '31/03/2019'

select * from entity where entityid = 72507


 select * from waudit 
 where tblname = 'revenue'
 order by wauditid desc


 select * from waudit , revenue 
 where tblname = 'revenue' and waudit.RecordID = revenue.RevenueID
 order by wauditid desc


 select * from revenue where rvndate > '2018-07-31 00:00:00.000'
 and rvndate < '2018-09-01 00:00:00.000'

 select * from revenue where revenueid = 248727

 select * from flag where flagid = 224




 select * from revenue order by revenueid desc

 select * from entity where entityid = 51552

