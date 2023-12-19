# Flow Traders Hackathon 2023 

Aim: Create a trading strategy and maximise its profitability. 
Imagine you are a merchant of tulips in the 15th century. 
What is the optimal portofolio allocation at each time step?

Rules:
1) Input: hourly returns (for 12 assets, tulips in this case) and some covariates (see Data folder).
2) Output: Portfolio weights (𝒘𝑡) for each hour.
Note: The portfolio can be long and short in each tulip, with a constraint on margin:
𝒘𝑡 is an array of length 13 normalized in absolute value, i.e. 

sum( abs( 𝒘𝑡 ) ) = 1

where the last element of the array is the percentage of the portfolio allocated in cash.


Evaluation metric: 
Profitability is measured by the Annualized Sharpe Ratio, adjusted for trading costs (see Rules).

------------------------------------------------------------------------------------------------------------------------------------------------

In a nutshell:
1) Predict asset returns at time t+1 
2) Find the portfolio weights that maximise the Sharpe ratio

------------------------------------------------------------------------------------------------------------------------------------------------

# Our solution

The optimization process involves solving a quadratic programming (QP) subproblem at every iteration, as part of the code for optimization. Due to the high computational requirements of the optimization problem, we utilize block optimization techniques. We have not taken into account any data features, as we have determined that the linear correlation between the features and returns data is insignificant. Therefore, we solely use the returns data. We have additionally examined the autocorrelation of the returns series, and found no significant pattern using diagnostic plots such as PACF and ACF.
