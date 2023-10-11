% Copyright

implement fn
    open core

clauses
    fact(N, 1) :- N < 1, ! .
    fact(N, F) :-
        N1 = N - 1,
        fact(N1, F1),
        F = F1 * N.

    calculate(S, O) :-
        N=toTerm(S),
        fact(N, F),
        O=toString(F),
        stdio::write(O, "\n").

clauses


end implement fn