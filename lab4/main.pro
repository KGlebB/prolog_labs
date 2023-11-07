% Copyright

implement main
    open core

domains
    thing_list = thing*.
    value_list = value*.
    thing = string.
    value = integer.

class predicates
    subject_set:(thing_list) procedure (o).
    number_set:(value_list) procedure (o).
    append_el:(thing, thing_list, thing_list) procedure (i, i, o).
    find_el:(thing, thing_list) determ (i, i).
    delete_el:(thing, thing_list, thing_list) procedure (i, i, o).
    len:(thing_list, integer) procedure (i, o).

    write_a_list:(thing_list) procedure(i).

    merge_lists:(thing_list, thing_list, thing_list) procedure (i, i, o).

clauses
    subject_set(["table", "chair", "pen", "lamp", "notebook", "book", "laptop", "marker", "sun", "weather"]).
    number_set([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]).
    append_el(X, L, [X|L]).
    find_el(Head, [Head|_]) :- !.
    find_el(Head, [_|Tail]) :- find_el(Head, Tail).
    find_el(_, []) :- fail.
    delete_el(X, [X|Y], Y) :- !.
    delete_el(X, [Z|Y], [Z|W]) :- delete_el (X, Y, W).
    delete_el(_, [], []).
    len([], 0) :- !.
    len([_|X], 1 + N) :- len(X, N).

    write_a_list([]).
    write_a_list([Head|Tail]) :-
        stdio::write(Head), stdio::nl,
        write_a_list(Tail).

    merge_lists([], X, X).
    merge_lists([Head|Tail], SecondList, [Head|Merged]) :-
        merge_lists(Tail, SecondList, Merged).

clauses
    run() :-
        subject_set(X),
        stdio::write("Список после инизиализации: \n"),
        write_a_list(X),

        stdio::write("Введите элемент для добавления (в кавычках): "),
        NewElement = stdio::read(),
        append_el(NewElement, X, Y),
        stdio::write("Список после добавления элемента: \n"),
        write_a_list(Y),
        len(Y, LengthAfterInsert),
        stdio::write("Список имеет длинну ", LengthAfterInsert, ".\n"),

        stdio::write("Введите элемент для удаления (в кавычках): "),
        ToDelete = stdio::read(),
        delete_el(ToDelete, Y, Z),
        stdio::write("Список после удаления элемента: \n"),
        write_a_list(Z),
        len(Z, LengthAfterDelete),
        stdio::write("Список имеет длинну ", LengthAfterDelete, ".\n"),

        stdio::write("Введите элемент для поиска (в кавычках): "),
        ToFind = stdio::read(),
        if find_el(ToFind, Z), !
        then stdio::write("Элемент найден\n")
        else stdio::write("Элемент не найден\n")
        end if,

        stdio::write("Введите список для объединения (в квадратных скобках, элементы в кавычках):"),
        NewList = stdio::read(),
        merge_lists(Z, NewList, MergedList),
        stdio::write("Список после объединения:\n"),
        write_a_list(MergedList).

end implement main

goal
    console::runUtf8(main::run).
