domains
movie=symbol
preference=symbol
question=symbol

facts
y_answer(preference)
n_answer(preference)

predicates

nondeterm run
nondeterm loop
nondeterm main
nondeterm movie(symbol)
nondeterm preference(symbol)
nondeterm clearYanswer
nondeterm clearNanswer
quiz(question,preference)
remember(preference,symbol)
ask(question,preference)


clauses

run:-
write("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"),
write("                                                                                    Welcome to Movie Recommendation System    \n"),
write("----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------\n"),
write ("\tThis systems is desiged to recommend you a movie based on your current status and other several questions via a small quiz\n\n"),
write("   > Please answer the following questions with yes or no (y/n)."),loop.

% loop to repeat the quiz
loop:-
nl,nl, main,
write("\n\nDo you want to retake the quiz? (y/n) "),
readchar(Ans),Ans><'n',
nl,clearYanswer,clearNanswer,loop.

loop:-
write("\n\n    > Thank you for using our system. Bye.    \n\n").

% main 
main:-
movie(Movie),!,
write("\n    > The quiz have been finished...    \n"),
write("\n    > The recommended movie is ",Movie,", Enjoy!").

% After cut using ! , in pre-main when no matches found
main:-
write("\n    > Oops, there is no movie that matches your current status.. try again!").

% quiz for pre-answer about preferences
quiz(_,Preference):-
y_answer(Preference),!.

% quiz for pre-answer,and ask user
quiz(Question,Preference):-
not(n_answer(Preference)),ask(Question,Preference).

% Ask user and get the answer
ask(Question,Preference):-
write(Question), readln(Answer),
remember(Preference,Answer),Answer="y".

% Save answers
remember(Preference,"y"):-
asserta(y_answer(Preference)). % Save yes answers
remember(Preference,"n"):-
asserta(n_answer(Preference)). % Save no answers


% Clear all the saved answers from system
clearYanswer:-retract(y_answer(_)),fail.
clearYanswer.
clearNanswer:-retract(n_answer(_)),fail.
clearNanswer.

% ---------- preferences ----------


% quiz questions
preference(books):- quiz("\n - Do you like movies based on books? (y/n) ",books).
preference(comedy):- quiz("\n - Are you in the mood for a laugh? (y/n) ",comedy).
preference(family):- quiz("\n - Are you planning for a family night? (y/n) ",family).
preference(cartoon):- quiz("\n - Do you like cartoon movies? (y/n) ",cartoon).
preference(old):- quiz("\n - Do you want a blast from the past? (y/n) ",old).
preference(drama):- quiz("\n - Do you believe that drama spices up your life? (y/n) ",drama).
preference(cry):- quiz("\n - Tissues at the ready? (y/n) ",cry).
preference(romcom):- quiz("\n - Do you like cheesy romcom movies? (y/n) ",romcom).
preference(action):- quiz("\n - Do you like movies that have many action scenes? (y/n) ",action).
preference(sf):- quiz("\n - Did you enjoy the movie Interstellar? (y/n) ",sf).
preference(thrill):- quiz("\n - Thriller night? (y/n) ",thrill).
preference(historical):- quiz("\n - Do you enjoy historical movies? (y/n) ",historical).
preference(musical):- quiz("\n - Do you think of your life as a big musical show? (y/n) ",musical).
preference(romance):- quiz("\n - Do you feel the love in the air? (y/n) ",romance).
preference(truestory):- quiz("\n - Do you like movies based on real story? (y/n) ",truestory).




% ---------- Movies ----------

%---------Me Before You--------
movie("Me before you"):- preference(books),preference(drama),preference(cry),preference(romance).

%---------Titanic--------
movie("Titanic"):- preference(old),preference(drama),preference(cry),preference(truestory).
movie("Titanic"):- preference(old),preference(drama),preference(romance),preference(truestory).

%---------Harry Potter--------
movie("Harry potter"):- preference(books),preference(family),preference(thrill).
movie("Harry potter"):- preference(books),preference(thrill).

%---------Toy Story--------
movie("Toy story"):- preference(comedy),preference(family),preference(cartoon).
movie("Toy story"):- preference(comedy),preference(cartoon).


%-------------mamma mia---------------
movie("Mamma mia"):- preference(romance),preference(musical),preference(drama).
movie("Mamma mia"):- preference(romance),preference(musical).

%---------Don't Breathe--------
movie("Don't breathe"):- preference(action),preference(thrill).
movie("Don't breathe"):- preference(thrill).

%---------To the all boys I've loved before--------
movie("To the all boys I've loved before"):- preference(romcom),preference(drama).

%---------50 first dates----------------
movie("50 first dates"):- preference(romcom).

%---------Identity theift--------
movie("Identity theift"):- preference(comedy),preference(action).

%---------Litttle women--------
movie("Little women"):- preference(drama),preference(historical),preference(books).

%---------Parasite--------
movie("Parasite"):- preference(thrill),preference(comedy).

%---------Joker-----------
movie("Joker"):- preference(drama),preference(thrill).

%---------Five feet apart------------
movie("Five feet apart"):-preference(cry).

%--------the greatest showman-----------
movie("The greatest showman"):- preference(drama),preference(musical).
movie("The greatest showman"):- preference(musical).

%------------the intouchable---------
movie("The intouchables"):- preference(truestory),preference(comedy).

%------------spirit-----------------
movie("Spirit: Stallion of the cimarron"):- preference(cartoon),preference(historical).

%-------------lion-----------------
movie("Lion"):- preference(truestory),preference(cry).
movie("Lion"):- preference(truestory).

%-------------begin again-------------
movie("Begin again"):- preference(chill),preference(drama).
movie("Begin again"):- preference(chill).

%-------------fight club--------------
movie("Fight club"):- preference(old).

%-------------The hunger games---------
movie("The hunger games"):- preference(books),preference(action).

%--------------Eat, pray, love-----------
movie("Eat, pray, love"):- preference(books).

%--------------Diary of a wimpy kid-------------
movie("Diary of a wimpy kid"):- preference(family).

%---------White chicks--------
movie("White chicks"):- preference(comedy).

%--------Ride along-----------
movie("Ride along"):- preference(action).

%---------1917---------------
movie("1917"):- preference(historical).


goal
run.
