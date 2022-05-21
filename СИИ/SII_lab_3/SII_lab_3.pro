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
	write("������ ������ ���������� ������� (�� ������� ��������� �� ��� ���)"), nl,
	consulting,
	write("���������� ������� ��������� ���� ������. ������� ����� ������..."), nl,
	readchar(_),
	exit.
	
consulting :- 
        defect(X),!,nl,
        write("�������������: ",X,"."),nl,
        clear_facts.
        
consulting :-
        nl,write("� ���������� ������� ��� ������ ������!"),nl,
        clear_facts.
        
in_out(Y) :- 
        write("���p��: ",Y,"?"),nl,
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
        
remember(Y,��) :-
        asserta(xpositive(Y)).
        
remember(Y,���) :-
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

defect("��������� �������"):-
	priznak("��� ������������� - ����������������"),
	priznak("���� ���������� �����"),
	priznak("����� �������"),!.

defect("������� ������"):-
	priznak("��� ������������� - ����������������"),
	priznak("���� ���������� �����"),
	negative_priznak("����� �������"),
 	priznak("���� ����� �������� �����"),!.
 	
defect("��� � ����������� ���������"):-
 	priznak("��� ������������� - ����������������"),
	priznak("���� ���������� �����"),
	negative_priznak("����� �������"),
 	negative_priznak("���� ����� �������� �����"),
 	priznak("���� ����������� �����"),!.

defect("��������"):-
 	priznak("��� ������������� - ����������������"),
	priznak("���� ���������� �����"),
	negative_priznak("����� �������"),
 	negative_priznak("���� ����� �������� �����"),
 	negative_priznak("���� ����������� �����"),
 	priznak("���� ����� ����"),!.

defect("�����������"):-
 	priznak("��� ������������� - ����������������"),
	priznak("���� ���������� �����"),
	negative_priznak("����� �������"),
 	negative_priznak("���� ����� �������� �����"),
 	negative_priznak("���� ����������� �����"),
 	negative_priznak("���� ����� ����"),!.

defect("������� ���������"):-
 	priznak("��� ������������� - ����������������"),
	negative_priznak("���� ���������� �����"),
 	priznak("����� �� ����� ��������"),!.

defect("������� �������"):-
 	priznak("��� ������������� - ����������������"),
	negative_priznak("���� ���������� �����"),
 	negative_priznak("����� �� ����� ��������"),
 	priznak("������� ���������� ����"),!.
 	
defect("������� �������"):-
 	priznak("��� ������������� - ����������������"),
	negative_priznak("���� ���������� �����"),
 	negative_priznak("����� �� ����� ��������"),
 	negative_priznak("������� ���������� ����"),!.

goal
do_expert.

