select TweetText, cast(CreatedDate as DATE), mention, hashtag from usaResults u
inner join coinmarketcapdata cmcd on cast(u.CreatedDate as date) = cmcd.[date]
Cross APPLY 
(
    select substring(value,CHARINDEX('@',[value]),CHARINDEX(' ',[value])) as mention 
    from string_split(tweettext,'@') 
    where len(substring(value,CHARINDEX('@',[value]),CHARINDEX(' ',[value])))>0
) as Mentions
Cross APPLY 
(
    select substring(value,CHARINDEX('#',[value]),CHARINDEX(' ',[value])) as hashtag 
    from string_split(tweettext,'#') 
    where len(substring(value,CHARINDEX('#',[value]),CHARINDEX(' ',[value])))>0
) as Hashtag
