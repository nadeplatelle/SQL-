select entfromid, origdataline, entity.Description, substring(origDataline, charindex('REF:',origDataline) + 16, 5) --, ent2.description
, substring(origDataline, charindex('REF:',origDataline) + 16, 5), left(entity.description, 5) --, ent2.Description
from iRevenue, entity--,entity as ent2 
where origDataline like '/TRTP/Acceptgirobetaling%'
and entcampaignid = entity.entityid 
and substring(origDataline, charindex('REF:',origDataline) + 16, 5) <> left(entity.description, 5) 
--and substring(origDataline, charindex('REF:',origDataline) + 16, 5)  = left (ent2.description, 5)

update irevenue set entcampaignid = text1 where text1 <> ''

select * from irevenue where irevenueid > 191829

update irevenue set  text2 = '235776' where irevenueid = 191940


select * from attribute where Description = '192081' 

select * from entity where description like 'Barneveld%'

select * from attribute where parentid = 63923            ---263003

update irevenue set entfromid = 63923 where irevenueid =  191786

------------------import netherlands Reversal

IF(EXISTS(SELECT 1 FROM dbo.irevenue))
BEGIN

  delete from irevenue

end



--------------import excel spreadsheet manually


select flgdnttypeid from revenue 

--Adding necessary fields to the ireveneu table

update revenue set enttoid = 42865, flgmechanismid = 1006820, flgrvnmethodid = 1006831,
flgdnttypeid = 500, flgtrnchannelid = 543--,  rvndate = convert(date, [rvndate],13)   
where revenueid > 205481---Entfromid

select * from revenue order by revenueid desc 

--Extract the donorid from the origdataline

update iRevenue set text2 = 
substring(origDataline, charindex('/MARF/',origDataline) + 6, charindex('/RTRN/', origdataline)-charindex('/MARF', origdataline)-6)
where origDataline like '/RTYP/SEPA Incasso%'

select * from irevenue where irevenueid > 191829 order by text2 desc 
select * from irevenue where irevenueid > 191829 order by entfromid desc


select * from revenue order by rvndate desc 


select * from attribute where Description = '6915'
select * from entity where entityid = 43676
select * from entity where description like 'Graaf%' order by Description
select * from revenue where entfromid = 59985
update revenue set entfromid = 60076 where revenueid = 204551
update iRevenue set text2 = 
convert(integer, substring(origDataline, charindex('REF:',origDataline) + 7, 7))
where origDataline like '/TRTP/Acceptgirobetaling%' and entfromid = 0

update iRevenue set text2 = 
convert(integer, substring(origDataline, charindex('REF:',origDataline) + 6, 8))
where origDataline like '/TRTP/SEPA OVERBOEKING%'
and substring(origDataline, charindex('REF:',origDataline) + 10, 6) <> 'A OVER'
and entfromid = 0 


update iRevenue set text2 = 
substring(origDataline, charindex('NAME/',origDataline) + 5, 26) from irevenue where origDataline like '/TRTP/SEPA OVERBOEKING%'
and substring(origDataline, charindex('REF:',origDataline) + 10, 6) = 'A OVER' and entfromid = 0

Update irevenue set entfromid = attribute.ParentID
from attribute, irevenue 
where irevenue.text2 = attribute.Description and attfieldid = 1008
and entfromid = 0

update iRevenue set text2 = 
convert(integer, substring(origDataline, charindex('REF:',origDataline) + 11, 7))
where origDataline like '/TRTP/SEPA OVERBOEKING%'
and substring(origDataline, charindex('REF:',origDataline) + 10, 6) <> 'A OVER'
and entfromid = 0 

Update irevenue set entfromid = attribute.ParentID
from attribute, irevenue 
where irevenue.text2 = attribute.Description and attfieldid = 1008
and entfromid = 0

update iRevenue set text2 = 
convert(integer, substring(origDataline, charindex('REF:',origDataline) + 11, 6))
where origDataline like '/TRTP/SEPA OVERBOEKING%'
and substring(origDataline, charindex('REF:',origDataline) + 10, 6) <> 'A OVER'
and entfromid = 0 

Update irevenue set entfromid = attribute.ParentID
from attribute, irevenue 
where irevenue.text2 = attribute.Description and attfieldid = 1008
and entfromid = 0


select irevenueid, entfromid, text2, OrigDataLine  from irevenue where entfromid = 0

select * from entity where description like '%zondervan%'           191788

update irevenue set entfromid  = 44027 where irevenueid =191934

select * from attribute where parentid = 62036 and 

select * from entity where entityid = 60609

select entfromid, irevenueid, rvnamount, rvndate, OrigDataLine from irevenue order by OrigDataLine

update irevenue set entfromid = 55254 where irevenueid = 191937

update irevenue 
set entfromid = rvngroup.EntFromID
from rvngroup, attribute, irevenue
where irevenue.text2 = attribute.Description and
attribute.parentid = rvngroup.rvngroupid and attfieldid = 1171
and irevenue.entfromid = 0

Update irevenue set entfromid = attribute.ParentID
from attribute, irevenue 
where irevenue.text2 = attribute.Description and attfieldid = 1008
and entfromid = 0

update iRevenue set text2 = 
convert(integer, substring(origDataline, charindex('REF:',origDataline) + 10, 8))
where origDataline like '/TRTP/Acceptgirobetaling%'
and entfromid = 0

Update irevenue set entfromid = attribute.ParentID
from attribute, irevenue 
where irevenue.text2 = attribute.Description and attfieldid = 1008
and entfromid = 0

select * from iRevenue  where origDataline like '/TRTP/Acceptgirobetaling%' and impcomment =  
select text3, entcampaignid, OrigDataLine from iRevenue  where impcomment =  '' order by entcampaignid

---Extract the campaign code from the origdataline

update iRevenue set text3 = 
convert(integer, substring(origDataline, charindex('REF:',origDataline) + 16, 5))  
where origDataline like '/TRTP/Acceptgirobetaling%' and irevenueid > 191829 
and entcampaignid = 0

update iRevenue set text3 = 


convert(integer, 
substring(origDataline, charindex(' REF:',origDataline) + 17, 5))
from irevenue 
where origDataline like '/TRTP/SEPA OVERBOEKING%' and irevenueid > 191829 
and substring(origDataline, charindex(' REF:',origDataline) + 17, 5) <> 'OEKIN'
and EntCampaignID = 0

update irevenue set entcampaignid = attribute.ParentID
from attribute, irevenue 
where irevenue.entcampaignid = 0 and attribute.Description = irevenue.text3
and irevenue.text3 <> '' and attfieldid = 211 and irevenueid > 191829 

update irevenue set entcampaignid = rvngroup.  ----no rvngroupid 
from irevenue, attribute, rvngroup  
where text2 like 'BLA%' and text3 = '' and entcampaignid = ''
and irevenue.text2 = attribute.Description
and attribute.parentid = rvngroup.RvnGroupID



update iRevenue set entfromid = rvngroup.EntFromID, flgrvntype6id = attribute.parentid 
from attribute, irevenue, rvngroup 
where irevenue.text2 = attribute.Description and attfieldid = 1171
and attribute.ParentID = rvngroup.rvngroupid 

select * from attribute where Description = 'BLANL/000000000053'

select * from rvngroup where rvngroupid = 2101

--select rvngrpitem.RvnGroupID, max(revenue.revenueid), max(revenue.EntCampaignID)
--from irevenue, rvngroup, rvngrpitem, revenue
--where irevenue.flgrvntype6id = rvngrpitem.RvnGroupID and
--rvngrpitem.RevenueID = revenue.revenueid 
--group by rvngrpitem.RvnGroupID

----Find last donationid and rvngroupid 

DECLARE @nadlastdonation TABLE (Rvngroup INT,MaxRvnID Int)
Insert into @nadlastdonation
select rvngroup.RvnGroupID, max(revenue.revenueid)
from irevenue, attribute, rvngroup, rvngrpitem, revenue
Where irevenue.text2 = attribute.Description and attribute.parentid = rvngrpitem.rvngroupid and rvngrpitem.revenueid = revenue.revenueid 
and attribute.Archived = 0 and attfieldid = 1171 and revenue.reversal = 0 
group by rvngroup.RvnGroupID

UPDATE iRevenue
SET flgrvntype5id = @nadlastdonation.MaxRvnID, flgrvntype6id = @nadlastdonation.Rvngroup 
from irevenue 
join attribute on irevenue.text2 = attribute.description
join @nadlastdonation on @nadlastdonation.rvngroup = attribute.parentid 
Where attfieldid = 1171


update irevenue 
set entcampaignid = revenue.EntCampaignID


from revenue, irevenue where
irevenue.entcampaignid = 0 and
revenue.entfromid  = irevenue.entfromid and 
 revenue.revenueid in (

select max(revenueid) from revenue 
where entfromid in (
select entfromid from irevenue)
group by entfromid )


select * from iRevenue where entcampaignid = 0 order by OrigDataLine
update irevenue set text2 = 323966 where irevenueid = 191403

update irevenue set text3 = '1905' where text3 = '905'

update irevenue set rvnamount = 8 where irevenueid = 191406



select * from attribute where Description = 'BLANL/0000000000960'

select * from RvnGroup where rvngroupid = 3012

update irevenue 
set irevenue.entcampaignid =  revenue.EntCampaignID 

from rvnisplan, rvngroup, revenue, irevenue, attribute 
where rvnisplan.revenueid = revenue.revenueid 
and rvnisplan.RvnGroupID = rvngroup.rvngroupid 
and irevenue.text2 like 'BLA%' and irevenue.entcampaignid = 0 
and irevenue.text2 = attribute.Description
and attribute.ParentID = rvngroup.RvnGroupID



from irevenue, attribute, rvngroup  
where text2 like 'BLA%' and text3 = '' and entcampaignid = ''
and irevenue.text2 = attribute.Description
and attribute.parentid = rvngroup.RvnGroupID



--select * from @nadlastdonation
--update irevenue set entcampaignid = 70339 where entcampaignid = 0

--select * from iRevenue where entcampaignid = 0

--select * from entity where description like 'WM19%'

--select *
--from revenue, attribute  where
--convert(varchar, revenue.entcampaignid) = attribute.Description and attribute.attfieldid = 211 and 
--entcampaignid not in (select entityid from entity where enttype = 4)



--select * from attribute where attfieldid = 211


--select irevenue.flgrvnt from irevenue, attribute where irevenue.text2 = attribute.Description
--and attribute.archived = 0 and attfieldid = 1171

--select * from revenue order by revenueid desc

--select * from entity where entityid = 69578

--select * from attribute where parentid = 69572

--select substring(origDataline, charindex(' REF:',origDataline) + 10, 6), origdataline from irevenue 
--where entfromid = 0


--update irevenue set entfromid = 64665 where irevenueid = 190866

--select * from iRevenue where entcampaignid = 0


--select * from attribute where description = '77902'

--select * from entity where entityid =70312

--select * from entity where description like 'WM19%'

--select irevenueid, substring(origDataline, charindex('REF:',origDataline) + 10, 6), text2, entfromid, origDataline
--from irevenue 
--where origDataline like '/TRTP/SEPA OVERBOEKING%'
--and substring(origDataline, charindex('REF:',origDataline) + 10, 6) = 'A OVER'

----Find campaignid by looking at the donors last donation




--select * from entity where description like 'Weenink%'


--update irevenue set entfromid = 60076 where irevenueid = 191268

--select * from iRevenue order by origDataline

--select * from attribute where description = '259161'

--select * from entity where entityid = 56237

--select * from flag where flagid = 2271


--select origDataline, charindex('/RTRN/', origdataline), charindex('/MARF', origdataline),
--charindex('/RTRN/', origdataline)-charindex('/MARF', origdataline)-7


select * from attribute where description = '071911'

update irevenue 
set text2 = '228220'
where text2 = '22822'

select entfromid, entcampaignid, text3, origdataline from irevenue where entfromid = 0


select * from entity where description like 'stoeli%'  ---69499       ----54144  a h 
select * from entity where entityid = 47421

update irevenue set entfromid = 60425 where irevenueid = 191346

select * from attribute, entity where enttype = 4 and attribute.ParentID = entity.entityid 



select * from irevenue, entity 
where irevenue.text3 = entity.Description --and enttype = 4 
and text3 <> ''

select * from irevenue where irevenueid > 191829 order by entcampaignid desc
select * from entity where Description like '80202%'


select   entity.description, attribute.ParentID, attribute.Description, iRevenue.text2, irevenue.text3, OrigDataLine

update irevenue
set entcampaignid = attribute.parentid 
from irevenue, attribute, entity 
where irevenue.text3 = attribute.Description
and attribute.Description <> '' and attfieldid = 211
and attribute.ParentID = entity.entityid 
and irevenueid > 191829 
and entcampaignid = 0

update irevenue set text2 = '309811' where iRevenueid =  191932

update irevenue set entcampaignid = 70394  where irevenueid = 191869


select entity.Description, enttype, text2 , rvnamount 
from entity, irevenue 
where irevenue.entcampaignid = entity.entityid and irevenueid > 191829 

update irevenue 
set text3 = '80102'
where text3 like '3%102'


update irevenue 
set text3 = '80201'


where irevenueid > 191829 and text3 = '201' and entcampaignid = 0

select * from entity where description like '80201%'---like 'wm19%'

select * from  iRevenue where entfromid = 0 and iRevenueID > 191829