\name{sampleMME}
\alias{sampleMME}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Determine the optimal number of surveys to acheive a specified probability of MME detection.
}
\description{
Given a detectability model, rate parameter, maximum possible sampling effort, and target probability of dection, this function determines the value of n that comes closest to acheiving the user-specified target detection probability.
}
\usage{
sampleMME(lambda, nMax, pTar, mod='Exp')
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{lambda}{
For the exponential detection model, lambda is decay rate in detectability. For the Laplace model, lambda is both the increase rate up to peak detectability, and the decay rate thereafter.
}
\item{nMax}{
The maximum possible number of regularly spaced surveys that could be conducted.
}
\item{pTar}{
The target detection probability the user wishes to acheive.
}
\item{mod}{
The detectability model.
}

}
\details{
The growth/decay rate, lambda, must be >0.

nMax represents the maximum possible sampling effort and must be user determined, for example based on logistical considerations. This number must be >= 2, and can be large, but must be finite. For more information about how sampling schedules are determined from n, the total number of observations, see the help file for pDetect().

The user must also specify the target probability of MME detection that they wish to acheive, pTar, where 0 <= pTar <= 1.

Allowable values for mod include 'Exp' for the exponential model, and 'Lpl' for the Laplace model.
}

\value{
%%  ~Describe the value returned
A dataframe
  \item{nOpt }{the number of regularly spaced observations that comes closest to acheiving pTar.}
  \item{pDet }{The realized probability of MME detection for nOpt surveys}
%% ...
%}
%\references{
%% ~put references to the literature/web site here ~
%}
\author{
Justin M. Calabrese
}
