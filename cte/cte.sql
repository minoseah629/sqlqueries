with cte (tweet, createdate) as
(
    select tweettext,cast(CreatedDate as DATE)
    from  usaResults
), 
mentions ([start],[end],tweet,createdate) as
(
    select CHARINDEX('@',cte.tweet),CHARINDEX(' ',substring(cte.tweet,CHARINDEX('@',cte.tweet),LEN(cte.tweet))), cte.tweet, cte.createdate
    from cte    
),
hashtag ([start],[end],tweet,mentioned,createdate) as
(
    select CHARINDEX('#',tweet),CHARINDEX(' ',substring(tweet,CHARINDEX('#',tweet),LEN(tweet))), tweet, case when [start]<>0 then SUBSTRING(tweet,[start],[end]) end, createdate
    from mentions    
),
hashedTag (mentioned,tag,tweet,createdate) as
(
    select mentioned,case when [start]<>0 then SUBSTRING(tweet,[start],[end]) end, tweet,createdate
    from hashtag
)
select * from hashedtag
