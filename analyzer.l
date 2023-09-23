%{ 
#include<stdio.h>
#include<string.h>
int intNum= 0, doubNum= 0, identNum= 0, strNum= 0, charNum= 0, lineNum= 1, maxlen= 0;
char maxstr[1024]= ""; 
FILE *file;
%}
delim 			[ \t\n]
ws    			{delim}+
letter 			[a-zA-Z]
digit  			[0-9]
line 			[\n]
integer     		[-+]?{digit}+
double      		{integer}*\.{digit}+
stringToken		\"([^\"]|[\n]+)*\"
ignoreThis 		\'[^'']*\'
identifier 		[A-Z][A-Za-z0-9_]*
non_word_char 		[^a-zA-Z_0-9\n]
type   			(double|int|char|signed|float|short|void)
keyword 		{type}|main|auto|struct|break|else|long|switch|case|enum|register|typedef|extern|return|union|continue|for|void|do|if|static|while|default|goto|sizeof|volatile|const|printf

%%
{line}				{lineNum++;}
{non_word_char}			{charNum++;}

{stringToken} 			{strNum++;
				int len = strlen(yytext) - 2;
				if(len > maxlen){
					maxlen = len;
					strncpy(maxstr,yytext+1,len);
					maxstr[len]='\0';
					
					}
				if(strrchr(yytext,'\n')) lineNum++;
				}
{ignoreThis} 			;
{double}			{if(yytext[0]== '-'|| yytext[0] =='+') {charNum++;}						doubNum++;}
{integer}			{if(yytext[0]== '-'|| yytext[0] =='+') {charNum++;}						intNum++;}
{keyword}			{printf("%s\n",yytext);}
{identifier}			{identNum++;}	
.				{}
%%
int main (int argc , char*argv[]) {
	
	// handle user error
	if(argc < 1){
	  fprintf(stderr,"you might missed the file name :)\n");
	}

	char *filename = argv[1]; 
    	char *extension = ".txt";

    	// search for last occurrence of '.' in the filename
    	char *dot = strrchr(filename, '.');

    	if (dot == NULL) {
		filename = strcat(filename, extension);
	     	file  = fopen(filename,"r");
		if(file == NULL){
			fprintf(stderr,"ERROR: file can’t be opened\n");
			exit(1);
		}
	}
	else {
		file  = fopen(filename,"r");
	}
	yyout = fopen("output.txt","w");

	// handle exception in files 	
	
	// process 
	yyin = file;
	yylex();
	
	printf("The number of Integers is %d\n",intNum);
	printf("The number of Doubles is %d\n",doubNum);
	printf("The number of Identifiers is %d\n",identNum);
	printf("The number of Strings is %d\n",strNum);
	printf("The longest String is:\"%s\" of Length: %d\n",maxstr ,maxlen);
	printf("The number of Characters is: %d\n",charNum);
	printf("The number of Lines is: %d\n",lineNum);
	
	// close files 
	fclose(yyin);
	fclose(file);
	fclose(yyout);
}