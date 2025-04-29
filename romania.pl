% --- Grammar rules ---

s  --> np, vp.
np --> det, n.
np --> pr.
vp --> v, np.
vp --> tv, np.
det  --> [o].
det  --> [un].
det  --> [].
n   --> [copil], sum.
n   --> [baiat], sum.
n   --> [caine], sun.
n   --> [fata], suf.
n   --> [carte], suf.
pr  --> [eu].
pr  --> [tu].
pr  --> [el].
pr  --> [ea].
v   --> [este].
v   --> [esti].
v   --> [sunt].
tv  --> [iubeste].
tv  --> [cititi].
tv  --> [citesc].
sum --> [ul].
sum --> [].
sun --> [le].
sun --> [].
suf --> [a].
suf --> [].

% --- Test framework ---

% succeeds if parsing succeeds
test_true(Sentence) :-
    phrase(s, Sentence),
    format("✅ Success (expected true): ~w~n", [Sentence]).

% succeeds if parsing fails
test_false(Sentence) :-
    \+ phrase(s, Sentence),
    format("✅ Success (expected false): ~w~n", [Sentence]).

run_tests :-
    % Expected to succeed
    test_true([tu, esti, un, baiat]),
    test_true([eu, sunt, un, baiat]),
    test_true([copil, ul, iubeste, caine, le]),
    test_true([ea, este, o, fata]),
    test_true([tu, cititi, fata, a]),
    test_true([un, caine, este, un, baiat]),
    test_true([eu, citesc, ea]),
    % Expected to fail
    test_false([un, baiat]),                          % incomplete, no verb phrase
    test_false([]),                                   % empty string
    test_false([ea, carte, sunt]),                    % 'she book am', NP does not allow pronoun-noun
    test_false([sunt, un, caine]),                    % 'am a dog', no noun phrase to begin
    test_false([un, iubeste, o, carte]),              % 'a loves a book', no noun to accompany article
    test_false([un, sunt]),                           % 'a am', no noun to accompany article
    test_false([o, fata, ea, este, o, fata]).         % 'a girl she is a girl', NP does not allow article + noun and pronoun