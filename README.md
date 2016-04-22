# SQL-Scripts

Helps separate some common Spanish Surnames into separate columns for easier data analysis.

NOTE: The second name must be written as a single character, otherwise, there is no real way of knowing if the word
is a second name or not.


The usage of the function is as follows:
dbo.caracterN_ocurrencias(@columnname,[character to look for],[character to jump to])
    For example, suppose we want to find the second space in: 'The kid's name is Bob' 
    dbo.caracterN_ocurrencias(sentences,' ',2) would find the second space in the string, so the space between "kid's", and 'name'
    
    If we want to display the second word, we would need to find the first space, then tell it to substract the second space with the first space like this:
          SUBSTRING(sentences,dbo.caracterN_ocurrencias(sentences,' ',1),dbo.caracterN_ocurrencias(sentences,' ',2)-dbo.caracterN_ocurrencias(sentences,' ',1))
              This would look at the sentences column, and start counting at the beggining of the first space, then it would count until the end of the second space.
              
              So if we were to use the previous code on 'The kid's name is Bob', we would get "kid's" as a result of the query.
