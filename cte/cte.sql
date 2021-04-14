with cte (tweet) as
(
    select tweettext
    from  usaResults
), 
mentions ([start],[end],tweet) as
(
    select CHARINDEX('@',cte.tweet),CHARINDEX(' ',cte.tweet), cte.tweet
    from cte    
),
hashtag ([start],[end],tweet,mentioned) as
(
    select CHARINDEX('#',tweet),CHARINDEX(' ',tweet), tweet, case when [start]<>0 then SUBSTRING(tweet,[start],[end]) end
    from mentions    
),
hashedTag (mentioned,tag,tweet) as
(
    select mentioned,case when [start]<>0 then SUBSTRING(tweet,[start],[end]) end, tweet
    from hashtag
)
select * from hashedtag
