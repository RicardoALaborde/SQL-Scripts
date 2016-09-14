CREATE FUNCTION dbo.fx_anagram(@values1 nvarchar(255),@values2 nvarchar(255)) 
RETURNS NVARCHAR (530)
AS

BEGIN
--check if provided value is not null and is of the same length
IF @values1 IS NOT NULL AND @values2 IS NOT NULL
BEGIN
	--table to store each letter
	DECLARE @sortingVals TABLE
	(
		lettersToSort1 nvarchar(1),
		lettersToSort2 nvarchar(1)
	)
	DECLARE @lengthVal1 int,@idx int,@returnState nvarchar(255),@letter nvarchar(1),@string1 nvarchar(255),@string2 nvarchar(255)
	--Know when to stop the while loop--
	SET @lengthVal1 = CASE WHEN LEN(@values1) > LEN(@values2) THEN LEN(@values1) ELSE LEN(@values2) END
	SET @idx = 1
	------------------------------------
	WHILE @lengthVal1 <> 0
		BEGIN
			--read each letter from the strings
			SELECT @letter = SUBSTRING(@values1,@idx,1)
			INSERT INTO @sortingVals(lettersToSort1) VALUES(@letter)
			SELECT @letter = SUBSTRING(@values2,@idx,1)
			INSERT INTO @sortingVals(lettersToSort2) VALUES(@letter)
			--Increase and decrease counters--
			SET @lengthVal1 = @lengthVal1-1
			SET @idx = @idx + 1
		END
	--Join the rows into a single cell
	SELECT @string1 = 
				(SELECT lettersToSort1 + '' FROM @sortingVals WHERE lettersToSort1 like '%[a-zA-Z]%' ORDER BY lettersToSort1 FOR XML PATH(''))
	SELECT @string2 = 
				(SELECT lettersToSort2 + '' FROM @sortingVals WHERE lettersToSort2 like '%[a-zA-Z]%' ORDER BY lettersToSort2 FOR XML PATH(''))
	--If the resulting cells are equal, it is an anagram		
	SELECT @returnState = CASE WHEN @string1 = @string2 THEN @values1 +' IS AN ANAGRAM OF ' +@values2
								WHEN @string1 <> @string2 THEN @values1 +' IS NOT AN ANAGRAM OF ' +@values2 END
END
	RETURN @returnState
END
