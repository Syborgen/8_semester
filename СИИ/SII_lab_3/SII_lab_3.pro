database
xpositive(symbol)
xnegative(symbol)

predicates
nondeterm defect(symbol)
do_expert
nondeterm consulting
in_out(symbol)
priznak(symbol)
negative_priznak(symbol)
nondeterm negative(symbol)
nondeterm positive(symbol)
remember(symbol,symbol)
nondeterm clear_facts
check_yes(symbol)
check_no(symbol)


clauses
do_expert:-
	write("Начало работы экспертной системы (На вопросы отвечайте да или нет)"), nl,
	consulting,
	write("Экспертная система закончила свою работу. Нажмите любую кнопку..."), nl,
	readchar(_),
	exit.
	
consulting :- 
        defect(X),!,nl,
        write("Неисправность: ",X,"."),nl,
        clear_facts.
        
consulting :-
        nl,write("В экспертной системе нет такого случая!"),nl,
        clear_facts.
        
in_out(Y) :- 
        write("Вопpос: ",Y,"?"),nl,
        readln(Reply),
        remember(Y,Reply).
        
priznak(Y) :-
        xpositive(Y),!.  
            
priznak(Y) :-
        not(negative(Y)),
        in_out(Y),
        check_yes(Y).
        
negative_priznak(Y) :-
	xnegative(Y),!.
	
negative_priznak(Y) :-
	not(positive(Y)),
	in_out(Y),
	check_no(Y).
	
positive(Y) :-
	xpositive(Y).        

negative(Y) :-
        xnegative(Y).
        
remember(Y,да) :-
        asserta(xpositive(Y)).
        
remember(Y,нет) :-
        asserta(xnegative(Y)).
        
check_yes(Y) :-
	xpositive(Y),!.
	
check_yes(Y) :-
	xnegative(Y),fail.

check_no(Y) :-
	xnegative(Y),!.
	
check_no(Y) :-
	xpositive(Y),fail.

clear_facts :-
        retract(xnegative(_)).
        
clear_facts :-
        retract(xpositive(_)).

defect("топливная система"):-
	priznak("Тип неисправности - Эксплуатационная"),
	priznak("Есть неприятный запах"),
	priznak("Запах бензина"),!.

defect("система смазки"):-
	priznak("Тип неисправности - Эксплуатационная"),
	priznak("Есть неприятный запах"),
	negative_priznak("Запах бензина"),
 	priznak("Есть запах горелого масла"),!.
 	
defect("бак с охлаждающей жидкостью"):-
 	priznak("Тип неисправности - Эксплуатационная"),
	priznak("Есть неприятный запах"),
	negative_priznak("Запах бензина"),
 	negative_priznak("Есть запах горелого масла"),
 	priznak("Есть сладковатый запах"),!.

defect("проводка"):-
 	priznak("Тип неисправности - Эксплуатационная"),
	priznak("Есть неприятный запах"),
	negative_priznak("Запах бензина"),
 	negative_priznak("Есть запах горелого масла"),
 	negative_priznak("Есть сладковатый запах"),
 	priznak("Есть запах гари"),!.

defect("катализатор"):-
 	priznak("Тип неисправности - Эксплуатационная"),
	priznak("Есть неприятный запах"),
	negative_priznak("Запах бензина"),
 	negative_priznak("Есть запах горелого масла"),
 	negative_priznak("Есть сладковатый запах"),
 	negative_priznak("Есть запах гари"),!.

defect("система зажигания"):-
 	priznak("Тип неисправности - Эксплуатационная"),
	negative_priznak("Есть неприятный запах"),
 	priznak("Рывки во время движения"),!.

defect("ходовая система"):-
 	priznak("Тип неисправности - Эксплуатационная"),
	negative_priznak("Есть неприятный запах"),
 	negative_priznak("Рывки во время движения"),
 	priznak("Сильное проседание авто"),!.
 	
defect("коробка передач"):-
 	priznak("Тип неисправности - Эксплуатационная"),
	negative_priznak("Есть неприятный запах"),
 	negative_priznak("Рывки во время движения"),
 	negative_priznak("Сильное проседание авто"),!.

goal
do_expert.

