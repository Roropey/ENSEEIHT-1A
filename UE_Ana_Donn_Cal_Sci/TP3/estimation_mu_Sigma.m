function [mu,sigma] = estimation_mu_Sigma(images)
mu = mean(images)';
images_centrees = images - mu';
sigma = images_centrees'*images_centrees./length(images_centrees);
end