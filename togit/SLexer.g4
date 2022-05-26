lexer grammar  SLexer;

MODPARAMETER : ':\'html\'' | ':\'htmlall\'';

TLOP : ' is ' ('NOT ')? 'odd ' 'by '| ' is ' ('NOT ')? 'even ' 'by '| ' is ' ('NOT ')? 'div ' 'by ';

DOLLARID : '$' NAME;
NAME : 'name' | 'last_name' |'price' |'owner' |'cost' |'php' |'user' |'pass' |'amount' |'template';
TEXT : STRING* '<script>alert(' STRING* ')</script>' STRING* | STRING* '<script>alert(' TEXT ')</script>' STRING* | STRING* '<script>' STRING+ '</script>' STRING*;
STRING : [0-9a-zA-Z_ <>`@$%^&];

NOT : ' !' | ' NOT ';

TYPE : 'int' | 'bool' | 'float' | 'double' | 'real' | 'string' | 'binary' | 'array' | 'object';
INCDEC : '++' | '--';
HEX : '0x' [0-9a-fA-F]+;
INTEGER : [0-9]+;

VERT : '|';
EQUAL : ' = ';
LOGOP : ' != ' | EQUAL | ' == ' | ' < ' | ' <= ' | ' > ' | ' >= ' | ' && ' | ' || ';
SLOGOP : ' eq ' | ' ne ' | ' neq ' | ' gt ' | ' ge ' | ' gte ' | ' lt ' | ' le ' | ' lte ' | ' mod ' | 'and' | 'or' | 'xor';
SINGLECOND : ' is ' ('NOT ')? ('odd '|'even ');
MATH : ' * ' | '**' | ' % ' | ' / ' | '^' | ' & ' | ' <><> ';
UNIMATH : '+' | '-';
REALMODIFIERS : 'escape:\'html\'' | 'escape:\'htmlall\'';
REALMODIFIERSS : CAPITALIZE | 'cat:\' text \'' | COUNT_CHARACTERS | 'count_paragraphs' | 'count_sentences' | 'count_words' | 'date_format' | 'default:\'' TEXT '\'' | INDENT | 'lower' | 'nl2br' | 'regex_replace:"/[' STRING* ']/":"' TEXT '"' | 'replace:\'' STRING* '\':\'' TEXT '\'' | SPACIFY | STRING_FORMAT | STRIP | STRIP_TAGS | TRUNCATE | 'upper' | WORDWRAP | 'escape';
CAPITALIZE : 'capitalize' | 'capitalize:true';
COUNT_CHARACTERS : 'count_characters' | 'count_characters:true';
INDENT : 'indent' | 'indent:' INTEGER | 'indent:' INTEGER ':"' TEXT '"';
SPACIFY : 'spacify' | 'spacify:"' TEXT '"';
STRING_FORMAT : 'string_format:"%d"' | 'string_format:"%.' INTEGER 'f"';
STRIP : 'strip' | 'strip:\'' TEXT '\'';
STRIP_TAGS : 'strip_tags' | 'strip_tags:false';
TRUNCATE : 'truncate' | 'truncate:' INTEGER | 'truncate:' INTEGER | 'truncate:' INTEGER ':"' TEXT '"' | 'truncate:' INTEGER ':"' TEXT '":true' | 'truncate:' INTEGER ':"' TEXT '":true:true';
WORDWRAP : 'wordwrap' | 'wordwrap:' INTEGER | 'wordwrap:' INTEGER ':"' TEXT '"' | 'wordwrap:' INTEGER ':"' TEXT '":true';

LTAG : '{';
RTAG : '}' | '} \n';
OPENLITERAL : '{literal}';
CLOSELITERAL : '{/literal} \n';
LBRACE : '(';
RBRACE : ')';
QMARK : ' ? ';
COLON : ' : ';
DOT : '.';
INSTANCEOF : ' instanceof ';
LOPEN : '[';
ROPEN : ']';
QUOTE : '\'';
ID : '@id';
DOUBLEQUOTE : '"';
MINIQUOTE : '`';
EMPTY : ' ';
ASSIGN : 'assign';
STAR : '*';
BLOCK : '{block ';
ENDBLOCK : '{/block}';
CAPTURE : '{capture ';
ENDCAPTURE : '\n{/capture}\n';
STRIPTAG : '{strip}\n';
ENDSTRIP : '{/strip}\n';
FOR : '{for $var=0 to 6}\n';
ENDFOR : '\n{/for}\n';
FOREACH : '{foreach $vars as $var}\n';
VAR : ' $var ';
ENDFOREACH : '\n{/foreach}\n';
EVAL : '{eval var=';
FETCH : '{fetch file=\'';
HTML_SELECT_DATE : '{html_select_date}\n';
SETFILTER : '{setfilter ';
ENDSETFILTER : '\n{/setfilter}\n';
IF : '{if ';
ELSEIF : '\n{elseif ';
ELSE : '\n{else}\n';
ENDIF : '"\n{/if}\n"';
