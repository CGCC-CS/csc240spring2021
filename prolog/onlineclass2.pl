% recursion
% f(0) = 1
% f(n) = 2n + f(n-1)
% recfunc/2
recfunc(0, 1).
              % N - 1                   f(n-1)       2N + f(n-1)
recfunc(N, F) :- N1 is N - 1, recfunc(N1, F1), F is (2 * N) + F1.

% Lists & Pairs
% PAIR: [ Head | Tail ]
% LIST: [] or [ Head | TailIsAList ]

% pairparts/3
pairparts([H|T], H, T).

% swappair/2
swappair([H|T], [T|H]).

% is_pair/1
is_pair([_H|_T]).

% is_list/1
is_list([]).
is_list([_H|T]) :- is_list(T).

% at_least_four_elements/1 - does the list have at least 4 elements?
at_least_four_elements([_,_,_,_|_T]).

% third_element/2 - what is the third element of a list?
third_element([_,_,X|_T], X).

% add_list/2 - add all the elements of list
add_list([], 0).
add_list([H|T], Sum) :- add_list(T, TailSum), Sum is H + TailSum.

% increment/2 
increment([],[]).
increment([H|T],[H1|TailIncrement]) :- H1 is H + 1, increment(T, TailIncrement).

% multiples_of_n/3 - include only the multiples of N
multiples_of_n([],_,[]).
multiples_of_n([H|T],N,[H|TailMultiples]) :- 0 is H mod N, multiples_of_n(T,N,TailMultiples).
multiples_of_n([H|T],N,TailMultiples) :- X is H mod N, X > 0, multiples_of_n(T,N,TailMultiples).

% append two lists
append([],Lst,Lst).
append([H|T],[],[H|T]).
append([H|T], [H2|L2], [H|AppendedList]) :- append(T, [H2|L2], AppendedList).
