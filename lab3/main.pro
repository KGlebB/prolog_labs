implement main
    open core

class predicates

    parents: (string NameP, string NameCh) nondeterm anyflow.

    mother : (string NameM, string NameCh) nondeterm (o,i).
    father : (string NameF, string NameCh) nondeterm (o,i).

    brother: (string NameB, string NameCh) nondeterm (o,i).
    sister: (string NameS, string NameCh) nondeterm (o,i).

    grandmother: (string NameGM, string NameCh) nondeterm (o,i).
    grandfather: (string NameGF, string NameCh) nondeterm (o,i).

    aunt: (string NameA, string NameCh) nondeterm (o,i).
    uncle: (string NameU, string NameCh) nondeterm (o,i).

    woman: (string) determ (i).
    man: (string) determ (i).

clauses
    parents("Pam","Bob").
    parents("Tom","Bob").
    parents("Tom","Lis").
    parents("Pam","Lis").
    parents("Lis","Jack").
    parents("Bob","Ann").
    parents("Bob","Pat").
    parents("Pat","Jimmy").

    woman("Pam").
    woman("Lis").
    woman("Ann").
    woman("Pat").

    man("Tom").
    man("Bob").
    man("Jimmy").
    man("Jack").

clauses
    mother(X, Y) :- parents(X, Y), woman(X).
    father(X, Y) :- parents(X, Y), man(X).
    brother(X, Y) :- parents(Z, X), parents(Z, Y), man(X), not(X = Y).
    sister(X, Y) :- parents(Z, X), parents(Z, Y), woman(X), not(X = Y).
    grandmother(X, Y) :- parents(Z, Y), parents(X, Z), woman(X).
    grandfather(X, Y) :- parents(Z, Y), parents(X, Z), man(X).
    aunt(X, Y) :- parents(Z, Y), sister(X, Z).
    uncle(X, Y) :- parents(Z, Y), brother(X, Z).

clauses
    run() :- console::init(), fail().
    run() :-
        stdio::write("Enter a name: "),
        Name = stdio::readLine(),

        if mother(M, Name), !
        then
            stdio::writef("\nMother's name is %s\n", M)
        else
            stdio::writef("\nNO mother\n")
        end if,

        if father(F, Name), !
        then
            stdio::writef("\nFather's name is %s\n", F)
        else
            stdio::writef("\nNO father\n")
        end if,

        if sister(Sister, Name), !
        then
            stdio::writef("\nSisters's name is %s\n", Sister)
        else
            stdio::writef("\nNO sisters\n")
        end if,

        if brother(Brother, Name), !
        then
            stdio::writef("\nBrother's name is %s\n", Brother)
        else
            stdio::writef("\nNO brothers\n")
        end if,

        if grandmother(GM, Name), !
        then
            stdio::writef("\nGrandmother's name is %s\n", GM)
        else
            stdio::writef("\nNO grandmother\n")
        end if,

        if grandfather(GF, Name), !
        then
            stdio::writef("\nGrandfather's name is %s\n", GF)
        else
            stdio::writef("\nNO grandfather\n")
        end if,

        if aunt(A, Name), !
        then
            stdio::writef("\nAunt's name is %s\n", A)
        else
            stdio::writef("\nNO aunt\n")
        end if,

        if uncle(U, Name), !
        then
            stdio::writef("\nUncle's name is %s\n", U)
        else
            stdio::writef("\nNO uncle\n")
        end if.

end implement main

goal
    console::runUtf8(main::run).