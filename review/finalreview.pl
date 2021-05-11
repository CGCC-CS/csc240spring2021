some_numbers(Even, Square, MultOf3) :- 
    some_numbers(Even, Square, MultOf3,
                 [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22]).
some_numbers(Even, Square, MultOf3, Numbers) :-
    member(Even, Numbers),
    member(Square, Numbers),
    member(MultOf3, Numbers),
    0 is Even mod 2, 
    member(Sqrt, Numbers),
    Square is Sqrt * Sqrt,
    0 is MultOf3 mod 3,
    Even \= Square,
    Even \= MultOf3,
    Square \= MultOf3.
