%{
ex1.R2 (computed)   # Computes the R^2 for a Model.
-> ex1.LinearModel
-----
val : float         # The R2 Value.
%}

classdef R2 < dj.Relvar & dj.AutoPopulate

	properties
		popRel = ex1.LinearModel 
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
            
            model = fetch(ex1.LinearModel & key, '*');
       
            yCalc = X*model.m + model.b;
            val  = 1-sum((Y - yCalc).^2)/sum((Y - mean(Y)).^2);

            tup = key;
            tup.val = val;
 			self.insert(tup)		;	
		end
	end

end