#un-normalized Laplace prob density function.
#mu is the location parameter (mean).
#lambda is the exponential growth/decay rate
#not exported to the namespace.
dlpl <- function(x, mu, lambda) exp(-abs(x-mu)*lambda)


#general numerical solution for probability of MME detection.
#lambda is detectability decay (and growth, for Lpl model) rate and must be >0.
#n is the number of samples taken during the season.
#n should be an integer >=2.
#exported to namespace.
pDetect <- function(lambda, n, mod='Exp'){

  #check parameter values and warn appropriately.
  if(n != round(n)) warning("n must be an integer")
  if(n < 2) warning("n must be >=2")
  if(lambda <= 0) warning("lambda must be >0")

  n <- n - 1

  #build the integrand based on the parameters.
  integrand <- function(lambda, n, mod){
    function(x){
      int <- dunif(x)
      if(mod=='Exp'){
          for(i in 0:n) int <- int * (1 - (1/lambda)*dexp((i/n)-x, lambda))
      } else if(mod=='Lpl'){
          for(i in 0:n) int <- int * (1 - dlpl(x, i/n, lambda))
      } else{
          warning("mod must be either 'Exp' or 'Lpl'")
      }
      return(int)
    }
  }

  #evaluate the numerical integral and return prob of dectection.
  return(1 - integrate(integrand(lambda, n, mod), lower=0, upper=1, subdivisions = 1000L)$value)
}


#calculates the optimal number of samples to acheive a target detection probability.
#nMax is the user-specified maximum possible sampling effort.
#nMax must be >= 2.
#pTar is the user-specified target detection probability.
#pTar must be >=0 and <= 1.
#exported to namespace.
sampleMME <- function(lambda, nMax, pTar, mod='Exp'){

  #check pTar and warn appropriately if out of bounds.
  if(pTar <0 | pTar >1) warning("pTar must be between 0 and 1.")

  #create empty vectors to store results.
  obj <- NULL
  pds <- NULL

  #loop over possible values of n.
  for(n in 2:nMax){

    #get the probability of detection given the current value of n.
    pd <- pDetect(lambda, n, mod)

    #calculate and store the absolute deviation between the current prob of detection and pTar.
    obj[n-1] <- abs(pd - pTar)

    #store the current prob of detection
    pds[n-1] <- pd

  }

  #find the value of n that returns the lowest absolute deviation from pTar
  optN <- which(obj == min(obj))

  #return nOpt and the corresponding value of probability of detection
  return(data.frame(nOpt=optN+1, pDet=pds[optN]))

}
