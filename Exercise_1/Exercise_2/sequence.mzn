int: n;
array[0..n-1] of var 0..n-1: x;
  
% meta constraint
constraint forall(i in 0..n-1)(x[i] = sum(j in 0..n-1)(x[j]=i));

% the first implied constraint

% the second implied constraint

solve satisfy;

output [ "x = \(x);\n" ] ;