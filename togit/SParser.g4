parser grammar SParser;

options { tokenVocab=SLexer; }

start : template;
template : template smartytag | EMPTY;
smartytag : LTAG tagbody modifierlist RTAG
| LTAG tag modifierlist RTAG 
| LTAG ASSIGN EMPTY DOUBLEQUOTE DOLLARID DOUBLEQUOTE EMPTY DOUBLEQUOTE TEXT DOUBLEQUOTE RTAG
| LTAG STAR TEXT STAR RTAG
| BLOCK DOUBLEQUOTE TEXT DOUBLEQUOTE RTAG smartytag ENDBLOCK 
| CAPTURE NAME RTAG smartytag ENDCAPTURE 
| FOR smartytag ENDFOR  
| FOREACH smartytag? VAR? ENDFOREACH 
| IF DOLLARID EMPTY SLOGOP EMPTY QUOTE STRING* QUOTE RTAG smartytag (ELSEIF DOLLARID EMPTY SLOGOP QUOTE STRING* QUOTE RTAG smartytag)? (ELSE smartytag)? ENDIF
| SETFILTER REALMODIFIERSS modifierlist* RTAG smartytag ENDSETFILTER 
| HTML_SELECT_DATE
| EVAL DOLLARID modifierlist RTAG
| STRIPTAG smartytag ENDSTRIP;

tagbody : output | DOLLARID EQUAL output | varindexed EQUAL output;
output : variable | value | expr;
tag : DOLLARID; 

expr : value | ternary | expr MATH value_NUM | expr UNIMATH value_NUM | expr TLOP value_NUM | expr lop expr | expr SINGLECOND;
ternary : LBRACE expr RBRACE QMARK DOLLARID COLON LBRACE expr RBRACE | LBRACE expr RBRACE QMARK LBRACE expr RBRACE COLON LBRACE expr RBRACE;
value_NUM : variable | UNIMATH value_NUM | NOT value_NUM | typecast value_NUM | variable INCDEC | HEX | INTEGER | INTEGER DOT INTEGER | variable INSTANCEOF variable;
value_STR : variable | typecast value | INTEGER | INTEGER DOT INTEGER | singlequotestring | doublequoted_with_quotes;

value : value_STR | value_NUM;
variable : DOLLARID | varindexed | DOLLARID ID;
varindexed : DOLLARID arrayindex;
arrayindex : indexdef arrayindex | EMPTY;

indexdef : DOT DOLLARID | LOPEN singlequotestring ROPEN | LOPEN INTEGER ROPEN | LOPEN DOLLARID ROPEN | LOPEN variable ROPEN | LOPEN value_NUM ROPEN | LOPEN expr ROPEN | LOPEN ROPEN;

modifierlist : modifierlist modifier | modifier;
modifier : VERT REALMODIFIERS | VERT REALMODIFIERSS VERT REALMODIFIERS;

lop : LOGOP | SLOGOP;

doublequoted_with_quotes : DOUBLEQUOTE DOUBLEQUOTE | DOUBLEQUOTE doublequoted DOUBLEQUOTE;
doublequoted : doublequoted doublequotedcontent | doublequotedcontent;
doublequotedcontent : MINIQUOTE variable MINIQUOTE | MINIQUOTE expr MINIQUOTE | DOLLARID | LTAG variable RTAG | LTAG expr RTAG | LTAG tagbody RTAG | LTAG DOLLARID RTAG | TEXT;

typecast : LBRACE TYPE RBRACE;
singlequotestring : QUOTE TEXT QUOTE;