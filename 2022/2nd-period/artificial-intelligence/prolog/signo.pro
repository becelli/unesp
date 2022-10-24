data_nascimento(gustavo, data(26,janeiro, 2002)).
signo(Pessoa, aquario):- data_nascimento(Pessoa, data(Dia, janeiro,_)), Dia >= 20;
			 data_nascimento(Pessoa, data(Dia, fevereiro,_)), Dia =< 18.
