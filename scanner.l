%{
#include<stdio.h>
%}

start \/\*
end \*\/

/* REs: */
%%

[\t ]+ 		fprintf(yyout, " ");		
.|\n 		fprintf(yyout, "%s", yytext);	

\/\/.*\n ;
{start}[^*/]*{end} ;

%%


int main(int argc, char **argv) {
	
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
	     	yyin = fopen(filename,"r");
		// handle exceptions in file
		if(yyin == NULL){
			fprintf(stderr,"ERROR: file can’t be opened\n");
			exit(1);
		}
	}
	else {
		yyin = fopen(filename,"r");
	}
	yyout = fopen("out.txt","w");

	yylex();
	fclose(yyin);
	fclose(yyout);

return 0;
}