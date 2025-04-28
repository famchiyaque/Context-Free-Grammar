% --- Grammar rules ---

s --> np, vp.
np --> det, n.
np --> pr.
vp --> v.
vp --> tv, np.
det --> [o].
det --> [un].
det --> [].
n --> [copil], sum.
n --> [baiat], sum.
n --> [caine], sun.
n --> [femeie], suf.
n --> [carte], suf.
pr --> [eu].
pr --> [tu].
pr --> [el].
pr --> [ea].
v --> [este].
v --> [esti].
v --> [sunt].
tv --> [iubeste].
tv --> [cititi].
tv --> [citesc].
sum --> [ul].
sum --> [].
sun --> [le].
sun --> [].
suf --> [a].
suf --> [].

% --- Test framework ---

% succeeds if parsing succeeds
test(Sentence) :-
    phrase(s, Sentence),
    format("✅ Success (expected true): ~w~n", [Sentence]).

run_tests :-
    format("Sentences that should pass: ").
    test([o, copil, este]),
    test([un, baiat, sunt]),
    test([eu, esti]),
    test([un, copil, ul, este]),
    test([o, fata, a, este]),   
    test([carte, este]),
    format("Sentences that should fail").
    test([copil, sunt]),
    test([ul, copil, sunt]),
    test([ea, carte, sunt]),
    test([baiat, este]),
    test([esti, copil]).

# % Optional: entry point
# :- initialization(run_tests, main).