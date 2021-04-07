with cid as (
select * from mm_cid_graph where export_date = '_end_date_'
)
select 
	v1,
	v2,
	mm_uuid,
	case when c.cid is not null then c.cid else ev.mm_uuid end as cid,
	event_date,
	timestamp_gmt,
	advertiser_name,
	country
from mm_events ev
	left join cid c on ev.mm_uuid = c.uuid
where organization_id = _organization_id_
and pixel_id = _pixel_id_
and event_date between '_start_date_' and '_end_date_'
