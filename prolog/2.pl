/* 
  Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

    1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

  By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.
*/

  /* generate Fibonacci sequence */
  /* call fibSeq with seed T1 = 0 and T2 = 0. */
  
  fibSeq(0, 0, []). /* terminate */
  fibSeq(T1, T2, [A|L]) :-
    A is T1 + T2,
    A =< 4000000,
    fibSeq(T2, A, L).
  fibSeq(T1, T2, L) :- 
    A is T1 + T2,
    A > 4000000,
    fibSeq(0, 0, L).

  /* filter even terms */
  evenTerms([], []).
  evenTerms([H|T], [H|L]) :- mod(H,2) =:= 0, evenTerms(T, L).
  evenTerms([_|T], L) :- evenTerms(T,L).

  /* sum list */
  sumTerms([], 0).
  sumTerms([H|T], L) :- sumTerms(T, L1), L is H + L1.

/*
?- fibSeq(0,1,L), evenTerms(L, Y), sumTerms(Y, S).
L = [1, 2, 3, 5, 8, 13, 21, 34, 55|...],
Y = [2, 8, 34, 144, 610, 2584, 10946, 46368, 196418|...],
S = 4613732 .
*/