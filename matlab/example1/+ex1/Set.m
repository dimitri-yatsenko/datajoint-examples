%{
ex1.Set (imported) # A set of datapoints
-> ex1.Experiment
---
%}


classdef Set < dj.Relvar & dj.AutoPopulate

	properties
		popRel = ex1.Experiment  % !!! update the populate relation
	end

	methods(Access=protected)

		function makeTuples(self, key)
            n = 10;
            mu = 0;
            sigma = .1;
            
			self.insert(key);
            
            for i=1:n
                tup = key;
                tup.datapoint = i;
                tup.x = i + normrnd(mu, sigma);
                tup.y = 2*i + normrnd(mu, sigma);
                insert(ex1.SetDataPoint(),tup);
            end
            
		end
	end

end