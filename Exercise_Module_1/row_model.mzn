

% Row model

% Also by globals.mzn we import all the hidden functions
include "alldifferent.mzn";

% Definition of the decision variables

int: n; % number of queens

% Array of indexes and finally the number of the decision array
array[1..n] of var 1..n: rows; % variables & domains 

% 1st observation
% column attack constraints, we require that all the value assigned to the decision
% variables must be different

% By constraint keyword we are stating that we are defining a constraint

% Double column refers to the propagation

% "::domain" expresses a global constraint, we must be careful about that
% Since we use the GAC constraints we must use the ::domain annotation
constraint alldifferent(rows)::domain;

% diagonal attack constraints
constraint forall(i,j in 1..n where i<j)(abs(rows[i] - rows[j]) != abs(i - j));

% I'm ordering by rows' values, but here we end up with out a correct solution. TERRIBLE THING TO DO.
/*
constraint forall(i in 1..n)(rows[i]<=rows[i+1]);
*/

% Search
solve satisfy; 
