SELECT TOP (1000) [Id]
      ,[Name]
      ,split.value
  FROM [Test]
Cross APPLY
(
    select * from string_split([Name], '_')
) as split
