include "globals.mzn";

int: n_tasks;   % Number of tasks
set of int: TASKS = 1..n_tasks;  
array[TASKS] of int: duration; % Task durations

int: n_res;   % Number of resources
set of int: RESOURCES = 1..n_res; 
array[RESOURCES] of int: l; % Resource capacities
array[RESOURCES,TASKS] of int: req; %Resource requirements of tasks

int: p;       % Number of precedence relations
set of int: PREC = 1..p;
array[PREC,1..2] of TASKS: pre; % Precedence relations

%decision and optimization variables and domains 

%precedence constraints

%resource constraints

%implied constraint 

%makespan as objective function

solve minimize makespan;

output [
    "Start times = ", show(start), "\n",
    "End times   =", show([start[i]+duration[i] | i in TASKS]), "\n",
    "makespan = ", show(makespan), "\n"
];

