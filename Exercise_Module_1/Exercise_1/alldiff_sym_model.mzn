% alldiff_sym model

include "alldifferent.mzn";

int: n; % number of queens
array[1..n] of var 1..n: q; % variables & domains 

% column attack constraints
constraint alldifferent(q)::domain;

% Something changes than before (row model), in this case the propagation is more fast, so we are defining a model that finds the final solution quicker than row model

% diagonal attack constraints
% Determing all different values for q[i+1]
constraint alldifferent([q[i]+i| i in 1..n])::domain;
constraint alldifferent([q[i]-i| i in 1..n])::domain;

% dual model 
include "lex_lesseq.mzn";
include "lex_greatereq.mzn";
array[1..n, 1..n] of var bool: qb; %dual variables & domains 

% changelling constraints
constraint forall(i,j in 1..n)((q[i]=j) <-> qb[i,j]);

% symmetry breaking constraints 

% The two simmetry constraints for sure clash between each other, so only one of them can be used at time
constraint
    lex_lesseq(array1d(qb), [ qb[j,i] | i,j in 1..n ])
/\  lex_lesseq(array1d(qb), [ qb[i,j] | i in reverse(1..n), j in 1..n ])
/\  lex_lesseq(array1d(qb), [ qb[j,i] | i in 1..n, j in reverse(1..n) ])
/\  lex_lesseq(array1d(qb), [ qb[i,j] | i in 1..n, j in reverse(1..n) ])
/\  lex_lesseq(array1d(qb), [ qb[j,i] | i in reverse(1..n), j in 1..n ])
/\  lex_lesseq(array1d(qb), [ qb[i,j] | i,j in reverse(1..n) ])
/\  lex_lesseq(array1d(qb), [ qb[j,i] | i,j in reverse(1..n) ])
;

/*
constraint
    lex_greatereq(array1d(qb), [ qb[j,i] | i,j in 1..n ])
/\  lex_greatereq(array1d(qb), [ qb[i,j] | i in reverse(1..n), j in 1..n ])
/\  lex_greatereq(array1d(qb), [ qb[j,i] | i in 1..n, j in reverse(1..n) ])
/\  lex_greatereq(array1d(qb), [ qb[i,j] | i in 1..n, j in reverse(1..n) ])
/\  lex_greatereq(array1d(qb), [ qb[j,i] | i in reverse(1..n), j in 1..n ])
/\  lex_greatereq(array1d(qb), [ qb[i,j] | i,j in reverse(1..n) ])
/\  lex_greatereq(array1d(qb), [ qb[j,i] | i,j in reverse(1..n) ])
;
*/

% Search
solve satisfy;