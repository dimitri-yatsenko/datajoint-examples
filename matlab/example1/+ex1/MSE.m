%{
ex1.MSE (computed) # Computes Mean Square Error for a particular Model
-> ex1.LinearModel
-----
val : float         # The MSE value.
%}

classdef MSE < dj.Relvar & dj.AutoPopulate

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
            val  = sum((Y - yCalc).^2)/size(data,1);

            tup = key;
            tup.val = val;
 			self.insert(tup)		;	
		end
	end

end