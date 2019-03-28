\name{pDetect}
\alias{pDetect}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate the probability of detecting an MME.
}
\description{
Calculates the aggregate probability of detecting an MME, assuming a particular detection function and sampling regime.
}
\usage{
pDetect(lambda, n, mod='Exp')
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lambda}{
For the exponential detection model, lambda is decay rate in detectability. For the Laplace model, lambda is both the increase rate up to peak detectability, and the decay rate thereafter.
}
\item{n}{
The total number of regularly spaced observations, starting at t=0 and ending at t=1.
}
\item{mod}{
The detectability model.
}
}
\details{
The growth/decay rate, lambda, must be >0.

The total number of observations, n, must be at least 2, which includes t=0 and t=1. For n > 2, observations will be equally spaced within the "season". For example, n=3 would have observations at t=0, t=1/2 and t=1, while n=4 would feature observations at t=0, t=1/3, t=2/3 and t=1. The spacing between observations is given by 1/(n-1).

Allowable values for mod include 'Exp' for the exponential model, and 'Lpl' for the Laplace model.
}

\value{
  The aggregate probability of detecting an MME, given that one has occurred.
}
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
%}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
Justin M. Calabrese
}
