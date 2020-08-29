update revenue set entfromid = 58999 where revenueid = 204225

select * from iRevenue where irevenueid > 191940

update irevenue set text2 = '260408', text3 = '901' where irevenueid = 191393

-------------insert irevenue records into revenue 
select entcampaignid, OrigDataLine, rvnamount from irevenue order by entcampaignid 

select * from entity where description like 'brinkman%'

select * from attribute where description like 'BLANL/000000000%'

update irevenue set rvnamount = 3 where irevenueid = 191326


insert into revenue(  flgrvntype1id, flgrvnstatusid, entfromid, enttoid, rvndate, rvnamount, 
flgrvnmethodid, description, reversal, FlgMechanismID, clnparentid, 
rvnisplanid, gisid, entcampaignid, flgdnttypeid, FlgFndTypeID, extrefnumber, FlgTrnChannelID)
 

select 207, 222, entfromid, enttoid, rvndate, 
convert(money, rvnamount),  
 flgrvnmethodid,description, reversal, flgmechanismid,flgrvntype5id, 
 flgrvntype4id, flgregionid, entcampaignid, flgdnttypeid,FlgFndTypeID, ExtRefNumber, flgtrnchannelid

from irevenue where irevenueid > 192353

update irevenue set rvnamount = 1.17 where irevenueid = 192191


select * from revenue 

update revenue set FlgDirectionID = 227 where flgdirectionid = 0

select * from entity where entityid = 45086
select * from irevenue where entfromid = 45086

update revenue
set reversal = 1, description = 'reversal of: '
from revenue where convert(money,rvnamount) < 0

update irevenue
set entfromid = attribute.ParentID 

from attribute, irevenue, entity 
where irevenue.text2 = attribute.description   
and attfieldid = 1008 and attribute.Archived = 0 
and text2 <> '' and entfromid = 0
and attribute.ParentID = entity.entityid 

select * from revenue order by revenueid desc

update revenue set rvnamount = 174.09 where revenueid = 206285


update irevenue set rvnamount = 8 where irevenueid = 190699
3, 190691
4   190693
3,  190695
5   190704
4719 190735 
1    190748


select flgfndtypeid from irevenue 

select * from entity where description like 'hutting%'

update revenue set FlgDirectionID = 227 where FlgDirectionID = 0 order by revenueid desc

select * from revenue 
where rvndate = '2019-07-02 00:00:00.000'
and revenueid >201757
order by revenueid desc 

update revenue set FlgDirectionID = 227 where FlgDirectionID = 0

select entfromid, count(revenueid) from revenue 
where 
rvndate = '2019-06-06 00:00:00.000'
and rvnamount < 0
group by entfromid 
having count(revenueid) > 1

 order by entfromid 


 and revenue.entfromid = revparent.entfromid
 and revenue.rvndate = revparent.rvndate 

select * from revenue where revenueid = 201176

select * from revenue where entfromid in (52906,60772 )

select * from entity where entityid in( 52906, 60772)

select * from revenue, entity 
where revenueid > 205013
and revenue.EntCampaignID = entity.entityid 

update irevenue 
set flgrvntype6id = attribute.ParentID
from irevenue, attribute
where 
irevenue.text2 = attribute.description 
and attribute.Archived = 0 and attfieldid = 1171
and iRevenueID > 191829

update irevenue 
set flgrvntype4id = rvnisplanid 
from irevenue, attribute, RvnISPlan
where 
irevenue.text2 = attribute.description and
attribute.parentid = rvnisplan.rvngroupid
and attribute.Archived = 0 and attfieldid = 1171
and attribute.ParentID = rvnisplan.RvnGroupID 
and flgrvntype4id = 0 
and iRevenueID > 191829

delete from irevenue where irevenueid = 192024
select * from irevenue order by entfromid 

select * from entity where Description like 'zijlstra%'
DECLARE @nadmaxrevid TABLE(rvngroupid INT, maxrevid INT)



Insert into @nadmaxrevid
select rvngrpitem.rvngroupid,max(revenue.revenueid)
from irevenue, rvngrpitem, revenue 
where irevenue.flgrvntype6id = rvngrpitem.RvnGroupID
and rvngrpitem.revenueid = revenue.RevenueID 
and revenue.Reversal = 0 and revenue.Archived = 0 
group by rvngrpitem.rvngroupid

update irevenue 
set flgrvntype5id = maxrevid 
from @nadmaxrevid 
where rvngroupid = flgrvntype6id 
and iRevenueID > 191829


update irevenue 
set irevenue.entcampaignid = revenue.EntCampaignID  from irevenue, rvnisplan, revenue  
where irevenue.flgrvntype4id = rvnisplan.rvnisplanid 
and RvnISPlan.RevenueID = revenue.RevenueID
and irevenue.entcampaignid = 0



select * from irevenue , revenue 

 where irevenueid > 192049 and irevenue.entfromid = revenue.entfromid 
 and irevenue.RvnDate = revenue.RvnDate and revenue.revenueid > 206281
 and irevenue.entcampaignid = revenue.EntCampaignID




select * from rvnisplan where rvnisplanid = 559

update irevenue set rvnamount = 3 where irevenueid = 191273

select * from iRevenue 

where revenueid = 186391


select max(revenueid), entfromid from revenue where entfromid in (
select entfromid from irevenue where EntCampaignID = 0 and entfromid <> 0)
group by entfromid 

update irevenue 
set entfromid = attribute.ParentID 
from iRevenue, attribute  
where entfromid = 0 and text2<> ''
and text2 = attribute.Description and attribute.Archived = 0 
and attfieldid = 1008 

update iRevenue
set  text2 = 179186
where text3 = 'BANGE P'

select irevenue.entfromid, entity.Description, enttype,origDataline
from  irevenue left outer join entity 
on entity.entityid = irevenue.entfromid where entcampaignid <> 0
order by enttype 


select flgrvntype4id  from irevenue order by flgrvntype4id 

select * from flag where flagid in ( 1022, 1952, 2042)

update irevenue set flgrvntype4id = 0 where flgrvntype4id in ( 1022, 1952, 2042)
update irevenue set entcampaignid = 70323 where entcampaignid = 79904


select * from attribute where description like '79904%'

select * from entity where entityid = 68760



select * from irevenue, attribute 

select * from rvnisplan where rvnisplanid = 49
select * from revenue where revenueid = 185437

select * from entity where entityid = 47986

select irevenueid, rvnamount, entfromid,  entcampaignid, OrigDataLine from irevenue order by entcampaignid 


select * from entity where Description like '%container kitchen%'

update irevenue set entcampaignid = 70310 where irevenueid = 191203


select * from irevenue

where entcampaignid = 0 

update irevenue 
set entcampaignid = revenue.EntCampaignID


from revenue, irevenue where
revenue.entfromid  = irevenue.entfromid and 
 revenue.revenueid in (

select max(revenueid) from revenue 
where entfromid in (
select entfromid from irevenue)
group by entfromid )


update irevenue  set entcampaignid = 70357 where entcampaignid = 0

select * from entity where entityid = 53175

select * from revenue order by revenueid desc



select * from entchild order by entchildid desc

select * from milestone 

select * from revenue order by revenueid desc 


update revenue set enttoid = 42865 where revenueid > 205481

select * from entity where entityid = 62593
update  rvngroup set archived = 1 where entfromid = 57001


select * from entity where description like '%, yephtahe%'


select * from irevenue where irevenueid >