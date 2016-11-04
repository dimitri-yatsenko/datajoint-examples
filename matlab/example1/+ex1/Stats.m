%{
ex1.Stats (computed) # Computes Mean Square Error and R2 for a particular Model
-> ex1.LinearModel
---
mse                         : float                         # The MSE value.
r2                          : float                         # R-squared of linear fit
%}


classdef Stats < dj.Relvar & dj.AutoPopulate

	properties
		popRel = ex1.LinearModel  % !!! update the populate relation
	end

	methods(Access=protected)

		function makeTuples(self, key)
            [X, Y] = fetchn(ex1.SetDataPoint & key, 'x','y');
            [m, b] = fetchn(ex1.LinearModel & key, 'm','b');
            yCalc = X*m + b;
            
            key.mse =  sum((Y - yCalc).^2)/size(Y,1);
            key.r2 = 1-sum((Y - yCalc).^2)/sum((Y - mean(Y)).^2);

			self.insert(key)
		end
	end

end