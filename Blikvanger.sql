SELECT 
global_id, 
broker_id,
contract_number, 
contract_type, 
contract_service_type, 
DATE(delivery_start_at) delivery_start_date, 
CASE WHEN i.globalid IS NULL THEN false ELSE true END AS has_blikvanger 
FROM `funda-bi.odl_contracts.fact_contract_deliveries` d
LEFT JOIN `funda-bi.rdl_funda_objecten.FDK_ObjectInfo` i ON d.global_id=i.globalid AND idisactive
WHERE TRUE
AND d.is_premium
AND d.delivery_end_at IS NULL 
AND i.globalid IS NULL
AND delivery_start_at < '2024-01-15'