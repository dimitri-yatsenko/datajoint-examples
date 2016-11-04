%{
ex1.SetDataPoint (imported) # Collected data.
-> ex1.Set
datapoint       : int                    # 
---
x                           : float                         # 
y                           : float                         # 
%}


classdef SetDataPoint < dj.Relvar
	methods

		function makeTuples(self, key)
		%!!! compute missing fields for key here
			self.insert(key)
		end
	end

end