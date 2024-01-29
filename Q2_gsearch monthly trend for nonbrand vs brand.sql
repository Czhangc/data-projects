-- monthly trends for gsearch sessions and orders
-- splitting out nonbrand and brand campaigns separately

select Month(sessions.created_at) as month, MIN(Date(sessions.created_at)) as start_date_of_month, 
count(distinct case when sessions.utm_campaign = 'nonbrand' then sessions.website_session_id else null end) as monthly_sessions_nonbrand, 
count(distinct case when sessions.utm_campaign = 'nonbrand' then orders.order_id else null end) as monthly_orders_nonbrand,
count(distinct case when sessions.utm_campaign = 'brand' then sessions.website_session_id else null end) as monthly_sessions_brand, 
count(distinct case when sessions.utm_campaign = 'brand' then orders.order_id else null end) as monthly_orders_brand

from orders right join website_sessions sessions
on orders.website_session_id = sessions.website_session_id

where sessions.utm_source = 'gsearch' 
and sessions.created_at < '2012-11-27'
group by month
