%{
ex1.LinearModel (computed) # fits line a DataCollection. y=mx+b form
-> ex1.DataCollection

-----
m : float     # Slope
b : float     # intercept

%}

classdef LinearModel < dj.Relvar & dj.AutoPopulate

	properties
		popRel = ex1.DataCollection 
	end

	methods(Access=protected)

		function makeTuples(self, key)
           
            data = fetch(ex1.RawData & key, '*');
            X = zeros(size(data,1),1);
            Y = zeros(size(data,1),1);
            for i=1:size(data)
                X(i) = data(i).x;
                Y(i) = data(i).y;
            end
            
            X = [X ones(length(X),1)];
      
            r = X\Y;
            
            tup = key;
            tup.m = r(1);
            tup.b = r(2);
 			self.insert(tup)
		end
	end

end