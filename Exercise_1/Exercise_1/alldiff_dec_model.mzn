% Alldiff decomposition model

include "alldifferent.mzn";

int: n ; % number of queens
array [1..n] of var 1..n: q; % variables & domains 

% They are all decomposition of the global constraints saw previously
constraint forall(i,j in 1..n where i<j)(q[i] != q[j]);

constraint forall(i,j in 1..n where i<j)(q[i]+i != q[j]+j);

constraint forall(i,j in 1..n where i<j)(q[i]-i != q[j]-j);

% aldiff decomposition

% With this line I want to see the actual propagation of the problem. This tells to the solver how to ...
solve :: int_search(q, input_order, indomain_min)  satisfy;

% By dynamic heuristic, even if we have identical models we could obtain totally different results