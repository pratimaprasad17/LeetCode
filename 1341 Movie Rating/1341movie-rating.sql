# Write your MySQL query statement below

with user_rating as(
    select
    name as results
    from Users u
    join MovieRating mr
    using(user_id)
    group by user_id
    -- having max(rating)
    order by count(rating) desc, results
    limit 1
),
movie_rating as (
    select 
    title as results
    from Movies m
    join MovieRating mr
    using(movie_id)
    where created_at like '2020-02-%'
    group by movie_id
    order by avg(rating) desc, results
    limit 1
)
select * from user_rating
union all
select * from movie_rating