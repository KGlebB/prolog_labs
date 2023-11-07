% Copyright

implement main
    open core

domains
    author = author(string Initials, string LastName).
    book = book(author Author, string Title, string Publisher, integer Year, integer Pages).
    discipline = string.

class predicates
    belongs: (book, discipline) nondeterm anyflow.

clauses
    belongs(book(author("Г.", "Домбровская"), "Оптимизация запросов PostgreSQL", "М.: ДМК Пресс", 2022, 278), "Базы данных").
    belongs(book(author("Е.", "Моргунов"), "PostgreSQL. Основы языка SQL", "СПб.: БХВ-Петербург", 2018, 336), "Базы данных").
    belongs(book(author("Г.", "Шёгин"), "PostgreSQL. Мастерство разработки", "М.: ДМК Пресс", 2019, 352), "Базы данных").
    belongs(book(author("А.", "Бхаргава"), "Грокаем алгоритмы", "СПб.: Питер", 2017, 288), "Программирование").
    belongs(book(author("Р.", "Мартин"), "Чистый код", "СПб.: Питер", 2019, 464), "Программирование").
    belongs(book(author("Э.", "Гамма"), "Паттерны объектно-ориентированного проектирования", "СПб.: Питер", 2020, 448), "Программирование").
    belongs(book(author("Д.", "Кнут"), "Искусство программирования", "М.: Вильямс", 2020, 2672), "Программирование").
    belongs(book(author("И.В.", "Красиков"), "Рефакторинг", "М.: Вильямс", 2019, 448), "Программирование").
    belongs(book(author("А.", "Диксит"), "Теория игр", "СПб.: Питер", 2017, 754), "Математика").
    belongs(book(author("А.", "Бенджамин"), "Магия чисел", "М.: ДМК Пресс", 2016, 307), "Математика").

clauses
    run() :-
        console::init(),
        fail.
    run() :-
        stdio::write("Введите название книги: "),
        Title = stdio::read(),
        if belongs(book(Author, Title, _, _, _), _)
        then
            Author = author(Initials, LastName),
            stdio::write("Автор книги: ", Initials, " ", LastName, "\n")
        else
            stdio::write("Данная книга отсутствует в домашней библиотеке \n")
        end if,
        fail.
    run() :-
        console::init(),
        stdio::write("Введите название дисциплины: "),
        Discipline = stdio::read(),
        (belongs(Book, Discipline),
        Book = book(Author, Title, Publisher, Year, Pages),
        Author = author(Initials, LastName),
        stdio::write(LastName, " ", Initials, " ", Title, " / ", LastName, " ", Initials, " – ", Publisher, ", ", Year, ". – ", Pages, "с. ", "\n"),
        fail ; !),
        if not(belongs(_, Discipline))
        then
            stdio::write("Книг по данной дисциплине отсутсвуют в домашней библиотеке \n")
        end if.

end implement main

goal
    console::runUtf8(main::run).