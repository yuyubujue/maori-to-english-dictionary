%Nouns
% Māori nouns
noun(mi("whare");mi("kōtiro");mi("tama");mi("waka");mi("toki");mi("manu");mi("tangata");mi("wahine"); mi("hipi")).
singular_number(mi("whare");mi("kōtiro");mi("tama");mi("waka");mi("toki");mi("manu");mi("tangata");mi("wahine"); mi("hipi")).

%English nouns
noun(en("house");en("girl");en("boy");en("canoe");en("mat");en("axe"); en("bird"); en("person"); en("man"); en("woman"); en("sheep")).
singular_number(en("house");en("girl");en("boy");en("canoe");en("mat");en("axe"); en("bird"); en("person"); en("man"); en("woman"); en("sheep")).

%English pronouns
pronoun(en("I"); en("you"); en("it"); en("they"); en("she"); en("he"); en("thee"); en("ye"); en("thou");  en("yous"); en("y'all"); en("all y'all")).
singular_number(en("I"); en("you"); en("it"); en("they"); en("she"); en("he"); en("thee"); en("thou"); en("y'all")).
plural_number( en("you");  en("they"); en("ye"); en("yous"); en("y'all"); en("all y'all")).

%Māori pronouns
pronoun(mi("ahau"); mi("ia");  mi("koe"); mi("tāua"); mi("māua"); mi("kōrua"); mi("rāua"); mi("tātou"); mi("mātou"); mi("koutou"); mi("rātou")).
singular_number(mi("ahau"); mi("ia");  mi("koe")).
dual_number(mi("tāua");mi("māua"); mi("kōrua"); mi("rāua")).
plural_number(mi("tātou"); mi("mātou"); mi("koutou"); mi("rātou")).


%some words have different plural formation rules
plural_exception(en("sheep"); en("knife"); en("person"); en("man"); en("woman")).
plural_form(en("sheep"),en("sheep")).
plural_form(en("people"),en("person")).
plural_form(en("knives"),en("knife")).

%otherwise
plural_form(en(concat(S,"s")),en(S)) :-
    noun(en(S)),
    singular_number(en(S)),
    not plural_exception(en(S)).

plural_form(mi(S),mi(S)):-
    noun(mi(S)),
    singular_number(mi(S)),
    not plural_exception(mi(S)).

dual_form(mi(S),mi(S)):-
    noun(mi(S)),
    singular_number(mi(S)).

plural_number(W) :- plural_form(W,_).
noun(W) :- plural_form(W,L),noun(L).

%prepositions
preposition(en("in"); en("on"); en("with")).

%verb
infinitive(en("be");en("run");en("eat"); en("go"); en("cook");).
irregular_verb(en("be"); en("go")).
regular_third_person_sing(en("eat"), en("eats")).
regular_third_person_sing(en("cook"), en("cooks")).

participle(en("cook"),present_tense,en("cooking")).
participle(en("cook"),past_tense,en("cooked")).
participle(en("eat"),present_tense,en("eating")).
participle(en("eat"),past_tense,en("eaten")).
participle(en("sit"),present_tense,en("sitting")).
participle(en("sit"),past_tense,en("sat")).
infinitive(en(W)):- participle(en(W),_,_).

verb_form(1,en("be"),first_person,singular_number,present_tense,simple_aspect,indicitive_mood,en("am")).
verb_form(1,en("be"),second_person,singular_number,present_tense,simple_aspect,indicitive_mood,en("are")).
verb_form(1,en("be"),third_person,singular_number,present_tense,simple_aspect,indicitive_mood,en("is")).
verb_form(1,en("be"),first_person,plural_number,present_tense,simple_aspect,indicitive_mood,en("are")).
verb_form(1,en("be"),second_person,plural_number,present_tense,simple_aspect,indicitive_mood,en("are")).
verb_form(1,en("be"),third_person,plural_number,present_tense,simple_aspect,indicitive_mood,en("are")).

verb_form(1,en("be"),first_person,singular_number,past_tense,simple_aspect,indicitive_mood,en("was")).
verb_form(1,en("be"),second_person,singular_number,past_tense,simple_aspect,indicitive_mood,en("were")).
verb_form(1,en("be"),third_person,singular_number,past_tense,simple_aspect,indicitive_mood,en("was")).
verb_form(1,en("be"),first_person,plural_number,past_tense,simple_aspect,indicitive_mood,en("were")).
verb_form(1,en("be"),second_person,plural_number,past_tense,simple_aspect,indicitive_mood,en("were")).
verb_form(1,en("be"),third_person,plural_number,past_tense,simple_aspect,indicitive_mood,en("were ")).

%% look for more compact syntax for this
verb_form(1,en(V),first_person,singular_number,present_tense,simple_aspect,indicitive_mood,en(V)) :-
	infinitive(en(V)), not irregular_verb(en(V)) .
verb_form(1,en(V),second_person,singular_number,present_tense,simple_aspect,indicitive_mood,en(V)) :-
	infinitive(en(V)), not irregular_verb(en(V)) .
verb_form(1,en(V),third_person,singular_number,present_tense,simple_aspect,indicitive_mood,en(TS)) :-
	regular_third_person_sing(en(V),en(TS)), not irregular_verb(en(V)) .

verb_form(1,en(V),first_person,plural_number,present_tense,simple_aspect,indicitive_mood,en(V)) :-
	infinitive(en(V)), not irregular_verb(en(V)).
verb_form(1,en(V),second_person,plural_number,present_tense,simple_aspect,indicitive_mood,en(V)) :-
	infinitive(en(V)), not irregular_verb(en(V)).
verb_form(1,en(V),third_person,plural_number,present_tense,simple_aspect,indicitive_mood,en(V)) :-
	infinitive(en(V)), not irregular_verb(en(V)) .


%multi word verb forms (in this case, simple progressive (not perfective)) formed with form of be, and present participle
verb_form(2,en(I),PER,NUM,TENSE,progressive_aspect,indicitive_mood,en(B),en(PP)) :-
	infinitive(en(I)), not irregular_verb(en(I)),
	verb_form(1,en("be"),PER,NUM,TENSE,simple_aspect,indicitive_mood,en(B)),
	participle(en(I),present_tense,en(PP)).

%todo clean up active and passive voice in En and make consistent in Mi
tense_particle(mi("kua"); mi("i"); mi("e"); mi("ka"); mi("me")).

verb_active(mi("tunu"); mi("kite"); mi("tuhituhi"); mi("noho"); mi("aroha")).

verb_passive(mi("tunua"); mi("kitea"); mi("tuhituhia"); mi("tuhia"); mi("nohoia"); mi("arohaina")).
verb(V):- verb_active(V).
verb(V):- verb_passive(V).

%single and multiple term verb forms are verbs
verb(V) :- verb_form(1,I,_,_,_,_,_,V),infinitive(I).
verb2(V,V2) :- verb_form(2,I,_,_,_,_,_,V,V2),infinitive(I).

%Articles
%Māori articles
indefinite_article( mi("he")).
definite_article(mi("ngā");mi("te")).
singular_number(mi("te");mi("he")).
plural_number(mi("he");mi("ngā")).
%English articles and determiners
indefinite_article( en("a"); en("an")).
definite_article(en("the")).
singular_number(en("a");en("an");en("the")).
plural_number(en("the")).

determiner(en("some"); en("any")).

%Both languages
article(W):- indefinite_article(W).
article(W):- definite_article(W).

determiner(W) :- article(W).

%This is very important - if you don't add a word class here, the program won't work.
word(W) :- determiner(W).
word(W) :- noun(W).
word(W) :- preposition(W).
word(W) :- verb(W).
word(W1) :- verb2(W1,W2).
word(W2) :- verb2(W1,W2).
word(W) :- pronoun(W).
word(W) :- tense_particle(W).

string(X) :- word(mi(X)).
string(X) :- word(en(X)).


word_position(S,word_number(P),mi(WS)) :- string_position(S,string_number(P),WS), word(mi(WS)).
word_position(S,word_number(P),en(WS)) :- string_position(S,string_number(P),WS), word(en(WS)).

%English & Māori nouns are NPs
phrase_span(S,P1,P1,np,the_phrase(np,N)) :- word_position(S,P1,N),noun(N).

%English & Māori pronouns are NPs
phrase_span(S,P1,P1,np,the_phrase(np,PN)) :- word_position(S,P1,PN),pronoun(PN).

%English & Māori determiners followed by nouns are NPs if they agree in number
phrase_span(S,word_number(P1),word_number(P3),np,the_phrase(np,D,N)) :-
    word_position(S,word_number(P1),D),
    determiner(D),
    phrase_span(S,word_number(P2),word_number(P3),np,N),
    P2=P1+1.

%similar for PP
phrase_span(S,word_number(P1),word_number(P3),prepp,the_phrase(prepp,P,N)) :-
    word_position(S,word_number(P1),P),preposition(P),
    phrase_span(S,word_number(P2),word_number(P3),np,N),
    P2=P1+1.

% NP PP is NP
phrase_span(S,word_number(P1),word_number(P4),np,the_phrase(np,NP,PP)) :-
    phrase_span(S,word_number(P1),word_number(P2),np,NP),
    phrase_span(S,word_number(P3),word_number(P4),prepp,PP),
    P3=P2+1.

% V NP is VP in English
phrase_span(S,word_number(P1),word_number(P3),vp,the_phrase(vp,V,NP)) :-
    word_position(S,word_number(P1),V),verb(V),
    phrase_span(S,word_number(P2),word_number(P3),np,NP),
    P2=P1+1.

% V can be VP in English  (as in "I cook" or "I am cooking"
phrase_span(S,word_number(P1),word_number(P1),vp,the_phrase(vp,V)) :-
    word_position(S,word_number(P1),V),verb(V).
% The "I am cooking" case
phrase_span(S,word_number(P1),word_number(P2),vp,the_phrase(vp,V,V2)) :-
    word_position(S,word_number(P1),V),
    word_position(S,word_number(P2),V2),
    verb2(V,V2).

%Tense_particle V is VP in Māori
phrase_span(S,word_number(P1),word_number(P2),vp,the_phrase(vp,TP,V)) :-
    word_position(S,word_number(P1),TP), tense_particle(TP),
    word_position(S,word_number(P2),V),verb(V),
    P2=P1+1.

% VP PP is VP in En
phrase_span(S,word_number(P1),word_number(P4),vp,the_phrase(vp,VP,PP)) :-
    phrase_span(S,word_number(P1),word_number(P2),vp,VP),
    phrase_span(S,word_number(P3),word_number(P4),prepp,PP),
    P3=P2+1.

% NP VP is S in En
clause_span(S,word_number(P1),word_number(P4),sent,the_clause(sent,NP,VP)) :-
    phrase_span(S,word_number(P1),word_number(P2),np,NP),
    phrase_span(S,word_number(P3),word_number(P4),vp,VP),
    P3=P2+1.
    

% VP NP is S in Mi
clause_span(S,word_number(P1),word_number(P4),sent,the_clause(sent,VP,NP)) :-
    phrase_span(S,word_number(P1),word_number(P2),vp,VP),
    phrase_span(S,word_number(P3),word_number(P4),np,NP),
    P3=P2+1.

%These are essentially diagnostic prints for non-trivial phrases and clauses
l_noun_phrase(S,P, P1,P2):- phrase_span(S,P1,P2,np,P), P1<>P2.
l_prep_phrase(S,P, P1,P2):- phrase_span(S,P1,P2,prepp,P), P1<>P2.
l_verb_phrase(S,P, P1,P2):- phrase_span(S,P1,P2,vp,P), P1<>P2.

%A sentence is a sentence clause that has a length > 1
sentence(S,C, P1,P2):- clause_span(S,P1,P2,sent,C), P1<>P2, active(S).



%it's a full parse if it's a sentence and it starts at the first word of the sentence and the sentence has no words past the span it covers

full_parse(S,C) :- sentence(S,C,P1,P2), P1=word_number(1), not word_position(S,word_number(NXT),_), P2=word_number(THIS), NXT=THIS+1.



%Data
%English Sentence
string_position(sentence(1),string_number(1),"the").
string_position(sentence(1),string_number(2),"girl").
string_position(sentence(1),string_number(3),"is").
string_position(sentence(1),string_number(4),"in").
string_position(sentence(1),string_number(5),"the").
string_position(sentence(1),string_number(6),"canoe").
%active(sentence(1)).

string_position(sentence(2),string_number(1),"the").
string_position(sentence(2),string_number(2),"girl").
string_position(sentence(2),string_number(3),"in").
string_position(sentence(2),string_number(4),"the").
string_position(sentence(2),string_number(5),"canoe").
string_position(sentence(2),string_number(6),"is").
string_position(sentence(2),string_number(7),"sitting").
%active(sentence(2)).

string_position(sentence(4), string_number(1),"I").
string_position(sentence(4), string_number(2),"cook").
%active(sentence(4)).

string_position(sentence(5), string_number(1),"I").
string_position(sentence(5), string_number(2),"was").
string_position(sentence(5), string_number(3),"cooking").
%active(sentence(5)).

string_position(sentence(6),string_number(1),"the").
string_position(sentence(6),string_number(2),"sheep").
string_position(sentence(6),string_number(3),"is").
string_position(sentence(6),string_number(4),"sitting").
string_position(sentence(6),string_number(5),"in").
string_position(sentence(6),string_number(6),"the").
string_position(sentence(6),string_number(7),"canoe").
%active(sentence(6)).

string_position(sentence(7),string_number(1),"I").
string_position(sentence(7),string_number(2),"sit").
string_position(sentence(7),string_number(3),"in").
string_position(sentence(7),string_number(4),"the").
string_position(sentence(7),string_number(5),"canoe").
%active(sentence(7)).

string_position(sentence(8),string_number(1),"I").
string_position(sentence(8),string_number(2),"sit").
%active(sentence(8)).

string_position(sentence(9),string_number(1),"the").
string_position(sentence(9),string_number(2),"sheep").
string_position(sentence(9),string_number(3),"is").
string_position(sentence(9),string_number(4),"sitting").
string_position(sentence(9),string_number(5),"on").
string_position(sentence(9),string_number(6),"the").
string_position(sentence(9),string_number(7),"mat").
string_position(sentence(9),string_number(8),"in").
string_position(sentence(9),string_number(9),"the").
string_position(sentence(9),string_number(10),"canoe").
active(sentence(9)).

%Māori Sentence
string_position(sentence(3),string_number(1),"ka").
string_position(sentence(3),string_number(2),"tunu").
string_position(sentence(3),string_number(3),"ahau").
%active(sentence(3)).

%diag(D,S,P1,P2) :- 		       verb(D), word_position(S,word_number(P1),D), P2=P1+1.

%#hide.
#show full_parse/2.
%#show mydiag/1. %word_position/3.
%#show participle/3.
%#show verb2/2.
%#show sentence/4.
%#show verb_form/7.

%----
