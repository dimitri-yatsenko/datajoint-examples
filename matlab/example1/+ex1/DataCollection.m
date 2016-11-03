%{
ex1.DataCollection (manual) # A way to group datasets per experiment
-> ex1.Experiment
datacollection_id : int     # Unique identifier for the dataset.
-----

%}

classdef DataCollection < dj.Relvar
end