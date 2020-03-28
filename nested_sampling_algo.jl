## Computing marginal posterior probability density
## More on defining prior_vector, iterations, likelihood_vector to be included
likelihood = []
X = []
w = []
Z = []
function marginal_pd(N, prior_vector, iterations, likelihood_vector_current)
    for i in 1:1:iterations
        likelihood[i] = minimum(likelihood_vector_current) ## re-check this step
        X[i] = exp(-i/N)
        w[i] = X[i - 1] - X[i]
        Z = Z + likelihood[i]*w[i]
        ## save point with least likelihood as sample point with weight wi.
        ## update point with least likelihood with some MCMC steps according to prior,
        ## accepting only steps that keep the likelihood about Li
        end
    end
    return Z
end
