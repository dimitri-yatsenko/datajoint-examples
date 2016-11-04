%{
ex1.LinearModel (computed) # fits line a DataCollection. y=mx+b form
-> ex1.Set

-----
m : float     # Slope
b : float     # intercept

%}

classdef LinearModel < dj.Relvar & dj.AutoPopulate

	properties
		popRel = ex1.Set 
	end

	methods(Access=protected)

		function makeTuples(self, key)        
            [X, Y] = fetchn(ex1.SetDataPoint & key, 'x','y');
            X = [X ones(length(X),1)];
      
            r = X\Y;
            
            tup = key;
            tup.m = r(1);
            tup.b = r(2);
 			self.insert(tup)
		end
	end

end