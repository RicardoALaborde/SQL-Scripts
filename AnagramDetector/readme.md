#Anagram Detector#

According to [dictionary.com](http://www.dictionary.com/browse/anagram), an anagram is:

> a word, phrase, or sentence formed from another by rearranging its letters: “Angel” is an anagram of “glean.”.

This is an easy to use function, just input the two strings you want to compare and run the query. 

If the query returns NULL, then the two strings are not an anagram of each other.

Example:

Running the query:

    select dbo.fx_anagram('schoolmaster','the classroom')

Returns:

    ANAGRAM
  
Whereas running the query:

    select dbo.fx_anagram('wisdom','wisdum')

Returns:

    NULL
