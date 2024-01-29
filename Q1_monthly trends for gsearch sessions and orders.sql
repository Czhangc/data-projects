-- monthly trends for gsearch sessions and orders
use mavenfuzzyfactory;

select Month(sessions.created_at) as month, MIN(Date(sessions.created_at)) as start_date_of_month, 
count(distinct sessions.website_session_id) as weekly_sessions, 
count(distinct orders.order_id) as weekly_orders,
count(distinct orders.order_id)/ count(distinct sessions.website_session_id) as conv_rate

from orders right join website_sessions sessions
on orders.website_session_id = sessions.website_session_id

where sessions.utm_source = 'gsearch' 
and sessions.created_at < '2012-11-27'
group by month(sessions.created_at)
order by month(sessions.created_at)


