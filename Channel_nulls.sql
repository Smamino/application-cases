select 
sum(case when channel is null then 1 else 0 end) channel_nulls
FROM `funda-bi.rdl_segment_events.vw_my_home_viewed` 
WHERE date BETWEEN '2024_07_01' AND '2024_01_01'
