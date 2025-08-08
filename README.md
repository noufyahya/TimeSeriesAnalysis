# Time Series Analysis
### about the data 
Airpassengers is a data that comes with R, it contains the amount of passengers in an airline from 1949 till 1960, the data is orgnized in a monthly manner, it's also stored as 'ts' inside R files, the data is good for time series analysis.

### When ploting the data 
When you plot the data in the EDA, you will see an upward trend, which means the airline had more passengers over time.

<img width="400" height="400" alt="Image" src="https://github.com/user-attachments/assets/c5d513d4-5604-4e0f-87e0-3e85c6784881" />

### Decompsing the data 
The reason we decompose the data is to understand the underlying patterns of the data. Decomposing the original data into its components might explain why the data is like this. Is there anything that you need to understand about it? The data will help you answer business questions, such as when sales are at their highest and why. It will also show you the trend it's following—whether upward or downward—in case it wasn’t clear.



AirPassengers has increasing variance over time, multiplicative decomposition usually fits better, but we will verify this by comparing the two "additive" and "multiplicative"

<img width="500" height="500" alt="Image" src="https://github.com/user-attachments/assets/28a7e2bc-6472-4867-907d-eda9e90b66d2" />
<img width="500" height="500" alt="Image" src="https://github.com/user-attachments/assets/abd5279f-29d8-4313-b9a6-17361b47f94c" />

__Then which one is it? \
It's a multiplicative.\
How did we know ?\
We check the residuals__.


_First check_ : ACF
In the better model residuals should have no significant autocorrelation which means that all lags should be within blue dashed lines.
\
<img width="800" height="800" alt="Image" src="https://github.com/user-attachments/assets/8d7c4df3-3ced-46e3-b62d-4c6f7498245c" />

_Another way is_ : 'Comparing Seasonal Components'
- Additive (Blue): Fixed ± passenger counts
- Multiplicative (Red): Proportional scaling
  
<img width="800" height="800" alt="Image" src="https://github.com/user-attachments/assets/ed8c283b-8b7a-4601-9230-316523f2ee76" />

_The final check is_ the variance check, where lower variance → Better model. Multiplicative wins for AirPassengers.\
`Additive residuals variance: 374.0563`\
`Multiplicative residuals variance: 0.001114785`



