%{
ex1.RawData (manual)    # Raw collected data.
-> ex1.DataCollection
data_id : int           # A unique data instance id.
-----
x : float
y : float
%}

classdef RawData < dj.Relvar
end