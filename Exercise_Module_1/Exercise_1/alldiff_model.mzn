% alldiff model

include "alldifferent.mzn";

int: n; % number of queens
array[1..n] of var 1..n: q; %variables & domains

 %column attack constraints
constraint alldifferent(q)::domain;

% column attack constraints
% Determing all different values for q[i+1]

% diagonal attack constraints
constraint alldifferent([q[i]+i| i in 1..n])::domain;
constraint alldifferent([q[i]-i| i in 1..n])::domain;

% Search
solve satisfy; 