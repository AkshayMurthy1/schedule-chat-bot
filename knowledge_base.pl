
% Advanced Courses
credit(geometry_advanced, 1).
credit(algebra_2_advanced, 1).
credit(chemistry_advanced, 1).
credit(art_2_advanced, 1).
credit(chinese_3_advanced, 1).
credit(dance_iv_advanced, 1).
credit(english_ii_advanced, 1).
credit(english_i_advanced, 1).
credit(biology_advanced, 1).
credit(french_3_advanced, 1).
credit(gt_humanities_i_english_i_advanced, 1).
credit(algebra_1_advanced, 1).
credit(advanced_public_speaking, 1).
credit(spanish_3_advanced, 1).
credit(comp_sci_advanced,1).

% On-level Courses
credit(geometry, 1).
credit(algebra_2, 1).
credit(chemistry, 1).
credit(art_2, 1).
credit(chinese_3, 1).
credit(dance_iv, 1).
credit(english_ii, 1).
credit(english_i, 1).
credit(art_1, 1).
credit(biology, 1).
credit(public_speaking, 1).
credit(spanish_3, 1).
credit(algebra_1, 1).
credit(journalism_yearbook_ii_iii, 1).
credit(comp_sci,1).
credit(soccer,1).
credit(basketball,1).
credit(baseball,1).


% Prerequisites
prerequisite(geometry_advanced, [algebra_1_advanced]).
prerequisite(algebra_2_advanced, [geometry_advanced]).
prerequisite(chemistry_advanced, [biology_advanced]).
prerequisite(art_2_advanced, [art_1_advanced]).
prerequisite(chinese_3_advanced, [chinese_2]).
prerequisite(dance_iv_advanced, [dance_iii]).
prerequisite(english_2_advanced, [english_i_advanced]).
prerequisite(english_1_advanced, [none]).
prerequisite(biology_advanced, [none]).
prerequisite(french_3_advanced, [french_2]).
prerequisite(gt_humanities_i_english_i_advanced, [none]).
prerequisite(algebra_1_advanced, [none]).
prerequisite(advanced_public_speaking, [none]).
prerequisite(spanish_3_advanced, [spanish_2]).
prerequisite(comp_sci_advanced,[none]).

prerequisite(geometry, [none]).
prerequisite(algebra_2, [geometry]).
prerequisite(chemistry, [biology]).
prerequisite(art_2, [art_1]).
prerequisite(chinese_3, [chinese_2]).
prerequisite(dance_iv, [dance_iii]).
prerequisite(english_ii, [english_i]).
prerequisite(english_i, [none]).
prerequisite(art_1, [none]).
prerequisite(biology, [none]).
prerequisite(public_speaking, [none]).
prerequisite(spanish_1, [none]).
prerequisite(spanish_2, [spanish_1]).
prerequisite(algebra_1, [none]).
prerequisite(journalism_yearbook_ii_iii, [journalism_yearbook_i]).
prerequisite(comp_sci,[none]).
prerequisite(soccer,[none]).
prerequisite(basketball,[none]).
prerequisite(baseball,[none]).


% Class Levels
c_level(geometry_advanced, medium, 10).
c_level(algebra_2_advanced, hard, 10).
c_level(chemistry_advanced, hard, 10).
c_level(art_2_advanced, medium, 10).
c_level(chinese_3_advanced, hard, 11).
c_level(dance_iv_advanced, medium, 11).
c_level(english_ii_advanced, medium, 10).
c_level(english_i_advanced, medium, 9).
c_level(biology_advanced, medium, 9).
c_level(french_3_advanced, hard, 11).
c_level(gt_humanities_i_english_i_advanced, hard, 9).
c_level(algebra_1_advanced, medium, 9).
c_level(advanced_public_speaking, medium, any).
c_level(spanish_3_advanced, medium, 11).
c_level(comp_sci_advanced,easy,any).

c_level(geometry, easy, 10).
c_level(algebra_2, easy, 10).
c_level(chemistry, east, 10).
c_level(art_2, east, 10).
c_level(chinese_3, medium, 11).
c_level(dance_iv, easy, any).
c_level(english_ii, easy, 10).
c_level(english_i, easy, 9).
c_level(art_1, easy, 9).
c_level(biology, easy, 9).
c_level(public_speaking, easy, any).
c_level(spanish_2, any, 10).
c_level(spanish_1, any, 9).
c_level(algebra_1, medium, 9).
c_level(journalism_yearbook_ii_iii, medium, 11).
c_level(comp_sci,easy,9).
c_level(soccer,any,any).
c_level(basketball,any,any).
c_level(baseball,any,any).


% Subjects
subject(geometry_advanced, math).
subject(algebra_2_advanced, math).
subject(chemistry_advanced, science).
subject(art_2_advanced, art).
subject(chinese_3_advanced, language).
subject(dance_iv_advanced, performing_arts).
subject(english_ii_advanced, english).
subject(english_i_advanced, english).
subject(biology_advanced, science).
subject(french_3_advanced, language).
subject(gt_humanities_i_english_i_advanced, english).
subject(algebra_1_advanced, math).
subject(advanced_public_speaking, communication).
subject(spanish_3_advanced, language).
subject(comp_sci_advanced,computer_science).

subject(geometry, math).
subject(algebra_2, math).
subject(chemistry, science).
subject(art_2, art).
subject(chinese_3, language).
subject(dance_iv, performing_arts).
subject(english_ii, english).
subject(english_i, english).
subject(art_1, art).
subject(biology, science).
subject(public_speaking, communication).
subject(spanish_2, language).
subject(spanish_1, language).
subject(algebra_1, math).
subject(journalism_yearbook_ii_iii, journalism).
subject(comp_sci,computer_science).
subject(soccer,athletic).
subject(baseball,athletic).
subject(basketball,athletic).


subject(ap_precalculus, math).
subject(ap_statistics, math).
subject(ap_computer_science_principles, computer_science).
subject(chinese_4_ap, language).
subject(ap_computer_science_a, computer_science).
subject(ap_english_language_and_composition, english).
subject(ap_english_literature_and_composition, english).
subject(french_4_ap, language).
subject(gt_american_studies_ap_english_language_and_composition, english).
subject(gt_humanities_ii_ap_world_history, social_studies).
subject(spanish_5_ap, language).
subject(ap_music_theory, music).
subject(ap_human_geography, social_studies).
subject(ap_world_history, social_studies).
subject(ap_us_history, social_studies).
subject(ap_european_history, social_studies).
subject(ap_government, social_studies).
subject(ap_macroeconomics, social_studies).
subject(ap_psychology_with_social_studies_research, social_studies).
subject(ap_seminar, interdisciplinary).
subject(ap_seminar_multicultural_section, interdisciplinary).
subject(ap_art_history, art).
subject(ap_calculus_bc, math).
subject(ap_calculus_ab, math).
subject(ap_studio_art_3d_design, art).
subject(ap_studio_art_2d_design, art).
subject(ap_studio_art_drawing, art).
subject(ap_physics_1, science).
subject(ap_biology, science).
subject(ap_physics_2, science).
subject(ap_environmental_science, science).
subject(ap_chemistry, science).
subject(ap_physics_c, science).
subject(spanish_4_ap, language).
subject(computer_science_3,computer_science).

credit(ap_precalculus, 1).
credit(ap_statistics, 1).
credit(ap_computer_science_principles, 1).
credit(chinese_4_ap, 1).
credit(ap_computer_science_a, 2).
credit(ap_english_language_and_composition, 1).
credit(ap_english_literature_and_composition, 1).
credit(french_4_ap, 1).
credit(gt_american_studies_ap_english_language_and_composition, 2).
credit(gt_humanities_ii_ap_world_history, 1).
credit(spanish_5_ap, 1).
credit(ap_music_theory, 1).
credit(ap_human_geography, 1).
credit(ap_world_history, 1).
credit(ap_us_history, 1).
credit(ap_european_history, 1).
credit(ap_government, 0.5).
credit(ap_macroeconomics, 0.5).
credit(ap_psychology_with_social_studies_research, 1).
credit(ap_seminar, 1).
credit(ap_seminar_multicultural_section, 1).
credit(ap_art_history, 1).
credit(ap_calculus_ab, 1).
credit(ap_calculus_bc, 1).
credit(ap_studio_art_3d_design, 1).
credit(ap_studio_art_2d_design, 1).
credit(ap_studio_art_drawing, 1).
credit(ap_physics_1, 1).
credit(ap_biology, 1).
credit(ap_physics_2, 1).
credit(ap_environmental_science, 1).
credit(ap_chemistry, 1).
credit(ap_physics_c, 2).
credit(spanish_4_ap, 1).
credit(computer_science_3,1).

prerequisite(ap_precalculus, [algebra_2]).
prerequisite(ap_statistics, [algebra_2]).
prerequisite(ap_computer_science_principles, [none]).
prerequisite(chinese_4_ap, [chinese_3]).
prerequisite(ap_computer_science_a, [none]).
prerequisite(ap_english_language_and_composition, [english_2]).
prerequisite(ap_english_literature_and_composition, [ap_english_language_and_composition]).
prerequisite(french_4_ap, [french_3]).
prerequisite(gt_american_studies_ap_english_language_and_composition, [none]).
prerequisite(gt_humanities_ii_ap_world_history, [none]).
prerequisite(spanish_5_ap, [spanish_4]).
prerequisite(ap_music_theory, [music_fundamentals]).
prerequisite(ap_human_geography, [none]).
prerequisite(ap_world_history, [none]).
prerequisite(ap_us_history, [none]).
prerequisite(ap_european_history, [none]).
prerequisite(ap_government, [none]).
prerequisite(ap_macroeconomics, [none]).
prerequisite(ap_psychology_with_social_studies_research, [none]).
prerequisite(ap_seminar, [none]).
prerequisite(ap_seminar_multicultural_section, [none]).
prerequisite(ap_art_history, [none]).
prerequisite(ap_calculus_bc, [precalculus]).
prerequisite(ap_calculus_ab, [precalculus]).
prerequisite(ap_studio_art_3d_design, [art_2]).
prerequisite(ap_studio_art_2d_design, [art_2]).
prerequisite(ap_studio_art_drawing, [art_2]).
prerequisite(ap_physics_1, [algebra_2]).
prerequisite(ap_biology, [biology]).
prerequisite(ap_physics_2, [ap_physics_1]).
prerequisite(ap_environmental_science, [biology, chemistry]).
prerequisite(ap_chemistry, [chemistry]).
prerequisite(ap_physics_c, [calculus_ab]).
prerequisite(spanish_4_ap, [spanish_3]).
prerequisite(computer_science_3,[ap_computer_science_a]).






c_level(ap_precalculus, medium, 11).
c_level(ap_statistics, medium, 12).
c_level(ap_computer_science_principles, easy, any).
c_level(chinese_4_ap, hard, 12).
c_level(ap_computer_science_a, medium, any).
c_level(ap_english_language_and_composition, medium, 11).
c_level(ap_english_literature_and_composition, hard, 12).
c_level(french_4_ap, hard, 12).
c_level(gt_american_studies_ap_english_language_and_composition, hard, 11).
c_level(gt_humanities_ii_ap_world_history, hard, 10).
c_level(spanish_5_ap, hard, 12).
c_level(ap_music_theory, hard, 11).
c_level(ap_human_geography, medium, 9).
c_level(ap_world_history, medium, 10).
c_level(ap_us_history, medium, 11).
c_level(ap_european_history, hard, 12).
c_level(ap_government, medium, 12).
c_level(ap_macroeconomics, medium, 12).
c_level(ap_psychology_with_social_studies_research, medium, 11).
c_level(ap_seminar, medium, 10).
c_level(ap_seminar_multicultural_section, medium, 10).
c_level(ap_art_history, medium, 11).
c_level(ap_calculus_bc, hard, 12).
c_level(ap_calculus_ab, hard, 11).
c_level(ap_studio_art_3d_design, medium, 11).
c_level(ap_studio_art_2d_design, medium, 11).
c_level(ap_studio_art_drawing, medium, 11).
c_level(ap_physics_1, hard, 11).
c_level(ap_biology, hard, 11).
c_level(ap_physics_2, hard, 12).
c_level(ap_environmental_science, medium, 11).
c_level(ap_chemistry, veryhard, 11).
c_level(ap_physics_c, hard, 12).
c_level(spanish_4_ap, hard, 12).
c_level(computer_science_3,hard,any).

member(H,[H|T]).
member(X,[H|T]):- member(X,T).

subset([],L).
subset([H|T],L2):-member(H,L2),subset(T,L2).

delete(H,[H|T],T).
delete(X,[H|T],[H|R]):-delete(X,T,R).

%c_level(Class,veryhard):- member(Class,[ap_physics,ap_calculus,ap_chemistry,ap_statistics]).
%c_level(Class,hard):-s_level(Class,X),X=ap, \+ c_level(Class,veryhard).
%c_level(Class,medium):-s_level(Class,X),X=advanced.
%c_level(Class,easy):- s_level(Class,X), X = onlevel.

matches(X,X).
%matches([_|G1],[_|G2]):-G2>G1.
matches(_,[any|_]).
matches([L|_],[L|any]).
matches([medium,9],[easy,10]).
matches([medium,10],[easy,11]).
matches([medium,11],[easy,12]).
matches([medium,12],[hard,12]).
matches([X,X3],[X2|X4]).
matches([hard|9],[medium|10]).
matches([hard,10],[medium,11]).
matches([hard,11],[medium,12]).
matches([veryhard,11],[hard,12]).
matches([veryhard|11],[hard|12]).
matches([hard,12],[veryhard,12]).


matches([hard,9],[easy,11]).
matches([hard,10],[easy,12]).

matches([veryhard,9],[hard,12]).

%if subject is his passion
recommend(X,S,R,Prereqs):- plevel(X,S,Level),grade(X,G),passion(X,P), S=P, ahead(Level,TrueLevel),
        c_level(R,ClassLevel,GradeTaken), matches([TrueLevel|G],[ClassLevel|GradeTaken]), subject(R,S), 
        prerequisite(R,Prereqs),courses(X,CoursesT),courses_not(X,CoursesNot),append(CoursesT,CoursesNot,AvoidCourses),\+member(R,AvoidCourses).
%if subject is not his passion or if he is already at the highest level
recommend(X,S,R,Prereqs):- plevel(X,S,TrueLevel),grade(X,G),
        c_level(R,ClassLevel,GradeTaken), matches([TrueLevel|G],[ClassLevel|GradeTaken]), subject(R,S), 
        prerequisite(R,Prereqs),courses(X,CoursesT),courses_not(X,CoursesNot),append(CoursesT,CoursesNot,AvoidCourses),\+member(R,AvoidCourses).
next_recommend(X,S,R,Prereqs):-plevel(X,S,LevelNotFound),grade(X,G),ahead(LevelNotFound,AheadLevel),c_level(R,ClassLevel,GradeTaken), matches([AheadLevel|G],[ClassLevel|GradeTaken]), subject(R,S), 
        prerequisite(R,Prereqs),courses(X,CoursesT),courses_not(X,CoursesNot),append(CoursesT,CoursesNot,AvoidCourses),\+member(R,AvoidCourses).
below_recommend(X,S,R,Prereqs):-plevel(X,S,LevelNotFound),grade(X,G),behind(LevelNotFound,BelowLevel),c_level(R,ClassLevel,GradeTaken), matches([BelowLevel|G],[ClassLevel|GradeTaken]), subject(R,S), 
        prerequisite(R,Prereqs),courses(X,CoursesT),courses_not(X,CoursesNot),append(CoursesT,CoursesNot,AvoidCourses),\+member(R,AvoidCourses).
simple_recommend(X,S,R,Prereqs):-grade(X,G),c_level(R,_,G),subject(R,S), 
        prerequisite(R,Prereqs),courses(X,CoursesT),courses_not(X,CoursesNot),append(CoursesT,CoursesNot,AvoidCourses),\+member(R,AvoidCourses).
simple_recommend(X,S,R,Prereqs):-c_level(R,_,any),subject(R,S), 
        prerequisite(R,Prereqs),courses(X,CoursesT),courses_not(X,CoursesNot),append(CoursesT,CoursesNot,AvoidCourses),\+member(R,AvoidCourses).
eq(X,X).

empty([]).

%give_recs(X,AllSubjects,[Result|Credits]):-courses(X,Prereqs),\+eq(Prereqs,[]),courses_wanted(X,CW),give_recs(X,AllSubjects,Partial,Result,0,Credits,CW,Prereqs).
give_recs(X,AllSubjects,[Result,Credits],Prereqs):-courses_wanted(X,CW),give_recs(X,AllSubjects,Partial,Result,0,Credits,CW,[],Prereqs).


give_recs(X,AllSubjects,Partial,Result,N,Credits,CW,Pre_Partial,Prereqs):- \+empty(AllSubjects),delete(R,CW,CW2),prerequisite(R,Pq),subject(R,Subject), delete(Subject,AllSubjects,NewSubjects),credit(R,Cr),C is N+Cr,give_recs(X,NewSubjects,[R|Partial],Result,C,Credits,CW2,[Pq|Pre_Partial],Prereqs).

give_recs(X,[Subject|Subjects],Partial,Result,N,Credits,[],Pre_Partial,Pqs):-recommend(X,Subject,R,Pq), has_taken(X,Pq),credit(R,Cr),C is N+Cr,give_recs(X,Subjects,[R|Partial],Result,C,Credits,[],[Pq|Pre_Partial],Pqs).
give_recs(X,[Subject|Subjects],Partial,Result,N,Credits,[],Pre_Partial,Pqs):-next_recommend(X,Subject,R,Pq), has_taken(X,Pq),credit(R,Cr),C is N+Cr,give_recs(X,Subjects,[R|Partial],Result,C,Credits,[],[Pq|Pre_Partial],Pqs).
give_recs(X,[Subject|Subjects],Partial,Result,N,Credits,[],Pre_Partial,Pqs):-below_recommend(X,Subject,R,Pq), has_taken(X,Pq),credit(R,Cr),C is N+Cr,give_recs(X,Subjects,[R|Partial],Result,C,Credits,[],[Pq|Pre_Partial],Pqs).
give_recs(X,[Subject|Subjects],Partial,Result,N,Credits,[],Pre_Partial,Pqs):-simple_recommend(X,Subject,R,Pq),has_taken(X,Pq),credit(R,Cr),C is N+Cr,give_recs(X,Subjects,[R|Partial],Result,C,Credits,[],[Pq|Pre_Partial],Pqs).
give_recs(X,[],Result,Result,Credits,Credits,[],Pqs,Pqs):-credits_wanted(X,Credits).
give_recs(X,[],Result,Result,Credits,Credits,[],Pqs,Pqs):-credits_wanted(X,any).

has_taken(X,CoursesNeeded):-courses(X,[]).
has_taken(X,CoursesNeeded):-
    courses(X,C),has_all(CoursesNeeded,C).

has_all([],Courses).
has_all([C|Cs],Courses):-member(C,Courses),has_all(Cs,Courses).

%unique([],L).
%unique([H|T],[H|L]):- \+member(H,L),unique(T,L).
%unique([H|T],List):- member(H,List),unique(T,List).


ahead(veryeasy,easy).
ahead(veryeasy,medium).
ahead(easy,medium).
ahead(medium,hard).
ahead(hard,veryhard).
ahead(veryhard,veryhard).
behind(medium,easy).
behind(hard,medium).
behind(veryhard,hard).
behind(easy,veryeasy).