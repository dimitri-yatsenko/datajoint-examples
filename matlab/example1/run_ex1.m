% del(ex1.Experiment)


insert(ex1.Experiment, {1})
insert(ex1.DataCollection, {1,1})


n_data = 10;
X = rand(n_data,1);
Y = zeros(n_data,1);
mu = 0;
sigma = .1;


for i=1:n_data
    Y(i) = 2 * X(i) + normrnd(mu, sigma);
   insert(ex1.RawData,{1,1,i, X(i),Y(i)})

end
insert(ex1.DataCollection, {1,2})


n_data = 100;
X = rand(n_data,1);
Y = zeros(n_data,1);
mu = 0;
sigma = .1;
for i=1:n_data
    Y(i) = 2 * X(i) + normrnd(mu, sigma);
   insert(ex1.RawData,{1,2,i, X(i),Y(i)})

end


% populate(ex1.LinearModel);
% populate(ex1.MSE);
% populate(ex1.R2);
% 
% 
% results = fetch(ex1.R2,'*');
% results(1)
% results(2)
