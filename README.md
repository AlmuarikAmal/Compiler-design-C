# CompilerDesign
lexical analyzers are divided into a cascade of two processes: 
I) Scanning consists of the simple processes that do not require tokenization of the input, such as deletion of comments and compaction of consecutive whitespace     characters into one. without losing any line. 
II) Lexical analysis proper is the more complex portion, where the scanner produces the sequence of tokens as output. in this phase you are asked implement first   process of lexical analyzer, by using Lex tool construct lex file do the following:
Read source program from file 

In "scanner.l" file i deleted all comments (defining RE for C style comments). and i have replaced all consecutive whitespace characters by a single blank, the moved resulting content to a separate file.
In "anlyzer.l" I have done the following 
a) recognized integer, double, number (possibly signed + or -) 
b) printed out matched string when keywords is found 
c) recognized token STRING. The pattern consists of a double quote (”) ,any string of characters and a final double-quote. Ignore any string of characters inside     single quote. 
d) recognized identifiers, identifier must start with capital letter and can include small, capital letters, underscores, or digits. 

Moreover, The output present the following:
1. Number of integer numbers 
2. Number of double numbers 
3. Number of Identifiers 
4. Number of String 
5. The longest STRING in the file and its length. 
6. The number of characters that is not a word character ( word character =alphanumeric & underscore). 
7. The number of lines within the file.
