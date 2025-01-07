select
    order_id,
    SUM(total_order_amount) AS total_amount
from {{ ref('int__order') }}
group by 1
having total_amount < 0