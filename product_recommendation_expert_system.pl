/*
==================================================
        PRODUCT RECOMMENDATION EXPERT SYSTEM
                (SWI-PROLOG VERSION)
==================================================
*/

% ---------- Knowledge Base: product(Category, Brand, Price, Rating, Features) ----------

product(laptop, hp, 55000, 4.3, [i5, gb16, ssd, windows]).
product(laptop, dell, 60000, 4.6, [i5, gb16, ssd, windows]).
product(laptop, lenovo, 48000, 4.2, [i3, gb8, ssd, windows]).
product(phone, samsung, 18000, 4.4, [android, g5, mp64]).
product(phone, oneplus, 32000, 4.7, [android, g5, hz120]).
product(phone, realme, 16000, 4.3, [android, g5, mp50]).
product(tv, sony, 48000, 4.5, [smart, led, i43inch]).
product(tv, lg, 42000, 4.4, [smart, led, i40inch]).
product(headphone, boat, 2500, 4.2, [wireless, bluetooth]).
product(headphone, sony, 6500, 4.8, [wireless, noisecancel]).


% ---------- Recommendation Rule ----------
recommend(Category, Budget, Feature, Brand) :-
    product(Category, Brand, Price, Rating, Features),
    Price =< Budget,
    Rating >= 4.0,
    member(Feature, Features).


% ---------- Display Helper ----------
show_recommendations(Category, Budget, Feature) :-
    format('Recommendations for ~w under Rs.~w with ~w feature:\n', [Category, Budget, Feature]),
    recommend(Category, Budget, Feature, Brand),
    format('- ~w\n', [Brand]),
    fail.
show_recommendations(_, _, _) :- true.


% ---------- Usage Examples ----------
% Example 1: Phones under 20000 with 5G
% ?- show_recommendations(phone, 20000, g5).

% Example 2: Laptops under 60000 with SSD
% ?- show_recommendations(laptop, 60000, ssd).

% Example 3: Headphones under 7000 with wireless
% ?- show_recommendations(headphone, 7000, wireless).
