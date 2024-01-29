-- dive into nonbrand, and pull monthly sessions and orders split by device type

select Month(sessions.created_at) as Month, MIN(Date(sessions.created_at)) as start_date_of_month, 
count(distinct case when sessions.device_type = 'mobile' then sessions.website_session_id else null end) as monthly_sessions_mobile, 
count(distinct case when sessions.device_type = 'mobile' then orders.order_id else null end) as monthly_orders_mobile,
count(distinct case when sessions.device_type = 'desktop' then sessions.website_session_id else null end) as monthly_sessions_desktop, 
count(distinct case when sessions.device_type = 'desktop' then orders.order_id else null end) as monthly_orders_desktop

from orders right join website_sessions sessions
on orders.website_session_id = sessions.website_session_id

where sessions.utm_source = 'gsearch' 
and sessions.utm_campaign = 'nonbrand'
and sessions.created_at < '2012-11-27'
group by month



