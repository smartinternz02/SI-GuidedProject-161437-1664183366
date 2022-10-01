{
 "cells": [
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 2.LOAD THE DATASET"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "metadata": {},
   "outputs": [],
   "source": [
    "import pandas as pd"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "metadata": {},
   "outputs": [],
   "source": [
    "data=pd.read_csv('Churn_Modelling.csv')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>RowNumber</th>\n",
       "      <th>CustomerId</th>\n",
       "      <th>Surname</th>\n",
       "      <th>CreditScore</th>\n",
       "      <th>Geography</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Tenure</th>\n",
       "      <th>Balance</th>\n",
       "      <th>NumOfProducts</th>\n",
       "      <th>HasCrCard</th>\n",
       "      <th>IsActiveMember</th>\n",
       "      <th>EstimatedSalary</th>\n",
       "      <th>Exited</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>15634602</td>\n",
       "      <td>Hargrave</td>\n",
       "      <td>619</td>\n",
       "      <td>France</td>\n",
       "      <td>Female</td>\n",
       "      <td>42</td>\n",
       "      <td>2</td>\n",
       "      <td>0.00</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>101348.88</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>15647311</td>\n",
       "      <td>Hill</td>\n",
       "      <td>608</td>\n",
       "      <td>Spain</td>\n",
       "      <td>Female</td>\n",
       "      <td>41</td>\n",
       "      <td>1</td>\n",
       "      <td>83807.86</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>112542.58</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>15619304</td>\n",
       "      <td>Onio</td>\n",
       "      <td>502</td>\n",
       "      <td>France</td>\n",
       "      <td>Female</td>\n",
       "      <td>42</td>\n",
       "      <td>8</td>\n",
       "      <td>159660.80</td>\n",
       "      <td>3</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>113931.57</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>15701354</td>\n",
       "      <td>Boni</td>\n",
       "      <td>699</td>\n",
       "      <td>France</td>\n",
       "      <td>Female</td>\n",
       "      <td>39</td>\n",
       "      <td>1</td>\n",
       "      <td>0.00</td>\n",
       "      <td>2</td>\n",
       "      <td>0</td>\n",
       "      <td>0</td>\n",
       "      <td>93826.63</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>15737888</td>\n",
       "      <td>Mitchell</td>\n",
       "      <td>850</td>\n",
       "      <td>Spain</td>\n",
       "      <td>Female</td>\n",
       "      <td>43</td>\n",
       "      <td>2</td>\n",
       "      <td>125510.82</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>79084.10</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   RowNumber  CustomerId   Surname  CreditScore Geography  Gender  Age  \\\n",
       "0          1    15634602  Hargrave          619    France  Female   42   \n",
       "1          2    15647311      Hill          608     Spain  Female   41   \n",
       "2          3    15619304      Onio          502    France  Female   42   \n",
       "3          4    15701354      Boni          699    France  Female   39   \n",
       "4          5    15737888  Mitchell          850     Spain  Female   43   \n",
       "\n",
       "   Tenure    Balance  NumOfProducts  HasCrCard  IsActiveMember  \\\n",
       "0       2       0.00              1          1               1   \n",
       "1       1   83807.86              1          0               1   \n",
       "2       8  159660.80              3          1               0   \n",
       "3       1       0.00              2          0               0   \n",
       "4       2  125510.82              1          1               1   \n",
       "\n",
       "   EstimatedSalary  Exited  \n",
       "0        101348.88       1  \n",
       "1        112542.58       0  \n",
       "2        113931.57       1  \n",
       "3         93826.63       0  \n",
       "4         79084.10       0  "
      ]
     },
     "execution_count": 3,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data.head()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 3.Perform Below visualizations"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "##Univariate Analysis"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "import matplotlib.pyplot as plt\n",
    "import seaborn as sns"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "plt.scatter(data.index,data['CustomerId'])\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "sns.scatterplot(x=data.index,y=data['CustomerId'],hue=data['Age'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "plt.hist(data['CreditScore'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "plt.boxplot(data['CustomerId'])"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "##BiVariate Analysis"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "plt.boxplot(data['CustomerId'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "data.corr()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "##MultiVariate Analysis "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "sns.pairplot(data)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 4.Perform Descriptive statistics on the dataset "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>RowNumber</th>\n",
       "      <th>CustomerId</th>\n",
       "      <th>CreditScore</th>\n",
       "      <th>Age</th>\n",
       "      <th>Tenure</th>\n",
       "      <th>Balance</th>\n",
       "      <th>NumOfProducts</th>\n",
       "      <th>HasCrCard</th>\n",
       "      <th>IsActiveMember</th>\n",
       "      <th>EstimatedSalary</th>\n",
       "      <th>Exited</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>count</th>\n",
       "      <td>10000.00000</td>\n",
       "      <td>1.000000e+04</td>\n",
       "      <td>10000.000000</td>\n",
       "      <td>10000.000000</td>\n",
       "      <td>10000.000000</td>\n",
       "      <td>10000.000000</td>\n",
       "      <td>10000.000000</td>\n",
       "      <td>10000.00000</td>\n",
       "      <td>10000.000000</td>\n",
       "      <td>10000.000000</td>\n",
       "      <td>10000.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>mean</th>\n",
       "      <td>5000.50000</td>\n",
       "      <td>1.569094e+07</td>\n",
       "      <td>650.528800</td>\n",
       "      <td>38.921800</td>\n",
       "      <td>5.012800</td>\n",
       "      <td>76485.889288</td>\n",
       "      <td>1.530200</td>\n",
       "      <td>0.70550</td>\n",
       "      <td>0.515100</td>\n",
       "      <td>100090.239881</td>\n",
       "      <td>0.203700</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>std</th>\n",
       "      <td>2886.89568</td>\n",
       "      <td>7.193619e+04</td>\n",
       "      <td>96.653299</td>\n",
       "      <td>10.487806</td>\n",
       "      <td>2.892174</td>\n",
       "      <td>62397.405202</td>\n",
       "      <td>0.581654</td>\n",
       "      <td>0.45584</td>\n",
       "      <td>0.499797</td>\n",
       "      <td>57510.492818</td>\n",
       "      <td>0.402769</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>min</th>\n",
       "      <td>1.00000</td>\n",
       "      <td>1.556570e+07</td>\n",
       "      <td>350.000000</td>\n",
       "      <td>18.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>0.00000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>11.580000</td>\n",
       "      <td>0.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>25%</th>\n",
       "      <td>2500.75000</td>\n",
       "      <td>1.562853e+07</td>\n",
       "      <td>584.000000</td>\n",
       "      <td>32.000000</td>\n",
       "      <td>3.000000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>0.00000</td>\n",
       "      <td>0.000000</td>\n",
       "      <td>51002.110000</td>\n",
       "      <td>0.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>50%</th>\n",
       "      <td>5000.50000</td>\n",
       "      <td>1.569074e+07</td>\n",
       "      <td>652.000000</td>\n",
       "      <td>37.000000</td>\n",
       "      <td>5.000000</td>\n",
       "      <td>97198.540000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>1.00000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>100193.915000</td>\n",
       "      <td>0.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>75%</th>\n",
       "      <td>7500.25000</td>\n",
       "      <td>1.575323e+07</td>\n",
       "      <td>718.000000</td>\n",
       "      <td>44.000000</td>\n",
       "      <td>7.000000</td>\n",
       "      <td>127644.240000</td>\n",
       "      <td>2.000000</td>\n",
       "      <td>1.00000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>149388.247500</td>\n",
       "      <td>0.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>max</th>\n",
       "      <td>10000.00000</td>\n",
       "      <td>1.581569e+07</td>\n",
       "      <td>850.000000</td>\n",
       "      <td>92.000000</td>\n",
       "      <td>10.000000</td>\n",
       "      <td>250898.090000</td>\n",
       "      <td>4.000000</td>\n",
       "      <td>1.00000</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>199992.480000</td>\n",
       "      <td>1.000000</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "         RowNumber    CustomerId   CreditScore           Age        Tenure  \\\n",
       "count  10000.00000  1.000000e+04  10000.000000  10000.000000  10000.000000   \n",
       "mean    5000.50000  1.569094e+07    650.528800     38.921800      5.012800   \n",
       "std     2886.89568  7.193619e+04     96.653299     10.487806      2.892174   \n",
       "min        1.00000  1.556570e+07    350.000000     18.000000      0.000000   \n",
       "25%     2500.75000  1.562853e+07    584.000000     32.000000      3.000000   \n",
       "50%     5000.50000  1.569074e+07    652.000000     37.000000      5.000000   \n",
       "75%     7500.25000  1.575323e+07    718.000000     44.000000      7.000000   \n",
       "max    10000.00000  1.581569e+07    850.000000     92.000000     10.000000   \n",
       "\n",
       "             Balance  NumOfProducts    HasCrCard  IsActiveMember  \\\n",
       "count   10000.000000   10000.000000  10000.00000    10000.000000   \n",
       "mean    76485.889288       1.530200      0.70550        0.515100   \n",
       "std     62397.405202       0.581654      0.45584        0.499797   \n",
       "min         0.000000       1.000000      0.00000        0.000000   \n",
       "25%         0.000000       1.000000      0.00000        0.000000   \n",
       "50%     97198.540000       1.000000      1.00000        1.000000   \n",
       "75%    127644.240000       2.000000      1.00000        1.000000   \n",
       "max    250898.090000       4.000000      1.00000        1.000000   \n",
       "\n",
       "       EstimatedSalary        Exited  \n",
       "count     10000.000000  10000.000000  \n",
       "mean     100090.239881      0.203700  \n",
       "std       57510.492818      0.402769  \n",
       "min          11.580000      0.000000  \n",
       "25%       51002.110000      0.000000  \n",
       "50%      100193.915000      0.000000  \n",
       "75%      149388.247500      0.000000  \n",
       "max      199992.480000      1.000000  "
      ]
     },
     "execution_count": 8,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data.describe()\n"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 5.HANDLE THE MISSING VALUES "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "RowNumber          0\n",
       "CustomerId         0\n",
       "Surname            0\n",
       "CreditScore        0\n",
       "Geography          0\n",
       "Gender             0\n",
       "Age                0\n",
       "Tenure             0\n",
       "Balance            0\n",
       "NumOfProducts      0\n",
       "HasCrCard          0\n",
       "IsActiveMember     0\n",
       "EstimatedSalary    0\n",
       "Exited             0\n",
       "dtype: int64"
      ]
     },
     "execution_count": 10,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data.isnull().sum()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "metadata": {},
   "outputs": [],
   "source": [
    "#No Null values present in this dataset\n",
    "#incase age,region column has missing values we can us below code:\n",
    "data['Age'].fillna(data['Age'].mean(),inplace=True)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 6.FIND THE OUTLIERS AND REPLACE THE OUTLIERS "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "metadata": {},
   "outputs": [],
   "source": [
    "import seaborn as sns"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "<matplotlib.axes._subplots.AxesSubplot at 0x2d3112399b0>"
      ]
     },
     "execution_count": 14,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAAWQAAAEKCAYAAAAl5S8KAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAADl0RVh0U29mdHdhcmUAbWF0cGxvdGxpYiB2ZXJzaW9uIDMuMC4zLCBodHRwOi8vbWF0cGxvdGxpYi5vcmcvnQurowAAD0BJREFUeJzt3X+sZOVdx/H3l70FFvnNAtlctQtcrBITKd0QqrZixLVgQVCiIFooJrVW160NjRASgjWpbVEb3NYWalsasioSbEsRikhJNW1Du0uXH4VdmUWIbOnyywJ2FyzL4x/nGXb2cucnOzNfdt+vZHLPnPuceb7zzJnPPXNm5rlRSkGSNH17TbsASVLDQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUpiZpjGS5YsKcuWLRtTKZK0e1q3bt2TpZTD+7UbKpCXLVvG2rVrR69KkvZAEfHIIO08ZSFJSRjIkpSEgSxJSRjIkpSEgSxJSRjIkpSEgSxJSRjIkpSEgSxJSRjIkpSEgSxJSRjIkpSEgSxJSRjIkpSEgSxJSRjIkpSEgSxJSRjIkpSEgSxJSQz1P/U0WatXr6bVak27jPQ2b94MwOzs7JQreW2Ym5tj5cqV0y5DCzCQE2u1Wqy/7wG273fotEtJbdHWZwD43gvuzv0s2vr0tEtQD+7ByW3f71C2/eRp0y4jtcUbbgZwnAbQHivl5DlkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUrCQJakJAxkSUpiIoG8evVqVq9ePYmuJGmXmmR+zUyik1arNYluJGmXm2R+ecpCkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpIwkCUpCQNZkpKYmUQnmzdvZtu2baxatWoS3e02Wq0We/1fmXYZ2o3s9fyztFrP+VwcQqvVYvHixRPpq+8RckS8KyLWRsTaJ554YhI1SdIeqe8RcinlauBqgOXLl490uDY7OwvAlVdeOcrme6xVq1ax7qEt0y5Du5GX9j2QuaOP9Lk4hEm+mvAcsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIGsiQlYSBLUhIzk+hkbm5uEt1I0i43yfyaSCCvXLlyEt1I0i43yfzylIUkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISBrIkJWEgS1ISM9MuQL0t2vo0izfcPO0yUlu09SkAx2kAi7Y+DRw57TLUhYGc2Nzc3LRLeE3YvPlFAGZnDZr+jnS/SsxATmzlypXTLkHSBHkOWZKSMJAlKQkDWZKSMJAlKQkDWZKSMJAlKQkDWZKSMJAlKQkDWZKSMJAlKQkDWZKSMJAlKQkDWZKSMJAlKQkDWZKSMJAlKQkDWZKSMJAlKQkDWZKSMJAlKYkopQzeOOIJ4JER+1oCPDnituNkXcOxruFY13B217peX0o5vF+joQL51YiItaWU5RPpbAjWNRzrGo51DWdPr8tTFpKUhIEsSUlMMpCvnmBfw7Cu4VjXcKxrOHt0XRM7hyxJ6s1TFpKURSllrBfgbcBGoAVcPKY+fgy4A3gA+A6wqq6/HNgMrK+X0zq2uaTWtBH4lX71AkcBdwIPAtcBew9Y28PAvbX/tXXdocBt9bZuAw6p6wP4m9r3PcAJHbdzfm3/IHB+x/o31dtv1W1jgJre0DEm64FngfdOY7yAzwCPA/d1rBv7+HTro09dVwAbat+fBw6u65cB2zrG7ZOj9t/rPvaoa+yPG7BPvd6qv182QF3XddT0MLB+CuPVLRumvo8t+HwYR0B2FLoI2AQcDewN3A0cN4Z+lrYHDjgA+E/guLqjXrRA++NqLfvUHXBTrbVrvcA/AefU5U8CfzBgbQ8DS+at+0j7SQBcDHy4Lp8G3FJ3ipOAOzse2Ifqz0PqcnsH+ibw5rrNLcCpIzxG3wNeP43xAt4KnMDOT+Sxj0+3PvrUtQKYqcsf7qhrWWe7ebczVP/d7mOfusb+uAHvoQYncA5wXb+65v3+r4DLpjBe3bJh6vvYgvd/2PAb8sn+ZuDWjuuXAJeMs8/azxeBX+6xo+5UB3BrrXXBeutAP8mOJ+NO7frU8jCvDOSNwNKOHWZjXb4KOHd+O+Bc4KqO9VfVdUuBDR3rd2o3YH0rgK/V5amMF/OeoJMYn2599Kpr3u/OAtb0ajdK/93uY5/xGvvj1t62Ls/UdtGrro71Afw3cOw0xmteH+1sSLGPzb+M+xzyLM0D0fZoXTc2EbEMeCPNyyqAP4qIeyLiMxFxSJ+6uq0/DPh+KeXFeesHUYB/jYh1EfGuuu7IUspjAPXnESPWNVuX568fxjnAP3Rcn/Z4wWTGp1sfg7qQ5mio7aiI+HZEfDUi3tJR77D9j/qcGffj9vI29ffP1PaDeAuwpZTyYMe6iY/XvGxIuY+NO5BjgXVlbJ1F7A/cALy3lPIs8AngGOB44DGal0296hp2/SB+rpRyAnAq8IcR8dYebSdZFxGxN3AGcH1dlWG8eklRR0RcCrwIrKmrHgN+vJTyRuB9wN9HxIEj9j/KNpN43F7NWJ7Lzn/0Jz5eC2TDsLc3kX1s3IH8KM1J9bYfBb47jo4i4nU0A76mlPLPAKWULaWU7aWUl4BPASf2qavb+ieBgyNiZtj7UUr5bv35OM0bQScCWyJiaa17Kc2bIaPU9Whdnr9+UKcCd5VSttQapz5e1STGp1sfPUXE+cDbgfNKfS1aSnmhlPJUXV5Hc372J0bsf+jnzIQet5e3qb8/CHi6V10dbX+d5g2+dr0THa+FsmGE25vIPjbuQP4WcGxEHFWPxs4BbtzVnUREAJ8GHiil/HXH+qUdzc4C7qvLNwLnRMQ+EXEUcCzNifkF661PvDuAs+v259Oci+pX149ExAHtZZrztffV/s9f4LZuBN4RjZOAZ+pLnVuBFRFxSH05uoLm3N5jwHMRcVIdg3cMUleHnY5cpj1eHSYxPt366Coi3gb8KXBGKWVrx/rDI2JRXT66js9DI/bf7T72qmsSj1tnvWcDX2n/QerjFJpzrC+/rJ/keHXLhhFubyL72FjfXKuP12k072xuAi4dUx8/T/My4R46PvoDXEvzcZR76uAs7djm0lrTRjo+mdCtXpp3pL9J89GW64F9BqjraJp3sO+m+cjNpXX9YcDtNB+HuR04tOx48+Pjte97geUdt3Vh7bsFvLNj/XKaJ+Am4GMM8LG3ut1+wFPAQR3rJj5eNH8QHgN+SHO08XuTGJ9uffSpq0VzHnGnj2sBv1Ef37uBu4DTR+2/133sUdfYHzdg33q9VX9/dL+66vprgHfPazvJ8eqWDVPfxxa6+E09SUrCb+pJUhIGsiQlYSBLUhIGsiQlYSBLUhIGsgYSEdsjYn3H5eIebc+MiOM6rn8gIk7ZBTUcHBHvGWG7yyPiorp8UkTcWe/DAxFxeZ9tT46Im0YsWRrKTP8mEgDbSinHD9j2TOAm4H6AUsplu6iGg2lmHfvbV3EbnwN+s5Ryd/1ywht2SWVVRMyUHXNBSEPxCFmvSkR8KCLuj2Zim7+MiJ+lmR/jinoUekxEXBMRZ9f2D0fEByPiGxGxNiJOiIhbI2JTRLy7ttk/Im6PiLsi4t6I+LXa3YeAY+rtXlHbvj8ivlX7/7OOui6NiI0R8W/sHLpH0HyBgdJ83fj+2v7EiPh6NBPefD0iXhHU3dpExAURcX1EfIlmIqlrO2omItZExBm7asy1GxvHN+e87H4XYDs7T2r/WzRzw25kxzeT2hO2XwOc3bHty9dppiNtz7H7UZpvUB0AHA48XtfPAAfW5SU034wKXjnt5Aqa/3UWNAcXN9HMy9ueMHw/4MC6/UV1m8uA/6GZV+T3gX3r+gPZMe3kKcANdflk4KY+bS6g+XZa+9tevwB8oS4fBPxXezsvXnpdPGWhQb3ilEU0E8c8D/xdRPwLTSAOoj2fyb3A/qWU52jmA3g+Ig4GfgB8MJqZ8V6imc7wyAVuZ0W9fLte359mXoQDgM+XOt9ERLw8f0op5QMRsaZu99s083mcTBOcn4uIY2m+avu6Bfrr1ea2UsrTtY+vRsTHI+IImol1biiextAAPGWhkdWQOZFmJq0zgS8PuOkL9edLHcvt6zPAeTRHzG+qfwS20MylMF8Af1FKOb5e5kopn26X16PuTaWUTwC/BPxMRBwG/DlwRynlp4HTu/TXq80P5rW9tt6PdwKf7VaL1MlA1siimWP2oFLKzTT/k699BP0czVHqqA6iOX3xw4j4RZp/L7XQ7d4KXFjrICJm61HpvwNnRcTiaGbbO72j5l+ts3JBczS9Hfh+7XNzXX9Bj7r6tWm7hmZMKKV8p09bCfBTFhrc4ohY33H9y8CVwBcjYl+ao9U/qb/7R+BTEfHH7JjKcRhrgC9FxFqa89UbAEopT0XE1yLiPuCWUsr7I+KngG/UjP1f4HdKKXdFRPsfbD4C/EfHbf8u8NGI2Eozyfx5pZTtEfERmtMR7wO+0qWuQdpQa90SEQ8AXxjh/msP5Wxv0hhExH4058hPKKU8M+169NrgKQtpF6tfgtkArDaMNQyPkCUpCY+QJSkJA1mSkjCQJSkJA1mSkjCQJSkJA1mSkvh//kA+n5YMaFoAAAAASUVORK5CYII=",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "sns.boxplot(data.EstimatedSalary)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "metadata": {},
   "outputs": [],
   "source": [
    "##No outlier as found"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "198069.7345"
      ]
     },
     "execution_count": 19,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "perc99=data.EstimatedSalary.quantile(0.99)\n",
    "perc99"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "<matplotlib.axes._subplots.AxesSubplot at 0x2d3114dc0b8>"
      ]
     },
     "execution_count": 21,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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",
      "text/plain": [
       "<Figure size 432x288 with 1 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "##If outlier is present\n",
    "data=data[data.EstimatedSalary<=perc99]\n",
    "sns.boxplot(data.EstimatedSalary)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 7.CHECK THE CATEGORICAL COLUMN AND PERFORM ENCODING "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>RowNumber</th>\n",
       "      <th>CustomerId</th>\n",
       "      <th>Surname</th>\n",
       "      <th>CreditScore</th>\n",
       "      <th>Geography</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Tenure</th>\n",
       "      <th>Balance</th>\n",
       "      <th>NumOfProducts</th>\n",
       "      <th>HasCrCard</th>\n",
       "      <th>IsActiveMember</th>\n",
       "      <th>EstimatedSalary</th>\n",
       "      <th>Exited</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>15634602</td>\n",
       "      <td>Hargrave</td>\n",
       "      <td>619</td>\n",
       "      <td>France</td>\n",
       "      <td>Female</td>\n",
       "      <td>42</td>\n",
       "      <td>2</td>\n",
       "      <td>0.00</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>101348.88</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>15647311</td>\n",
       "      <td>Hill</td>\n",
       "      <td>608</td>\n",
       "      <td>Spain</td>\n",
       "      <td>Female</td>\n",
       "      <td>41</td>\n",
       "      <td>1</td>\n",
       "      <td>83807.86</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>112542.58</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>15619304</td>\n",
       "      <td>Onio</td>\n",
       "      <td>502</td>\n",
       "      <td>France</td>\n",
       "      <td>Female</td>\n",
       "      <td>42</td>\n",
       "      <td>8</td>\n",
       "      <td>159660.80</td>\n",
       "      <td>3</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>113931.57</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>15701354</td>\n",
       "      <td>Boni</td>\n",
       "      <td>699</td>\n",
       "      <td>France</td>\n",
       "      <td>Female</td>\n",
       "      <td>39</td>\n",
       "      <td>1</td>\n",
       "      <td>0.00</td>\n",
       "      <td>2</td>\n",
       "      <td>0</td>\n",
       "      <td>0</td>\n",
       "      <td>93826.63</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>15737888</td>\n",
       "      <td>Mitchell</td>\n",
       "      <td>850</td>\n",
       "      <td>Spain</td>\n",
       "      <td>Female</td>\n",
       "      <td>43</td>\n",
       "      <td>2</td>\n",
       "      <td>125510.82</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>79084.10</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   RowNumber  CustomerId   Surname  CreditScore Geography  Gender  Age  \\\n",
       "0          1    15634602  Hargrave          619    France  Female   42   \n",
       "1          2    15647311      Hill          608     Spain  Female   41   \n",
       "2          3    15619304      Onio          502    France  Female   42   \n",
       "3          4    15701354      Boni          699    France  Female   39   \n",
       "4          5    15737888  Mitchell          850     Spain  Female   43   \n",
       "\n",
       "   Tenure    Balance  NumOfProducts  HasCrCard  IsActiveMember  \\\n",
       "0       2       0.00              1          1               1   \n",
       "1       1   83807.86              1          0               1   \n",
       "2       8  159660.80              3          1               0   \n",
       "3       1       0.00              2          0               0   \n",
       "4       2  125510.82              1          1               1   \n",
       "\n",
       "   EstimatedSalary  Exited  \n",
       "0        101348.88       1  \n",
       "1        112542.58       0  \n",
       "2        113931.57       1  \n",
       "3         93826.63       0  \n",
       "4         79084.10       0  "
      ]
     },
     "execution_count": 22,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.preprocessing import LabelEncoder\n",
    "le=LabelEncoder()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "metadata": {},
   "outputs": [],
   "source": [
    "data.Gender=le.fit_transform(data.Gender)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>RowNumber</th>\n",
       "      <th>CustomerId</th>\n",
       "      <th>Surname</th>\n",
       "      <th>CreditScore</th>\n",
       "      <th>Geography</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Tenure</th>\n",
       "      <th>Balance</th>\n",
       "      <th>NumOfProducts</th>\n",
       "      <th>HasCrCard</th>\n",
       "      <th>IsActiveMember</th>\n",
       "      <th>EstimatedSalary</th>\n",
       "      <th>Exited</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>15634602</td>\n",
       "      <td>Hargrave</td>\n",
       "      <td>619</td>\n",
       "      <td>France</td>\n",
       "      <td>0</td>\n",
       "      <td>42</td>\n",
       "      <td>2</td>\n",
       "      <td>0.00</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>101348.88</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>15647311</td>\n",
       "      <td>Hill</td>\n",
       "      <td>608</td>\n",
       "      <td>Spain</td>\n",
       "      <td>0</td>\n",
       "      <td>41</td>\n",
       "      <td>1</td>\n",
       "      <td>83807.86</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>112542.58</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>15619304</td>\n",
       "      <td>Onio</td>\n",
       "      <td>502</td>\n",
       "      <td>France</td>\n",
       "      <td>0</td>\n",
       "      <td>42</td>\n",
       "      <td>8</td>\n",
       "      <td>159660.80</td>\n",
       "      <td>3</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>113931.57</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>15701354</td>\n",
       "      <td>Boni</td>\n",
       "      <td>699</td>\n",
       "      <td>France</td>\n",
       "      <td>0</td>\n",
       "      <td>39</td>\n",
       "      <td>1</td>\n",
       "      <td>0.00</td>\n",
       "      <td>2</td>\n",
       "      <td>0</td>\n",
       "      <td>0</td>\n",
       "      <td>93826.63</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>15737888</td>\n",
       "      <td>Mitchell</td>\n",
       "      <td>850</td>\n",
       "      <td>Spain</td>\n",
       "      <td>0</td>\n",
       "      <td>43</td>\n",
       "      <td>2</td>\n",
       "      <td>125510.82</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>79084.10</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   RowNumber  CustomerId   Surname  CreditScore Geography  Gender  Age  \\\n",
       "0          1    15634602  Hargrave          619    France       0   42   \n",
       "1          2    15647311      Hill          608     Spain       0   41   \n",
       "2          3    15619304      Onio          502    France       0   42   \n",
       "3          4    15701354      Boni          699    France       0   39   \n",
       "4          5    15737888  Mitchell          850     Spain       0   43   \n",
       "\n",
       "   Tenure    Balance  NumOfProducts  HasCrCard  IsActiveMember  \\\n",
       "0       2       0.00              1          1               1   \n",
       "1       1   83807.86              1          0               1   \n",
       "2       8  159660.80              3          1               0   \n",
       "3       1       0.00              2          0               0   \n",
       "4       2  125510.82              1          1               1   \n",
       "\n",
       "   EstimatedSalary  Exited  \n",
       "0        101348.88       1  \n",
       "1        112542.58       0  \n",
       "2        113931.57       1  \n",
       "3         93826.63       0  \n",
       "4         79084.10       0  "
      ]
     },
     "execution_count": 29,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "metadata": {},
   "outputs": [],
   "source": [
    "##drop unwanted columns\n",
    "data.drop(columns=['Surname','Geography'],inplace=True)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/html": [
       "<div>\n",
       "<style scoped>\n",
       "    .dataframe tbody tr th:only-of-type {\n",
       "        vertical-align: middle;\n",
       "    }\n",
       "\n",
       "    .dataframe tbody tr th {\n",
       "        vertical-align: top;\n",
       "    }\n",
       "\n",
       "    .dataframe thead th {\n",
       "        text-align: right;\n",
       "    }\n",
       "</style>\n",
       "<table border=\"1\" class=\"dataframe\">\n",
       "  <thead>\n",
       "    <tr style=\"text-align: right;\">\n",
       "      <th></th>\n",
       "      <th>RowNumber</th>\n",
       "      <th>CustomerId</th>\n",
       "      <th>CreditScore</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Tenure</th>\n",
       "      <th>Balance</th>\n",
       "      <th>NumOfProducts</th>\n",
       "      <th>HasCrCard</th>\n",
       "      <th>IsActiveMember</th>\n",
       "      <th>EstimatedSalary</th>\n",
       "      <th>Exited</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>15634602</td>\n",
       "      <td>619</td>\n",
       "      <td>0</td>\n",
       "      <td>42</td>\n",
       "      <td>2</td>\n",
       "      <td>0.00</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>101348.88</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>15647311</td>\n",
       "      <td>608</td>\n",
       "      <td>0</td>\n",
       "      <td>41</td>\n",
       "      <td>1</td>\n",
       "      <td>83807.86</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>1</td>\n",
       "      <td>112542.58</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>15619304</td>\n",
       "      <td>502</td>\n",
       "      <td>0</td>\n",
       "      <td>42</td>\n",
       "      <td>8</td>\n",
       "      <td>159660.80</td>\n",
       "      <td>3</td>\n",
       "      <td>1</td>\n",
       "      <td>0</td>\n",
       "      <td>113931.57</td>\n",
       "      <td>1</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>15701354</td>\n",
       "      <td>699</td>\n",
       "      <td>0</td>\n",
       "      <td>39</td>\n",
       "      <td>1</td>\n",
       "      <td>0.00</td>\n",
       "      <td>2</td>\n",
       "      <td>0</td>\n",
       "      <td>0</td>\n",
       "      <td>93826.63</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>15737888</td>\n",
       "      <td>850</td>\n",
       "      <td>0</td>\n",
       "      <td>43</td>\n",
       "      <td>2</td>\n",
       "      <td>125510.82</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>79084.10</td>\n",
       "      <td>0</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   RowNumber  CustomerId  CreditScore  Gender  Age  Tenure    Balance  \\\n",
       "0          1    15634602          619       0   42       2       0.00   \n",
       "1          2    15647311          608       0   41       1   83807.86   \n",
       "2          3    15619304          502       0   42       8  159660.80   \n",
       "3          4    15701354          699       0   39       1       0.00   \n",
       "4          5    15737888          850       0   43       2  125510.82   \n",
       "\n",
       "   NumOfProducts  HasCrCard  IsActiveMember  EstimatedSalary  Exited  \n",
       "0              1          1               1        101348.88       1  \n",
       "1              1          0               1        112542.58       0  \n",
       "2              3          1               0        113931.57       1  \n",
       "3              2          0               0         93826.63       0  \n",
       "4              1          1               1         79084.10       0  "
      ]
     },
     "execution_count": 31,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data.head()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 8.Split the Data into Dependent and Independent variables "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "metadata": {},
   "outputs": [],
   "source": [
    "y=data['EstimatedSalary']"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "metadata": {},
   "outputs": [],
   "source": [
    "x=data.drop('EstimatedSalary',axis=1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "      RowNumber  CustomerId  CreditScore  Gender  Age  Tenure    Balance  \\\n",
      "0             1    15634602          619       0   42       2       0.00   \n",
      "1             2    15647311          608       0   41       1   83807.86   \n",
      "2             3    15619304          502       0   42       8  159660.80   \n",
      "3             4    15701354          699       0   39       1       0.00   \n",
      "4             5    15737888          850       0   43       2  125510.82   \n",
      "5             6    15574012          645       1   44       8  113755.78   \n",
      "6             7    15592531          822       1   50       7       0.00   \n",
      "7             8    15656148          376       0   29       4  115046.74   \n",
      "8             9    15792365          501       1   44       4  142051.07   \n",
      "9            10    15592389          684       1   27       2  134603.88   \n",
      "10           11    15767821          528       1   31       6  102016.72   \n",
      "11           12    15737173          497       1   24       3       0.00   \n",
      "12           13    15632264          476       0   34      10       0.00   \n",
      "13           14    15691483          549       0   25       5       0.00   \n",
      "14           15    15600882          635       0   35       7       0.00   \n",
      "15           16    15643966          616       1   45       3  143129.41   \n",
      "16           17    15737452          653       1   58       1  132602.88   \n",
      "17           18    15788218          549       0   24       9       0.00   \n",
      "18           19    15661507          587       1   45       6       0.00   \n",
      "19           20    15568982          726       0   24       6       0.00   \n",
      "20           21    15577657          732       1   41       8       0.00   \n",
      "21           22    15597945          636       0   32       8       0.00   \n",
      "22           23    15699309          510       0   38       4       0.00   \n",
      "23           24    15725737          669       1   46       3       0.00   \n",
      "24           25    15625047          846       0   38       5       0.00   \n",
      "25           26    15738191          577       1   25       3       0.00   \n",
      "26           27    15736816          756       1   36       2  136815.64   \n",
      "27           28    15700772          571       1   44       9       0.00   \n",
      "28           29    15728693          574       0   43       3  141349.43   \n",
      "29           30    15656300          411       1   29       0   59697.17   \n",
      "...         ...         ...          ...     ...  ...     ...        ...   \n",
      "9970       9971    15587133          518       1   42       7  151027.05   \n",
      "9971       9972    15721377          833       0   34       3  144751.81   \n",
      "9972       9973    15747927          758       1   26       4  155739.76   \n",
      "9973       9974    15806455          611       1   27       7       0.00   \n",
      "9974       9975    15695474          583       1   33       7  122531.86   \n",
      "9975       9976    15666295          610       1   50       1  113957.01   \n",
      "9976       9977    15656062          637       0   33       7  103377.81   \n",
      "9977       9978    15579969          683       0   32       9       0.00   \n",
      "9978       9979    15703563          774       1   40       9   93017.47   \n",
      "9979       9980    15692664          677       0   58       1   90022.85   \n",
      "9980       9981    15719276          741       1   35       6   74371.49   \n",
      "9981       9982    15672754          498       1   42       3  152039.70   \n",
      "9982       9983    15768163          655       0   46       7  137145.12   \n",
      "9983       9984    15656710          613       1   40       4       0.00   \n",
      "9984       9985    15696175          602       1   35       7   90602.42   \n",
      "9985       9986    15586914          659       1   36       6  123841.49   \n",
      "9986       9987    15581736          673       1   47       1  183579.54   \n",
      "9987       9988    15588839          606       1   30       8  180307.73   \n",
      "9988       9989    15589329          775       1   30       4       0.00   \n",
      "9989       9990    15605622          841       1   28       4       0.00   \n",
      "9990       9991    15798964          714       1   33       3   35016.60   \n",
      "9991       9992    15769959          597       0   53       4   88381.21   \n",
      "9992       9993    15657105          726       1   36       2       0.00   \n",
      "9993       9994    15569266          644       1   28       7  155060.41   \n",
      "9994       9995    15719294          800       0   29       2       0.00   \n",
      "9995       9996    15606229          771       1   39       5       0.00   \n",
      "9996       9997    15569892          516       1   35      10   57369.61   \n",
      "9997       9998    15584532          709       0   36       7       0.00   \n",
      "9998       9999    15682355          772       1   42       3   75075.31   \n",
      "9999      10000    15628319          792       0   28       4  130142.79   \n",
      "\n",
      "      NumOfProducts  HasCrCard  IsActiveMember  Exited  \n",
      "0                 1          1               1       1  \n",
      "1                 1          0               1       0  \n",
      "2                 3          1               0       1  \n",
      "3                 2          0               0       0  \n",
      "4                 1          1               1       0  \n",
      "5                 2          1               0       1  \n",
      "6                 2          1               1       0  \n",
      "7                 4          1               0       1  \n",
      "8                 2          0               1       0  \n",
      "9                 1          1               1       0  \n",
      "10                2          0               0       0  \n",
      "11                2          1               0       0  \n",
      "12                2          1               0       0  \n",
      "13                2          0               0       0  \n",
      "14                2          1               1       0  \n",
      "15                2          0               1       0  \n",
      "16                1          1               0       1  \n",
      "17                2          1               1       0  \n",
      "18                1          0               0       0  \n",
      "19                2          1               1       0  \n",
      "20                2          1               1       0  \n",
      "21                2          1               0       0  \n",
      "22                1          1               0       1  \n",
      "23                2          0               1       0  \n",
      "24                1          1               1       0  \n",
      "25                2          0               1       0  \n",
      "26                1          1               1       0  \n",
      "27                2          0               0       0  \n",
      "28                1          1               1       0  \n",
      "29                2          1               1       0  \n",
      "...             ...        ...             ...     ...  \n",
      "9970              2          1               0       0  \n",
      "9971              1          0               0       0  \n",
      "9972              1          1               0       0  \n",
      "9973              2          1               1       0  \n",
      "9974              1          1               0       0  \n",
      "9975              2          1               0       1  \n",
      "9976              1          1               0       0  \n",
      "9977              2          1               1       0  \n",
      "9978              2          1               0       0  \n",
      "9979              1          0               1       0  \n",
      "9980              1          0               0       0  \n",
      "9981              1          1               1       1  \n",
      "9982              1          1               0       1  \n",
      "9983              1          0               0       0  \n",
      "9984              2          1               1       0  \n",
      "9985              2          1               0       0  \n",
      "9986              2          0               1       0  \n",
      "9987              2          1               1       0  \n",
      "9988              2          1               0       0  \n",
      "9989              2          1               1       0  \n",
      "9990              1          1               0       0  \n",
      "9991              1          1               0       1  \n",
      "9992              1          1               0       0  \n",
      "9993              1          1               0       0  \n",
      "9994              2          0               0       0  \n",
      "9995              2          1               0       0  \n",
      "9996              1          1               1       0  \n",
      "9997              1          0               1       1  \n",
      "9998              2          1               0       1  \n",
      "9999              1          1               0       0  \n",
      "\n",
      "[9900 rows x 11 columns]\n"
     ]
    }
   ],
   "source": [
    "print(x)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "0       101348.88\n",
      "1       112542.58\n",
      "2       113931.57\n",
      "3        93826.63\n",
      "4        79084.10\n",
      "5       149756.71\n",
      "6        10062.80\n",
      "7       119346.88\n",
      "8        74940.50\n",
      "9        71725.73\n",
      "10       80181.12\n",
      "11       76390.01\n",
      "12       26260.98\n",
      "13      190857.79\n",
      "14       65951.65\n",
      "15       64327.26\n",
      "16        5097.67\n",
      "17       14406.41\n",
      "18      158684.81\n",
      "19       54724.03\n",
      "20      170886.17\n",
      "21      138555.46\n",
      "22      118913.53\n",
      "23        8487.75\n",
      "24      187616.16\n",
      "25      124508.29\n",
      "26      170041.95\n",
      "27       38433.35\n",
      "28      100187.43\n",
      "29       53483.21\n",
      "          ...    \n",
      "9970    119377.36\n",
      "9971    166472.81\n",
      "9972    171552.02\n",
      "9973    157474.10\n",
      "9974     13549.24\n",
      "9975    196526.55\n",
      "9976     84419.78\n",
      "9977     24991.92\n",
      "9978    191608.97\n",
      "9979      2988.28\n",
      "9980     99595.67\n",
      "9981     53445.17\n",
      "9982    115146.40\n",
      "9983    151325.24\n",
      "9984     51695.41\n",
      "9985     96833.00\n",
      "9986     34047.54\n",
      "9987      1914.41\n",
      "9988     49337.84\n",
      "9989    179436.60\n",
      "9990     53667.08\n",
      "9991     69384.71\n",
      "9992    195192.40\n",
      "9993     29179.52\n",
      "9994    167773.55\n",
      "9995     96270.64\n",
      "9996    101699.77\n",
      "9997     42085.58\n",
      "9998     92888.52\n",
      "9999     38190.78\n",
      "Name: EstimatedSalary, Length: 9900, dtype: float64\n"
     ]
    }
   ],
   "source": [
    "print(y)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 9.SCALE THE INDEPENDENT VALUES "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.preprocessing import scale\n",
    "x_scaled=pd.DataFrame(scale(x),columns=x.columns)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "      RowNumber  CustomerId  CreditScore    Gender       Age    Tenure  \\\n",
      "0     -1.731530   -0.782480    -0.326129 -1.096562  0.291004 -1.041861   \n",
      "1     -1.731184   -0.605832    -0.440002 -1.096562  0.195832 -1.387751   \n",
      "2     -1.730838   -0.995113    -1.537319 -1.096562  0.291004  1.033476   \n",
      "3     -1.730491    0.145333     0.502035 -1.096562  0.005489 -1.387751   \n",
      "4     -1.730145    0.653133     2.065194 -1.096562  0.386175 -1.041861   \n",
      "5     -1.729799   -1.624644    -0.056976  0.911942  0.481347  1.033476   \n",
      "6     -1.729452   -1.367241     1.775336  0.911942  1.052376  0.687586   \n",
      "7     -1.729106   -0.483003    -2.841677 -1.096562 -0.946226 -0.350082   \n",
      "8     -1.728760    1.410330    -1.547671  0.911942  0.481347 -0.350082   \n",
      "9     -1.728413   -1.369215     0.346754  0.911942 -1.136569 -1.041861   \n",
      "10    -1.728067    1.069184    -1.268166  0.911942 -0.755883  0.341697   \n",
      "11    -1.727721    0.643195    -1.589079  0.911942 -1.422084 -0.695972   \n",
      "12    -1.727375   -0.814976    -1.806472 -1.096562 -0.470369  1.725255   \n",
      "13    -1.727028    0.008132    -1.050773 -1.096562 -1.326912 -0.004193   \n",
      "14    -1.726682   -1.251167    -0.160496 -1.096562 -0.375197  0.687586   \n",
      "15    -1.726336   -0.652326    -0.357185  0.911942  0.576518 -0.695972   \n",
      "16    -1.725989    0.647073     0.025840  0.911942  1.813748 -1.387751   \n",
      "17    -1.725643    1.352690    -1.050773 -1.096562 -1.422084  1.379366   \n",
      "18    -1.725297   -0.408517    -0.657395  0.911942  0.576518  0.341697   \n",
      "19    -1.724950   -1.694558     0.781540 -1.096562 -1.422084  0.341697   \n",
      "20    -1.724604   -1.573981     0.843652  0.911942  0.195832  1.033476   \n",
      "21    -1.724258   -1.291990    -0.150144 -1.096562 -0.660712  1.033476   \n",
      "22    -1.723911    0.116908    -1.454502 -1.096562 -0.089682 -0.350082   \n",
      "23    -1.723565    0.484242     0.191473  0.911942  0.671690 -0.695972   \n",
      "24    -1.723219   -0.915288     2.023786 -1.096562 -0.089682 -0.004193   \n",
      "25    -1.722872    0.657345    -0.760915  0.911942 -1.326912 -0.695972   \n",
      "26    -1.722526    0.638233     1.092101  0.911942 -0.280025 -1.041861   \n",
      "27    -1.722180    0.137243    -0.823028  0.911942  0.481347  1.379366   \n",
      "28    -1.721833    0.525328    -0.791971 -1.096562  0.386175 -0.695972   \n",
      "29    -1.721487   -0.480891    -2.479355  0.911942 -0.946226 -1.733640   \n",
      "...         ...         ...          ...       ...       ...       ...   \n",
      "9870   1.721304   -1.442270    -1.371686  0.911942  0.291004  0.687586   \n",
      "9871   1.721651    0.423640     1.889209 -1.096562 -0.470369 -0.695972   \n",
      "9872   1.721997    0.792669     1.112805  0.911942 -1.231741 -0.350082   \n",
      "9873   1.722343    1.606173    -0.408946  0.911942 -1.136569  0.687586   \n",
      "9874   1.722690    0.063604    -0.698803  0.911942 -0.565540  0.687586   \n",
      "9875   1.723036   -0.341966    -0.419298  0.911942  1.052376 -1.387751   \n",
      "9876   1.723382   -0.484199    -0.139792 -1.096562 -0.565540  0.687586   \n",
      "9877   1.723729   -1.541845     0.336402 -1.096562 -0.660712  1.379366   \n",
      "9878   1.724075    0.176036     1.278438  0.911942  0.100661  1.379366   \n",
      "9879   1.724421    0.024547     0.274290 -1.096562  1.813748 -1.387751   \n",
      "9880   1.724768    0.394438     0.936821  0.911942 -0.375197  0.341697   \n",
      "9881   1.725114   -0.252190    -1.578727  0.911942  0.291004 -0.695972   \n",
      "9882   1.725460    1.073937     0.046544 -1.096562  0.671690  0.687586   \n",
      "9883   1.725806   -0.475192    -0.388242  0.911942  0.100661 -0.350082   \n",
      "9884   1.726153    0.073348    -0.502114  0.911942 -0.375197  0.687586   \n",
      "9885   1.726499   -1.445314     0.087953  0.911942 -0.280025  0.341697   \n",
      "9886   1.726845   -1.517285     0.232881  0.911942  0.766862 -1.387751   \n",
      "9887   1.727192   -1.418558    -0.460706  0.911942 -0.851055  1.033476   \n",
      "9888   1.727538   -1.411747     1.288790  0.911942 -0.851055 -0.350082   \n",
      "9889   1.727884   -1.185284     1.972025  0.911942 -1.041398 -0.350082   \n",
      "9890   1.728231    1.502052     0.657315  0.911942 -0.565540 -0.695972   \n",
      "9891   1.728577    1.098900    -0.553874 -1.096562  1.337891 -0.350082   \n",
      "9892   1.728923   -0.469702     0.781540  0.911942 -0.280025 -1.041861   \n",
      "9893   1.729270   -1.690610    -0.067328  0.911942 -1.041398  0.687586   \n",
      "9894   1.729616    0.394688     1.547591 -1.096562 -0.946226 -1.041861   \n",
      "9895   1.729962   -1.176847     1.247382  0.911942  0.005489 -0.004193   \n",
      "9896   1.730309   -1.681909    -1.392390  0.911942 -0.375197  1.725255   \n",
      "9897   1.730655   -1.478422     0.605555 -1.096562 -0.280025  0.687586   \n",
      "9898   1.731001   -0.118742     1.257734  0.911942  0.291004 -0.695972   \n",
      "9899   1.731348   -0.869810     1.464775 -1.096562 -1.041398 -0.350082   \n",
      "\n",
      "       Balance  NumOfProducts  HasCrCard  IsActiveMember    Exited  \n",
      "0    -1.225336      -0.912372   0.646319        0.969946  1.974478  \n",
      "1     0.117505      -0.912372  -1.547223        0.969946 -0.506463  \n",
      "2     1.332884       2.525953   0.646319       -1.030985  1.974478  \n",
      "3    -1.225336       0.806791  -1.547223       -1.030985 -0.506463  \n",
      "4     0.785705      -0.912372   0.646319        0.969946 -0.506463  \n",
      "5     0.597355       0.806791   0.646319       -1.030985  1.974478  \n",
      "6    -1.225336       0.806791   0.646319        0.969946 -0.506463  \n",
      "7     0.618040       4.245116   0.646319       -1.030985  1.974478  \n",
      "8     1.050726       0.806791  -1.547223        0.969946 -0.506463  \n",
      "9     0.931401      -0.912372   0.646319        0.969946 -0.506463  \n",
      "10    0.409262       0.806791  -1.547223       -1.030985 -0.506463  \n",
      "11   -1.225336       0.806791   0.646319       -1.030985 -0.506463  \n",
      "12   -1.225336       0.806791   0.646319       -1.030985 -0.506463  \n",
      "13   -1.225336       0.806791  -1.547223       -1.030985 -0.506463  \n",
      "14   -1.225336       0.806791   0.646319        0.969946 -0.506463  \n",
      "15    1.068005       0.806791  -1.547223        0.969946 -0.506463  \n",
      "16    0.899340      -0.912372   0.646319       -1.030985  1.974478  \n",
      "17   -1.225336       0.806791   0.646319        0.969946 -0.506463  \n",
      "18   -1.225336      -0.912372  -1.547223       -1.030985 -0.506463  \n",
      "19   -1.225336       0.806791   0.646319        0.969946 -0.506463  \n",
      "20   -1.225336       0.806791   0.646319        0.969946 -0.506463  \n",
      "21   -1.225336       0.806791   0.646319       -1.030985 -0.506463  \n",
      "22   -1.225336      -0.912372   0.646319       -1.030985  1.974478  \n",
      "23   -1.225336       0.806791  -1.547223        0.969946 -0.506463  \n",
      "24   -1.225336      -0.912372   0.646319        0.969946 -0.506463  \n",
      "25   -1.225336       0.806791  -1.547223        0.969946 -0.506463  \n",
      "26    0.966840      -0.912372   0.646319        0.969946 -0.506463  \n",
      "27   -1.225336       0.806791  -1.547223       -1.030985 -0.506463  \n",
      "28    1.039484      -0.912372   0.646319        0.969946 -0.506463  \n",
      "29   -0.268817       0.806791   0.646319        0.969946 -0.506463  \n",
      "...        ...            ...        ...             ...       ...  \n",
      "9870  1.194547       0.806791   0.646319       -1.030985 -0.506463  \n",
      "9871  1.094000      -0.912372  -1.547223       -1.030985 -0.506463  \n",
      "9872  1.270058      -0.912372   0.646319       -1.030985 -0.506463  \n",
      "9873 -1.225336       0.806791   0.646319        0.969946 -0.506463  \n",
      "9874  0.737973      -0.912372   0.646319       -1.030985 -0.506463  \n",
      "9875  0.600580       0.806791   0.646319       -1.030985  1.974478  \n",
      "9876  0.431071      -0.912372   0.646319       -1.030985 -0.506463  \n",
      "9877 -1.225336       0.806791   0.646319        0.969946 -0.506463  \n",
      "9878  0.265069       0.806791   0.646319       -1.030985 -0.506463  \n",
      "9879  0.217086      -0.912372  -1.547223        0.969946 -0.506463  \n",
      "9880 -0.033693      -0.912372  -1.547223       -1.030985 -0.506463  \n",
      "9881  1.210773      -0.912372   0.646319        0.969946  1.974478  \n",
      "9882  0.972119      -0.912372   0.646319       -1.030985  1.974478  \n",
      "9883 -1.225336      -0.912372  -1.547223       -1.030985 -0.506463  \n",
      "9884  0.226373       0.806791   0.646319        0.969946 -0.506463  \n",
      "9885  0.758957       0.806791   0.646319       -1.030985 -0.506463  \n",
      "9886  1.716131       0.806791  -1.547223        0.969946 -0.506463  \n",
      "9887  1.663707       0.806791   0.646319        0.969946 -0.506463  \n",
      "9888 -1.225336       0.806791   0.646319       -1.030985 -0.506463  \n",
      "9889 -1.225336       0.806791   0.646319        0.969946 -0.506463  \n",
      "9890 -0.664270      -0.912372   0.646319       -1.030985 -0.506463  \n",
      "9891  0.190783      -0.912372   0.646319       -1.030985  1.974478  \n",
      "9892 -1.225336      -0.912372   0.646319       -1.030985 -0.506463  \n",
      "9893  1.259173      -0.912372   0.646319       -1.030985 -0.506463  \n",
      "9894 -1.225336       0.806791  -1.547223       -1.030985 -0.506463  \n",
      "9895 -1.225336       0.806791   0.646319       -1.030985 -0.506463  \n",
      "9896 -0.306111      -0.912372   0.646319        0.969946 -0.506463  \n",
      "9897 -1.225336      -0.912372  -1.547223        0.969946  1.974478  \n",
      "9898 -0.022416       0.806791   0.646319       -1.030985  1.974478  \n",
      "9899  0.859922      -0.912372   0.646319       -1.030985 -0.506463  \n",
      "\n",
      "[9900 rows x 11 columns]\n"
     ]
    }
   ],
   "source": [
    "print(x_scaled)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 10.SPLIT THE DATA INTO TRAINING AND TESTING "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 39,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.model_selection import train_test_split"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "metadata": {},
   "outputs": [],
   "source": [
    "x_train,x_test,y_train,y_test=train_test_split(x_scaled,y,test_size=0.2,random_state=10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 42,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(7920, 11)"
      ]
     },
     "execution_count": 42,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "x_train.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 44,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(7920,)"
      ]
     },
     "execution_count": 44,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "y_train.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": []
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.7.3"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 2
}
