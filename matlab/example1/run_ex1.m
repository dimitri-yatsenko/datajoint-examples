del(ex1.Experiment)


insert(ex1.Experiment, [{1},
    {2},
    {3}])


populate(ex1.Set);
populate(ex1.LinearModel);
populate(ex1.Stats);

results = fetch(ex1.Stats,'*')
% results(1)
% results(2)
