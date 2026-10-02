#define fin (all_right_side ==true);
#define gc (g_and_c == false);
#define wg  (w_and_g == false)	;
bool  all_right_side,  w_and_g,  g_and_c;

active proctype river()
{
	bit f = 0, w=0, g = 0, c = 0;
	do
	::  (f==1) && (f == w) && (f == g) && (f==c) -> all_right_side = true; break;
	:: else ->
		if
		:: (f == w) ->  f = 1-f; w = 1-w;
		:: (f == g) ->  f = 1-f; g = 1-g;
		:: (f == c) ->  f = 1-f; c = 1- c;
		:: (true) -> f = 1-f;
		fi;
		if
		::(f != g) && (g == c)  ->  g_and_c = true;
		:: (f != w) &&  (w == g)  -> w_and_g=true;
		:: else -> skip
		fi;
	od;
	printf("OK!");
}

/*
never{
	do
		:: (fin & gc & wg) -> break;
		:: else;
	od;	
}
*/
ltl {!(<> fin && []( wg && gc ) )} 

