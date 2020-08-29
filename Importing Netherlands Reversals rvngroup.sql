Insert into rvngrpitem (RevenueID, rvngroupid, FlgExportStatusID)
select revenue.revenueid, rvngroup.rvngroupid, 551 
from revenue, revenue as revparent, rvngrpitem, rvngroup 
where revenue.revenueid >207133
and revenue.clnparentid = revparent.revenueid
and revparent.revenueid = rvngrpitem.Revenueid 
and rvngrpitem.rvngroupid = rvngroup.rvngroupid
and rvngroup.RvnGrpType = 24

order by revenueid desc

select * from entity where entityid = 70296

select * from rvngrpitem where rvngroupid = 3024

select * from Revenue order by revenueid desc

select * from iRevenue where rvnamount = 250

select * from revenue where entfromid =60772

order by revenueid desc

delete from iRevenue

select * from entity where entityid = 49075

select * from entity where description like 'bruinsma,%'

select * from revenue where entfromid = 64605 order by revenueid desc

update revenue 
set EntCampaignID = 69303
where revenueid = 202969

select * from flag where flagid = 11

select * from revenue where 
flgrvntype1id = 207 and 
entcampaignid not in (select entityid from entity where enttype = 4)

select revenueid, entfromid, rvnamount, rvndate, EntCampaignID from revenue where flgrvntype1id = 207 and entfromid = 66195 order by revenueid desc

update revenue 
set ClnParentID = irevenue.flgrvntype5id
from irevenue
where revenue.EntFromID = irevenue.entfromid and
revenue.entcampaignid = irevenue.entcampaignid 

and irevenueid > 192353



select * from revenue order by revenueid desc



update wuser set sysmaintained = 1, wdomainid = 1, wrledefaultid = 3 where wuserid = 79

select * from wuser

select * from entity where description like '79102%'


select * from wRole



select * from revenue where 
flgrvntype1id = 207 order by revenueid desc
