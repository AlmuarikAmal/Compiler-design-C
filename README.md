# CompilerDesign

## lexical analyzers are divided into a cascade of two processes: 
  1. Scanning consists of the simple processes that do not require tokenization of the input, such as deletion of comments and compaction of consecutive whitespace characters into one. without losing any line. 
  2. Lexical analysis proper is the more complex portion, where the scanner produces the sequence of tokens as output. 
  
In "scanner.l" file i have read source program from file and deleted all comments (defining RE for C style comments). also, replaced all consecutive whitespace characters by a single blank, the moved resulting content to a separate file.
In "anlyzer.l" I have done the following 
  1. recognized integer, double, number (possibly signed + or -) 
  2. printed out matched string when keywords is found 
  3. recognized token STRING. The pattern consists of a double quote (”) ,any string of characters and a final double-quote. Ignore any string of characters inside     single quote. 
  4. recognized identifiers, identifier must start with capital letter and can include small, capital letters, underscores, or digits. 
Moreover, The output present the following:
  5. Number of integer numbers 
  6. Number of double numbers 
  7. Number of Identifiers 
  8. Number of String 
  9. The longest STRING in the file and its length. 
  10. The number of characters that is not a word character ( word character =alphanumeric & underscore). 
  11. The number of lines within the file.
