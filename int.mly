%%

%public _0(F, THEN, ELSE): THEN { $1 }
%public _1(F, THEN, ELSE): succ(_0, F, THEN, ELSE) { $1 }
%public _2(F, THEN, ELSE): succ(_1, F, THEN, ELSE) { $1 }
%public _3(F, THEN, ELSE): succ(_2, F, THEN, ELSE) { $1 }
%public _4(F, THEN, ELSE): succ(_3, F, THEN, ELSE) { $1 }
%public _5(F, THEN, ELSE): succ(_4, F, THEN, ELSE) { $1 }
%public _6(F, THEN, ELSE): succ(_5, F, THEN, ELSE) { $1 }
%public _7(F, THEN, ELSE): succ(_6, F, THEN, ELSE) { $1 }
%public _8(F, THEN, ELSE): succ(_7, F, THEN, ELSE) { $1 }
%public _9(F, THEN, ELSE): succ(_8, F, THEN, ELSE) { $1 }

%public succ(_N, F, THEN, ELSE): F(_N(F, THEN, ELSE), ELSE) { $1 }
%public plus(_M, _N, F, THEN, ELSE): _M(F, _N(F, THEN, ELSE), ELSE) { $1 }

%public ifzero(_N, THEN, ELSE): _N(False, THEN, ELSE) { $1 }

epsilon: { [] }
rep(X, Y): Y X { $1::$2 }
_loption(X):
  |   { [] }
  | X { $1 }

%public repeat(_N, X): _N(rep, epsilon, X) { $1 }

addtoopt(X, Y): _loption(rep(X, Y)) { $1 }

%public upto(_N, X): _N(addtoopt, epsilon, X) { $1 }

%public atleast(_N, X): repeat(_N, X) X* { $1 @ $2 }
