#use ig_clone
#Answer 2
-- select count(*) as likescount from follows;
-- select count(*) as commentscount from comments;
-- select count(*) as photocount from photos;

#Answer 3
-- with cte as (select count(*) as tagcount from photo_tags group by photo_id)
-- select avg(tagcount) from cte;

#Answer4
-- with commentscount as (select photo_id,count(*) as comments from comments group by photo_id),
-- likescount as (select photo_id,count(*) as likes from likes group by photo_id),
-- engagement as(select user_id,sum(comments+likes) as total_engagement from photos p 
-- left join commentscount t1 on p.id=t1.photo_id
-- left join likescount t2 on p.id=t2.photo_id group by 1)
-- select username,total_engagement,rank() over (order by total_engagement desc) as erank from engagement t1 
-- left join users t2 on t1.user_id=t2.id;

-- Answer5
-- select follower_id,count(*) from follows group by 1 order by 2 desc;
-- select followee_id,count(*) from follows group by 1 order by 2 desc;

-- #Answer6
-- with commentscount as (select photo_id,count(*) as comments from comments group by photo_id),
-- likescount as (select photo_id,count(*) as likes from likes group by photo_id),
-- engagement as(select user_id,avg(comments+likes) as avg_engagement from photos p 
-- left join commentscount t1 on p.id=t1.photo_id
-- left join likescount t2 on p.id=t2.photo_id group by 1 order by 2 desc)
-- select username, avg_engagement from engagement t1 
--  left join users t2 on t1.user_id=t2.id;

-- Answer7
-- select username from users where id not in (select distinct(user_id) from likes) order by 1;

#Answer10
-- with commentscount as (select photo_id,count(*) as comments from comments group by photo_id),
-- likescount as (select photo_id,count(*) as likes from likes group by photo_id),
-- tags_count as (select photo_id,count(*) as tags from photo_tags group by 1),
-- engagement as(select user_id,sum(comments+likes+coalesce(tags,0)) as total_engagement from photos p 
-- left join commentscount t1 on p.id=t1.photo_id
-- left join likescount t2 on p.id=t2.photo_id
-- left join tags_count t3 on p.id=t3.photo_id group by 1)
-- select username,total_engagement from engagement t1
-- left join users t2 on t1.user_id=t2.id order by 2 desc;

#Answer11
-- with commentscount as (select photo_id,count(*) as comments from comments group by photo_id),
-- likescount as (select photo_id,count(*) as likes from likes group by photo_id),
-- tags_count as (select photo_id,count(*) as tags from photo_tags group by 1),
-- engagement as(select user_id,sum(comments+likes+coalesce(tags,0)) as total_engagement from photos p 
-- left join commentscount t1 on p.id=t1.photo_id
-- left join likescount t2 on p.id=t2.photo_id
-- left join tags_count t3 on p.id=t3.photo_id group by 1)
-- select username,total_engagement,rank() over (order by total_engagement desc) as erank from engagement t1
-- left join users t2 on t1.user_id=t2.id;

#Answer12
-- with likescount as (select photo_id,count(*) as likes from likes group by photo_id order by 2 desc limit 1)
-- select tag_name from tags where id in (select tag_id from photo_tags where photo_id = (select photo_id from likescount));

#Answer13
-- select * from follows;

#----------------------  Subjective   -----------------------------------

#Answer1
-- with commentscount as (select photo_id,count(*) as comments from comments group by photo_id),
-- likescount as (select photo_id,count(*) as likes from likes group by photo_id),
-- engagement as(select user_id,count(t1.photo_id) as photocount,sum(comments+likes) as total_engagement, avg(comments+likes) as avg_engagement from photos p 
-- left join commentscount t1 on p.id=t1.photo_id
-- left join likescount t2 on p.id=t2.photo_id group by 1)
-- select id,username,total_engagement,avg_engagement,photocount
-- from engagement t1 
-- left join users t2 on t1.user_id=t2.id; 

#Anser3
-- with commentscount as (select photo_id,count(*) as comments from comments group by photo_id),
-- likescount as (select photo_id,count(*) as likes from likes group by photo_id),
-- engagement as(select id,sum(comments+likes) as total_engagement from photos p 
-- left join commentscount t1 on p.id=t1.photo_id
-- left join likescount t2 on p.id=t2.photo_id group by 1)
-- select tag_name, sum(total_engagement) as total_engagement from photo_tags p
-- left join engagement e on e.id=p.photo_id
-- left join tags t on p.tag_id=t.id group by 1 order by 2 desc;





