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
    "data=pd.read_csv('Mall_Customers.csv')"
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
       "      <th>CustomerID</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Annual Income (k$)</th>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>Male</td>\n",
       "      <td>19</td>\n",
       "      <td>15</td>\n",
       "      <td>39</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>Male</td>\n",
       "      <td>21</td>\n",
       "      <td>15</td>\n",
       "      <td>81</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>Female</td>\n",
       "      <td>20</td>\n",
       "      <td>16</td>\n",
       "      <td>6</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>Female</td>\n",
       "      <td>23</td>\n",
       "      <td>16</td>\n",
       "      <td>77</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>Female</td>\n",
       "      <td>31</td>\n",
       "      <td>17</td>\n",
       "      <td>40</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   CustomerID  Gender  Age  Annual Income (k$)  Spending Score (1-100)\n",
       "0           1    Male   19                  15                      39\n",
       "1           2    Male   21                  15                      81\n",
       "2           3  Female   20                  16                       6\n",
       "3           4  Female   23                  16                      77\n",
       "4           5  Female   31                  17                      40"
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
   "execution_count": 4,
   "metadata": {},
   "outputs": [],
   "source": [
    "import matplotlib.pyplot as plt\n",
    "import seaborn as sns"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "image/png": "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\n",
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
    "plt.scatter(data.index,data['CustomerID'])\n",
    "plt.show()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "<matplotlib.axes._subplots.AxesSubplot at 0x289ac401320>"
      ]
     },
     "execution_count": 6,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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\n",
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
    "sns.scatterplot(x=data.index,y=data['CustomerID'],hue=data['Age'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(array([24., 22., 28., 38., 30., 36.,  8.,  6.,  4.,  4.]),\n",
       " array([ 15. ,  27.2,  39.4,  51.6,  63.8,  76. ,  88.2, 100.4, 112.6,\n",
       "        124.8, 137. ]),\n",
       " <a list of 10 Patch objects>)"
      ]
     },
     "execution_count": 7,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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\n",
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
    "plt.hist(data['Annual Income (k$)'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "{'whiskers': [<matplotlib.lines.Line2D at 0x289ac56efd0>,\n",
       "  <matplotlib.lines.Line2D at 0x289ac57e3c8>],\n",
       " 'caps': [<matplotlib.lines.Line2D at 0x289ac57e710>,\n",
       "  <matplotlib.lines.Line2D at 0x289ac57ea58>],\n",
       " 'boxes': [<matplotlib.lines.Line2D at 0x289ac56ec50>],\n",
       " 'medians': [<matplotlib.lines.Line2D at 0x289ac57eda0>],\n",
       " 'fliers': [<matplotlib.lines.Line2D at 0x289ac57ed68>],\n",
       " 'means': []}"
      ]
     },
     "execution_count": 8,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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\n",
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
    "plt.boxplot(data['CustomerID'])"
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
   "execution_count": 9,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "{'whiskers': [<matplotlib.lines.Line2D at 0x289ac5dd6a0>,\n",
       "  <matplotlib.lines.Line2D at 0x289ac5dd9e8>],\n",
       " 'caps': [<matplotlib.lines.Line2D at 0x289ac5ddd30>,\n",
       "  <matplotlib.lines.Line2D at 0x289ac5ddcf8>],\n",
       " 'boxes': [<matplotlib.lines.Line2D at 0x289ac5dd2b0>],\n",
       " 'medians': [<matplotlib.lines.Line2D at 0x289ac5e7400>],\n",
       " 'fliers': [<matplotlib.lines.Line2D at 0x289ac5e7748>],\n",
       " 'means': []}"
      ]
     },
     "execution_count": 9,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAAXoAAAD8CAYAAAB5Pm/hAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAADl0RVh0U29mdHdhcmUAbWF0cGxvdGxpYiB2ZXJzaW9uIDMuMC4zLCBodHRwOi8vbWF0cGxvdGxpYi5vcmcvnQurowAADklJREFUeJzt3X+MZXV5x/H3p6AmrbXsdkdCgOkiWUmhaVe9oSRGQ0t/AGlEm2AhDW4t6WgCiSb+Idqk0P5lWtHEtMWucQMkdIUWUdJsWwmxEhOxziJdl6J1oSgjk90ViJhgaBaf/jFnkutyZ+fuPffuLF/er+TmnvOcX8+S2c8cvntOvqkqJEnt+rmNbkCSNFsGvSQ1zqCXpMYZ9JLUOINekhpn0EtS4wx6SWqcQS9JjTPoJalxp250AwBbtmyprVu3bnQbkvSysnfv3h9W1dx6+50UQb9161YWFxc3ug1JellJ8r1x9nPoRpIaZ9BLUuMMeklqnEEvSY0z6CWpcesGfZKzk3w5yaNJHknyga6+Ocl9Sb7bfW/q6knyqSQHkuxL8uZZ/yEkSWsb547+CPChqvpV4CLguiTnAzcA91fVNuD+bh3gMmBb91kAbpl615Kksa0b9FW1XFUPdcs/Bh4FzgSuAG7rdrsNeGe3fAVwe614EDgtyRlT71ySNJbjemEqyVbgTcDXgdOrahlWfhkkeX2325nAk0OHLXW15aPOtcDKHT/z8/MTtC4dvyQn5DrOxayTydj/GJvktcDdwAer6rlj7Tqi9pKf+qraWVWDqhrMza37Bq80FVV13J9JjpNOJmMFfZJXsRLyd1TV57vywdUhme77UFdfAs4eOvws4KnptCtJOl7jPHUT4LPAo1X1iaFN9wI7uuUdwBeH6u/pnr65CPjR6hCPJOnEG2eM/q3ANcC3kjzc1T4KfAy4K8m1wPeBK7tte4DLgQPA88B7p9qxJOm4rBv0VfVVRo+7A1wyYv8CruvZlyRpSnwzVpIaZ9BLUuMMeklqnEEvSY0z6CWpcQa9JDXOoJekxhn0ktQ4g16SGmfQS1LjDHpJapxBL0mNM+glqXEGvSQ1zqCXpMaNM8PUriSHkuwfqt2Z5OHu88TqhCRJtib5ydC2T8+yeUnS+saZYepW4G+B21cLVfVHq8tJbgZ+NLT/Y1W1fVoNSpL6GWeGqQeSbB21rZtP9t3Ab0+3LUnStPQdo38bcLCqvjtUOyfJN5N8Jcnbep5fktTTOEM3x3I1sHtofRmYr6qnk7wF+EKSC6rquaMPTLIALADMz8/3bEOStJaJ7+iTnAr8IXDnaq2qXqiqp7vlvcBjwBtHHV9VO6tqUFWDubm5SduQJK2jz9DN7wDfrqql1UKSuSSndMtvALYBj/drUZLUxziPV+4Gvgacl2QpybXdpqv42WEbgLcD+5L8F/DPwPur6plpNixJOj7jPHVz9Rr1PxlRuxu4u39bkqRp8c1YSWqcQS9JjTPoJalxBr0kNc6gl6TGGfSS1DiDXpIaZ9BLUuMMeklqnEEvSY0z6CWpcQa9JDXOoJekxhn0ktQ4g16SGmfQS1LjxplhaleSQ0n2D9VuSvKDJA93n8uHtn0kyYEk30ny+7NqXJI0nnHu6G8FLh1R/2RVbe8+ewCSnM/KFIMXdMf8/eocspKkjbFu0FfVA8C4875eAXyuql6oqv8FDgAX9uhPktRTnzH665Ps64Z2NnW1M4Enh/ZZ6mqSpA0yadDfApwLbAeWgZu7ekbsW6NOkGQhyWKSxcOHD0/Yhl7pNm/eTJKZfoCZX2Pz5s0b/F9SLTt1koOq6uDqcpLPAP/SrS4BZw/tehbw1Brn2AnsBBgMBiN/GUjrefbZZ6l6+f/4rP5CkWZhojv6JGcMrb4LWH0i517gqiSvSXIOsA34z34tSpL6WPeOPslu4GJgS5Il4Ebg4iTbWRmWeQJ4H0BVPZLkLuC/gSPAdVX14mxalySNIyfD//YOBoNaXFzc6Db0MpSkmaGbFv4cOrGS7K2qwXr7+WasJDXOoJekxhn0ktQ4g16SGmfQS1LjDHpJapxBL0mNM+glqXEGvSQ1zqCXpMYZ9JLUOINekhpn0EtS4wx6SWqcQS9JjTPoJalx6wZ9kl1JDiXZP1T7myTfTrIvyT1JTuvqW5P8JMnD3efTs2xekrS+ce7obwUuPap2H/BrVfXrwP8AHxna9lhVbe8+759Om5KkSa0b9FX1APDMUbUvVdWRbvVB4KwZ9CZJmoJpjNH/KfCvQ+vnJPlmkq8kedsUzi9J6uHUPgcn+XPgCHBHV1oG5qvq6SRvAb6Q5IKqem7EsQvAAsD8/HyfNiRJxzDxHX2SHcAfAH9c3fT1VfVCVT3dLe8FHgPeOOr4qtpZVYOqGszNzU3ahiRpHRMFfZJLgQ8D76iq54fqc0lO6ZbfAGwDHp9Go5Kkyaw7dJNkN3AxsCXJEnAjK0/ZvAa4LwnAg90TNm8H/irJEeBF4P1V9czIE0uSToh1g76qrh5R/uwa+94N3N23KUnS9PhmrCQ1zqCXpMYZ9JLUOINekhpn0EtS4wx6SWqcQS9JjTPoJalxBr0kNc6gl6TGGfSS1DiDXpIaZ9BLUuMMeklqnEEvSY0z6CWpcWMFfZJdSQ4l2T9U25zkviTf7b43dfUk+VSSA0n2JXnzrJqXJK1v3Dv6W4FLj6rdANxfVduA+7t1gMtYmSt2G7AA3NK/TUnSpMYK+qp6ADh67tcrgNu65duAdw7Vb68VDwKnJTljGs1Kko7funPGHsPpVbUMUFXLSV7f1c8Enhzab6mrLfe4ljRS3fg6uOmXNrqN3urG1210C2pYn6BfS0bU6iU7JQusDO0wPz8/gzb0SpC/fI6ql/x4vewkoW7a6C7Uqj5P3RxcHZLpvg919SXg7KH9zgKeOvrgqtpZVYOqGszNzfVoQ5J0LH2C/l5gR7e8A/jiUP093dM3FwE/Wh3ikSSdeGMN3STZDVwMbEmyBNwIfAy4K8m1wPeBK7vd9wCXAweA54H3TrlnSdJxGCvoq+rqNTZdMmLfAq7r05QkaXp8M1aSGmfQS1LjDHpJapxBL0mNM+glqXEGvSQ1zqCXpMYZ9JLUOINekhpn0EtS4wx6SWqcQS9JjTPoJalxBr0kNc6gl6TGGfSS1LiJJwdPch5w51DpDcBfAKcBfwYc7uofrao9E3coSepl4qCvqu8A2wGSnAL8ALiHlakDP1lVH59Kh5KkXqY1dHMJ8FhVfW9K55MkTcm0gv4qYPfQ+vVJ9iXZlWTTqAOSLCRZTLJ4+PDhUbtIkqagd9AneTXwDuCfutItwLmsDOssAzePOq6qdlbVoKoGc3NzfduQJK1hGnf0lwEPVdVBgKo6WFUvVtVPgc8AF07hGpKkCU0j6K9maNgmyRlD294F7J/CNSRJE5r4qRuAJD8P/C7wvqHyXyfZDhTwxFHbJEknWK+gr6rngV8+qnZNr44kSVPlm7GS1DiDXpIaZ9BLUuMMeklqnEEvSY0z6CWpcQa9JDXOoJekxhn0ktQ4g16SGmfQS1LjDHpJapxBL0mNM+glqXEGvSQ1zqCXpMb1mngEIMkTwI+BF4EjVTVIshm4E9jKyixT766qZ/teS5J0/KZ1R/9bVbW9qgbd+g3A/VW1Dbi/W5ckbYDed/RruAK4uFu+DfgP4MMzupZe4ZJsdAu9bdq0aaNbUMOmEfQFfClJAf9QVTuB06tqGaCqlpO8/uiDkiwACwDz8/NTaEOvRFU182skOSHXkWZlGkH/1qp6qgvz+5J8e5yDul8IOwEGg4F/iyRpRnqP0VfVU933IeAe4ELgYJIzALrvQ32vI0maTK+gT/ILSX5xdRn4PWA/cC+wo9ttB/DFPteRJE2u79DN6cA93T+GnQr8Y1X9W5JvAHcluRb4PnBlz+tIkibUK+ir6nHgN0bUnwYu6XNuSdJ0+GasJDXOoJekxhn0ktQ4g16SGmfQS1LjDHpJapxBL0mNM+glqXEGvSQ1zqCXpMYZ9JLUOINekhpn0EtS4wx6SWqcQS9JjZs46JOcneTLSR5N8kiSD3T1m5L8IMnD3efy6bUrSTpefSYeOQJ8qKoe6qYT3Jvkvm7bJ6vq4/3bkyT1NXHQV9UysNwt/zjJo8CZ02pMkjQdUxmjT7IVeBPw9a50fZJ9SXYl2TSNa0iSJtM76JO8Frgb+GBVPQfcApwLbGfljv/mNY5bSLKYZPHw4cN925AkraFX0Cd5FSshf0dVfR6gqg5W1YtV9VPgM8CFo46tqp1VNaiqwdzcXJ82JEnH0OepmwCfBR6tqk8M1c8Y2u1dwP7J25Mk9dXnqZu3AtcA30rycFf7KHB1ku1AAU8A7+vVoSSplz5P3XwVyIhNeyZvR5I0bb4ZK0mNM+glqXEGvSQ1zqCXpMYZ9JLUOINekhpn0EtS4wx6SWqcQS9JjTPoJalxBr0kNc6gl6TGGfSS1DiDXpIaZ9BLUuMMeklq3MyCPsmlSb6T5ECSG2Z1HUnSsc0k6JOcAvwdcBlwPivTC54/i2tJko5tVnf0FwIHqurxqvo/4HPAFTO6liTpGPpMDn4sZwJPDq0vAb85o2tJY0tGTXM8/eOqaqLrSLMwq6Af9bfiZ37ykywACwDz8/MzakP6WQawXolmNXSzBJw9tH4W8NTwDlW1s6oGVTWYm5ubURuSpFkF/TeAbUnOSfJq4Crg3hldS5J0DDMZuqmqI0muB/4dOAXYVVWPzOJakqRjm9UYPVW1B9gzq/NLksbjm7GS1DiDXpIaZ9BLUuMMeklqXE6GF0iSHAa+t9F9SGvYAvxwo5uQRviVqlr3RaSTIuilk1mSxaoabHQf0qQcupGkxhn0ktQ4g15a386NbkDqwzF6SWqcd/SS1DiDXlpDkl1JDiXZv9G9SH0Y9NLabgUu3egmpL4MemkNVfUA8MxG9yH1ZdBLUuMMeklqnEEvSY0z6CWpcQa9tIYku4GvAeclWUpy7Ub3JE3CN2MlqXHe0UtS4wx6SWqcQS9JjTPoJalxBr0kNc6gl6TGGfSS1DiDXpIa9//iObeU/zyw9gAAAABJRU5ErkJggg==\n",
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
    "plt.boxplot(data['CustomerID'])"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
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
       "      <th>CustomerID</th>\n",
       "      <th>Age</th>\n",
       "      <th>Annual Income (k$)</th>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>CustomerID</th>\n",
       "      <td>1.000000</td>\n",
       "      <td>-0.026763</td>\n",
       "      <td>0.977548</td>\n",
       "      <td>0.013835</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>Age</th>\n",
       "      <td>-0.026763</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>-0.012398</td>\n",
       "      <td>-0.327227</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>Annual Income (k$)</th>\n",
       "      <td>0.977548</td>\n",
       "      <td>-0.012398</td>\n",
       "      <td>1.000000</td>\n",
       "      <td>0.009903</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "      <td>0.013835</td>\n",
       "      <td>-0.327227</td>\n",
       "      <td>0.009903</td>\n",
       "      <td>1.000000</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "                        CustomerID       Age  Annual Income (k$)  \\\n",
       "CustomerID                1.000000 -0.026763            0.977548   \n",
       "Age                      -0.026763  1.000000           -0.012398   \n",
       "Annual Income (k$)        0.977548 -0.012398            1.000000   \n",
       "Spending Score (1-100)    0.013835 -0.327227            0.009903   \n",
       "\n",
       "                        Spending Score (1-100)  \n",
       "CustomerID                            0.013835  \n",
       "Age                                  -0.327227  \n",
       "Annual Income (k$)                    0.009903  \n",
       "Spending Score (1-100)                1.000000  "
      ]
     },
     "execution_count": 10,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
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
   "execution_count": 11,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "<seaborn.axisgrid.PairGrid at 0x289ac53d198>"
      ]
     },
     "execution_count": 11,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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\n",
      "text/plain": [
       "<Figure size 720x720 with 20 Axes>"
      ]
     },
     "metadata": {
      "needs_background": "light"
     },
     "output_type": "display_data"
    }
   ],
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
   "execution_count": 12,
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
       "      <th>CustomerID</th>\n",
       "      <th>Age</th>\n",
       "      <th>Annual Income (k$)</th>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>count</th>\n",
       "      <td>200.000000</td>\n",
       "      <td>200.000000</td>\n",
       "      <td>200.000000</td>\n",
       "      <td>200.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>mean</th>\n",
       "      <td>100.500000</td>\n",
       "      <td>38.850000</td>\n",
       "      <td>60.560000</td>\n",
       "      <td>50.200000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>std</th>\n",
       "      <td>57.879185</td>\n",
       "      <td>13.969007</td>\n",
       "      <td>26.264721</td>\n",
       "      <td>25.823522</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>min</th>\n",
       "      <td>1.000000</td>\n",
       "      <td>18.000000</td>\n",
       "      <td>15.000000</td>\n",
       "      <td>1.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>25%</th>\n",
       "      <td>50.750000</td>\n",
       "      <td>28.750000</td>\n",
       "      <td>41.500000</td>\n",
       "      <td>34.750000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>50%</th>\n",
       "      <td>100.500000</td>\n",
       "      <td>36.000000</td>\n",
       "      <td>61.500000</td>\n",
       "      <td>50.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>75%</th>\n",
       "      <td>150.250000</td>\n",
       "      <td>49.000000</td>\n",
       "      <td>78.000000</td>\n",
       "      <td>73.000000</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>max</th>\n",
       "      <td>200.000000</td>\n",
       "      <td>70.000000</td>\n",
       "      <td>137.000000</td>\n",
       "      <td>99.000000</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "       CustomerID         Age  Annual Income (k$)  Spending Score (1-100)\n",
       "count  200.000000  200.000000          200.000000              200.000000\n",
       "mean   100.500000   38.850000           60.560000               50.200000\n",
       "std     57.879185   13.969007           26.264721               25.823522\n",
       "min      1.000000   18.000000           15.000000                1.000000\n",
       "25%     50.750000   28.750000           41.500000               34.750000\n",
       "50%    100.500000   36.000000           61.500000               50.000000\n",
       "75%    150.250000   49.000000           78.000000               73.000000\n",
       "max    200.000000   70.000000          137.000000               99.000000"
      ]
     },
     "execution_count": 12,
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
   "execution_count": 13,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "CustomerID                0\n",
       "Gender                    0\n",
       "Age                       0\n",
       "Annual Income (k$)        0\n",
       "Spending Score (1-100)    0\n",
       "dtype: int64"
      ]
     },
     "execution_count": 13,
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
   "execution_count": 14,
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
   "execution_count": 15,
   "metadata": {},
   "outputs": [],
   "source": [
    "import seaborn as sns"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "<matplotlib.axes._subplots.AxesSubplot at 0x289acdadcf8>"
      ]
     },
     "execution_count": 16,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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\n",
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
    "sns.boxplot(data.Age)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "metadata": {},
   "outputs": [],
   "source": [
    "##No outlier as found"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "69.00999999999999"
      ]
     },
     "execution_count": 18,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "perc99=data.Age.quantile(0.99)\n",
    "perc99"
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
       "<matplotlib.axes._subplots.AxesSubplot at 0x289ad033b00>"
      ]
     },
     "execution_count": 19,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "iVBORw0KGgoAAAANSUhEUgAAAWQAAAEKCAYAAAAl5S8KAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAADl0RVh0U29mdHdhcmUAbWF0cGxvdGxpYiB2ZXJzaW9uIDMuMC4zLCBodHRwOi8vbWF0cGxvdGxpYi5vcmcvnQurowAACtNJREFUeJzt3W2IpfdZx/Hfld2GblpLTDcucVM7hpGkWm2ahNoYkRofsFKKDxG6KBRR+kaWLSiivlPpi77RhgXFUBUFn/pgUUJoDTWK+iJlt01pahIda2qzbZKNsYm6MSXJ3xfn3mZti7uznDn3NWc+H1hmzn3O5lz/zL3fPfOfnXtqjBEA5nfJ3AMAsCDIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNLF/Ow8+ePDg2NjY2KFRANbTyZMnnxhjXHm+x20ryBsbGzlx4sTFTwWwB1XVZy/kcbYsAJoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgiW39TD0u3PHjx7O1tTX3GNt26tSpJMnhw4dnnmT32NzczNGjR+cegzUgyDtka2sr993/QJ6/7Iq5R9mWfWeeSpI8+qxT40LsO/Pk3COwRvyp20HPX3ZFnrnuh+ceY1sOPHhXkuy6uedy9v8XLIM9ZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmVhLk48eP5/jx46t4KoClWmW/9q/iSba2tlbxNABLt8p+2bIAaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaEKQAZoQZIAmBBmgCUEGaGL/Kp7k1KlTeeaZZ3Ls2LFVPF0LW1tbueRLY+4x2GGX/M/T2dr6zz11bu81W1tbOXDgwEqe67yvkKvqHVV1oqpOnD59ehUzAexJ532FPMa4I8kdSXLTTTdd1Eu+w4cPJ0luv/32i/ntu9KxY8dy8jOPzT0GO+yFl74im9cc2lPn9l6zys9+7CEDNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE3sX8WTbG5uruJpAJZulf1aSZCPHj26iqcBWLpV9suWBUATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE0IMkATggzQhCADNCHIAE3sn3uAdbbvzJM58OBdc4+xLfvO/HuS7Lq557LvzJNJDs09BmtCkHfI5ubm3CNclFOnnkuSHD4sMhfm0K79WNOPIO+Qo0ePzj0CsMvYQwZoQpABmhBkgCYEGaAJQQZoQpABmhBkgCYEGaAJQQZoQpABmhBkgCYEGaAJQQZoQpABmhBkgCYEGaAJQQZoQpABmhBkgCYEGaCJGmNc+IOrTif57M6N838cTPLEip6rg7203r201sR619mFrvXVY4wrz/egbQV5larqxBjjprnnWJW9tN69tNbEetfZstdqywKgCUEGaKJzkO+Ye4AV20vr3UtrTax3nS11rW33kAH2ms6vkAH2lNmDXFWvqqp7quqBqvp0VR2bjl9RVXdX1T9Pb79+7lmXoapeWlUfq6pPTuv91en4N1fVvdN6/6yqLp171mWpqn1V9YmqunO6vc5rfbiqPlVV91XVienYWp7LSVJVl1fVB6rqwenP8M3rut6qunb6uJ799XRVvXOZ6509yEmeS/LzY4zXJHljkp+rqm9N8ktJPjrG+JYkH51ur4Nnk9w6xnhdkuuT/FBVvTHJu5P85rTe/0jyMzPOuGzHkjxwzu11XmuSfO8Y4/pz/jnUup7LSXJ7kg+PMa5L8rosPs5rud4xxkPTx/X6JDcmOZPkQ1nmescYrX4l+YskP5DkoSRXTceuSvLQ3LPtwFovS/LxJN+ZxT8u3z8dvznJR+aeb0lrvHo6SW9NcmeSWte1Tut5OMnBrzi2ludyklck+ddMX4ta9/V+xRp/MMk/LHu9HV4hf1lVbSR5fZJ7kxwaY3whSaa33zDfZMs1fQp/X5LHk9yd5F+SfHGM8dz0kEeSHJ5rviV7T5JfTPLCdPuVWd+1JslI8ldVdbKq3jEdW9dz+Zokp5P8/rQl9d6qelnWd73neluSP5neX9p62wS5ql6e5INJ3jnGeHrueXbSGOP5sfi05+okb0jymq/1sNVOtXxV9ZYkj48xTp57+Gs8dNev9Ry3jDFuSPLmLLbfvmfugXbQ/iQ3JPntMcbrk/x31mR74v8zfc3jrUnev+z/dosgV9VLsojxH40x/nw6/FhVXTXdf1UWrybXyhjji0n+Jou988urav9019VJPj/XXEt0S5K3VtXDSf40i22L92Q915okGWN8fnr7eBb7i2/I+p7LjyR5ZIxx73T7A1kEel3Xe9abk3x8jPHYdHtp6509yFVVSX43yQNjjN84566/TPL26f23Z7G3vOtV1ZVVdfn0/oEk35/FF0LuSXLb9LC1WO8Y45fHGFePMTay+BTvr8cYP5k1XGuSVNXLqurrzr6fxT7j/VnTc3mM8WiSz1XVtdOh70vyj1nT9Z7jSF7crkiWuN7ZvzGkqr47yd8l+VRe3Gf8lSz2kd+X5JuS/FuSnxhjPDnLkEtUVd+R5A+S7MviL8T3jTF+raquyeJV5BVJPpHkp8YYz8436XJV1ZuS/MIY4y3rutZpXR+abu5P8sdjjHdV1SuzhudyklTV9Unem+TSJJ9J8tOZzuus53ovS/K5JNeMMZ6aji3t4zt7kAFYmH3LAoAFQQZoQpABmhBkgCYEGaAJQWZXqKofrapRVdfNPQvsFEFmtziS5O+z+AYTWEuCTHvTdU5uyeIynW+bjl1SVb81XVP6zqq6q6pum+67sar+drrAz0fOflsrdCfI7AY/ksU1d/8pyZNVdUOSH0uykeTbk/xsFpfxPHtdlONJbhtj3Jjk95K8a46hYbv2n/8hMLsjWVyUKFl8y/WRJC9J8v4xxgtJHq2qe6b7r03y2iR3Ly6Tkn1JvrDaceHiCDKtTdcJuDXJa6tqZBHYkRevGfFVvyXJp8cYN69oRFgaWxZ0d1uSPxxjvHqMsTHGeFUWP6XiiSQ/Pu0lH0rypunxDyW5sqq+vIVRVd82x+CwXYJMd0fy1a+GP5jkG7O4Hu/9SX4ni6sDPjXG+FIWEX93VX0yyX1Jvmt148LFc7U3dq2qevkY47+mbY2PZfHTOh6dey64WPaQ2c3unC72f2mSXxdjdjuvkAGasIcM0IQgAzQhyABNCDJAE4IM0IQgAzTxv4ACDwOeaQoFAAAAAElFTkSuQmCC\n",
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
    "data=data[data.Age<=perc99]\n",
    "sns.boxplot(data.Age)"
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
   "execution_count": 20,
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
       "      <th>CustomerID</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Annual Income (k$)</th>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>Male</td>\n",
       "      <td>19</td>\n",
       "      <td>15</td>\n",
       "      <td>39</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>Male</td>\n",
       "      <td>21</td>\n",
       "      <td>15</td>\n",
       "      <td>81</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>Female</td>\n",
       "      <td>20</td>\n",
       "      <td>16</td>\n",
       "      <td>6</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>Female</td>\n",
       "      <td>23</td>\n",
       "      <td>16</td>\n",
       "      <td>77</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>Female</td>\n",
       "      <td>31</td>\n",
       "      <td>17</td>\n",
       "      <td>40</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   CustomerID  Gender  Age  Annual Income (k$)  Spending Score (1-100)\n",
       "0           1    Male   19                  15                      39\n",
       "1           2    Male   21                  15                      81\n",
       "2           3  Female   20                  16                       6\n",
       "3           4  Female   23                  16                      77\n",
       "4           5  Female   31                  17                      40"
      ]
     },
     "execution_count": 20,
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
   "execution_count": 21,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.preprocessing import LabelEncoder\n",
    "le=LabelEncoder()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "C:\\Users\\sajus\\Anaconda3\\lib\\site-packages\\pandas\\core\\generic.py:5096: SettingWithCopyWarning: \n",
      "A value is trying to be set on a copy of a slice from a DataFrame.\n",
      "Try using .loc[row_indexer,col_indexer] = value instead\n",
      "\n",
      "See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy\n",
      "  self[name] = value\n"
     ]
    }
   ],
   "source": [
    "data.Gender=le.fit_transform(data.Gender)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
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
       "      <th>CustomerID</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Annual Income (k$)</th>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>19</td>\n",
       "      <td>15</td>\n",
       "      <td>39</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>1</td>\n",
       "      <td>21</td>\n",
       "      <td>15</td>\n",
       "      <td>81</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>0</td>\n",
       "      <td>20</td>\n",
       "      <td>16</td>\n",
       "      <td>6</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>0</td>\n",
       "      <td>23</td>\n",
       "      <td>16</td>\n",
       "      <td>77</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>0</td>\n",
       "      <td>31</td>\n",
       "      <td>17</td>\n",
       "      <td>40</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   CustomerID  Gender  Age  Annual Income (k$)  Spending Score (1-100)\n",
       "0           1       1   19                  15                      39\n",
       "1           2       1   21                  15                      81\n",
       "2           3       0   20                  16                       6\n",
       "3           4       0   23                  16                      77\n",
       "4           5       0   31                  17                      40"
      ]
     },
     "execution_count": 23,
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
    "##  8. Scaling the data "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "metadata": {},
   "outputs": [],
   "source": [
    "##Standization"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "metadata": {},
   "outputs": [],
   "source": [
    "x=data[['Annual Income (k$)','Spending Score (1-100)']]"
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
       "      <th>Annual Income (k$)</th>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>15</td>\n",
       "      <td>39</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>15</td>\n",
       "      <td>81</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>16</td>\n",
       "      <td>6</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>16</td>\n",
       "      <td>77</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>17</td>\n",
       "      <td>40</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   Annual Income (k$)  Spending Score (1-100)\n",
       "0                  15                      39\n",
       "1                  15                      81\n",
       "2                  16                       6\n",
       "3                  16                      77\n",
       "4                  17                      40"
      ]
     },
     "execution_count": 29,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "x.head()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.preprocessing import StandardScaler"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "metadata": {},
   "outputs": [],
   "source": [
    "scale=StandardScaler()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "metadata": {},
   "outputs": [],
   "source": [
    "st_scale=scale.fit_transform(x)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "array([[-1.72395579e+00,  1.14119480e+00, -1.43156122e+00,\n",
       "        -1.73750289e+00],\n",
       "       [-1.70669007e+00,  1.14119480e+00, -1.28500014e+00,\n",
       "        -1.73750289e+00],\n",
       "       [-1.68942435e+00, -8.76274582e-01, -1.35828068e+00,\n",
       "        -1.69947640e+00],\n",
       "       [-1.67215864e+00, -8.76274582e-01, -1.13843907e+00,\n",
       "        -1.69947640e+00],\n",
       "       [-1.65489292e+00, -8.76274582e-01, -5.52194762e-01,\n",
       "        -1.66144992e+00],\n",
       "       [-1.63762720e+00, -8.76274582e-01, -1.21171960e+00,\n",
       "        -1.66144992e+00],\n",
       "       [-1.62036148e+00, -8.76274582e-01, -2.59072609e-01,\n",
       "        -1.62342344e+00],\n",
       "       [-1.60309576e+00, -8.76274582e-01, -1.13843907e+00,\n",
       "        -1.62342344e+00],\n",
       "       [-1.58583005e+00,  1.14119480e+00,  1.86606300e+00,\n",
       "        -1.58539696e+00],\n",
       "       [-1.56856433e+00, -8.76274582e-01, -6.25475300e-01,\n",
       "        -1.58539696e+00],\n",
       "       [-1.55129861e+00,  1.14119480e+00,  2.08590461e+00,\n",
       "        -1.58539696e+00],\n",
       "       [-1.53403289e+00, -8.76274582e-01, -2.59072609e-01,\n",
       "        -1.58539696e+00],\n",
       "       [-1.51676717e+00, -8.76274582e-01,  1.42637977e+00,\n",
       "        -1.54737048e+00],\n",
       "       [-1.49950146e+00, -8.76274582e-01, -1.06515853e+00,\n",
       "        -1.54737048e+00],\n",
       "       [-1.48223574e+00,  1.14119480e+00, -1.12511533e-01,\n",
       "        -1.54737048e+00],\n",
       "       [-1.46497002e+00,  1.14119480e+00, -1.21171960e+00,\n",
       "        -1.54737048e+00],\n",
       "       [-1.44770430e+00, -8.76274582e-01, -2.59072609e-01,\n",
       "        -1.50934400e+00],\n",
       "       [-1.43043858e+00,  1.14119480e+00, -1.35828068e+00,\n",
       "        -1.50934400e+00],\n",
       "       [-1.41317287e+00,  1.14119480e+00,  9.86696538e-01,\n",
       "        -1.43329104e+00],\n",
       "       [-1.39590715e+00, -8.76274582e-01, -2.59072609e-01,\n",
       "        -1.43329104e+00],\n",
       "       [-1.37864143e+00,  1.14119480e+00, -2.59072609e-01,\n",
       "        -1.39526456e+00],\n",
       "       [-1.36137571e+00,  1.14119480e+00, -9.91877990e-01,\n",
       "        -1.39526456e+00],\n",
       "       [-1.34410999e+00, -8.76274582e-01,  5.47013310e-01,\n",
       "        -1.35723808e+00],\n",
       "       [-1.32684427e+00,  1.14119480e+00, -5.52194762e-01,\n",
       "        -1.35723808e+00],\n",
       "       [-1.30957856e+00, -8.76274582e-01,  1.13325761e+00,\n",
       "        -1.24315864e+00],\n",
       "       [-1.29231284e+00,  1.14119480e+00, -6.98755838e-01,\n",
       "        -1.24315864e+00],\n",
       "       [-1.27504712e+00, -8.76274582e-01,  4.73732772e-01,\n",
       "        -1.24315864e+00],\n",
       "       [-1.25778140e+00,  1.14119480e+00, -2.59072609e-01,\n",
       "        -1.24315864e+00],\n",
       "       [-1.24051568e+00, -8.76274582e-01,  1.07330081e-01,\n",
       "        -1.20513215e+00],\n",
       "       [-1.22324997e+00, -8.76274582e-01, -1.13843907e+00,\n",
       "        -1.20513215e+00],\n",
       "       [-1.20598425e+00,  1.14119480e+00,  1.57294084e+00,\n",
       "        -1.16710567e+00],\n",
       "       [-1.18871853e+00, -8.76274582e-01, -1.28500014e+00,\n",
       "        -1.16710567e+00],\n",
       "       [-1.17145281e+00,  1.14119480e+00,  1.05997708e+00,\n",
       "        -1.05302623e+00],\n",
       "       [-1.15418709e+00,  1.14119480e+00, -1.50484176e+00,\n",
       "        -1.05302623e+00],\n",
       "       [-1.13692138e+00, -8.76274582e-01,  7.66854924e-01,\n",
       "        -1.05302623e+00],\n",
       "       [-1.11965566e+00, -8.76274582e-01, -1.28500014e+00,\n",
       "        -1.05302623e+00],\n",
       "       [-1.10238994e+00, -8.76274582e-01,  2.53891157e-01,\n",
       "        -1.01499975e+00],\n",
       "       [-1.08512422e+00, -8.76274582e-01, -6.25475300e-01,\n",
       "        -1.01499975e+00],\n",
       "       [-1.06785850e+00, -8.76274582e-01, -1.85792071e-01,\n",
       "        -9.00920309e-01],\n",
       "       [-1.05059279e+00, -8.76274582e-01, -1.35828068e+00,\n",
       "        -9.00920309e-01],\n",
       "       [-1.03332707e+00, -8.76274582e-01,  1.93934353e+00,\n",
       "        -8.62893828e-01],\n",
       "       [-1.01606135e+00,  1.14119480e+00, -1.06515853e+00,\n",
       "        -8.62893828e-01],\n",
       "       [-9.98795631e-01,  1.14119480e+00,  6.93574386e-01,\n",
       "        -8.24867347e-01],\n",
       "       [-9.81529913e-01, -8.76274582e-01, -5.52194762e-01,\n",
       "        -8.24867347e-01],\n",
       "       [-9.64264195e-01, -8.76274582e-01,  7.66854924e-01,\n",
       "        -8.24867347e-01],\n",
       "       [-9.46998477e-01, -8.76274582e-01, -1.06515853e+00,\n",
       "        -8.24867347e-01],\n",
       "       [-9.29732759e-01, -8.76274582e-01,  8.40135462e-01,\n",
       "        -7.86840867e-01],\n",
       "       [-9.12467041e-01, -8.76274582e-01, -8.45316914e-01,\n",
       "        -7.86840867e-01],\n",
       "       [-8.95201323e-01, -8.76274582e-01, -6.98755838e-01,\n",
       "        -7.86840867e-01],\n",
       "       [-8.77935605e-01, -8.76274582e-01, -5.52194762e-01,\n",
       "        -7.86840867e-01],\n",
       "       [-8.60669887e-01, -8.76274582e-01,  7.66854924e-01,\n",
       "        -7.10787905e-01],\n",
       "       [-8.43404168e-01,  1.14119480e+00, -4.05633686e-01,\n",
       "        -7.10787905e-01],\n",
       "       [-8.26138450e-01, -8.76274582e-01, -5.52194762e-01,\n",
       "        -6.72761424e-01],\n",
       "       [-8.08872732e-01,  1.14119480e+00,  1.49966030e+00,\n",
       "        -6.72761424e-01],\n",
       "       [-7.91607014e-01, -8.76274582e-01,  8.40135462e-01,\n",
       "        -6.72761424e-01],\n",
       "       [-7.74341296e-01,  1.14119480e+00,  6.20293848e-01,\n",
       "        -6.72761424e-01],\n",
       "       [-7.57075578e-01, -8.76274582e-01,  9.13416000e-01,\n",
       "        -6.34734944e-01],\n",
       "       [-7.39809860e-01,  1.14119480e+00,  2.23246569e+00,\n",
       "        -6.34734944e-01],\n",
       "       [-7.22544142e-01, -8.76274582e-01, -8.45316914e-01,\n",
       "        -5.58681982e-01],\n",
       "       [-7.05278424e-01,  1.14119480e+00,  1.05997708e+00,\n",
       "        -5.58681982e-01],\n",
       "       [-6.70746988e-01,  1.14119480e+00, -1.43156122e+00,\n",
       "        -5.58681982e-01],\n",
       "       [-6.53481269e-01, -8.76274582e-01,  2.08590461e+00,\n",
       "        -5.20655501e-01],\n",
       "       [-6.36215551e-01, -8.76274582e-01,  1.13325761e+00,\n",
       "        -5.20655501e-01],\n",
       "       [-6.18949833e-01,  1.14119480e+00,  1.79278246e+00,\n",
       "        -4.82629021e-01],\n",
       "       [-6.01684115e-01,  1.14119480e+00, -1.50484176e+00,\n",
       "        -4.82629021e-01],\n",
       "       [-5.84418397e-01, -8.76274582e-01,  3.27171695e-01,\n",
       "        -4.82629021e-01],\n",
       "       [-5.67152679e-01, -8.76274582e-01,  2.15918515e+00,\n",
       "        -4.82629021e-01],\n",
       "       [-5.49886961e-01,  1.14119480e+00, -1.43156122e+00,\n",
       "        -4.82629021e-01],\n",
       "       [-5.32621243e-01, -8.76274582e-01, -4.78914224e-01,\n",
       "        -4.82629021e-01],\n",
       "       [-4.98089807e-01, -8.76274582e-01,  6.20293848e-01,\n",
       "        -4.44602540e-01],\n",
       "       [-4.80824089e-01, -8.76274582e-01,  1.57294084e+00,\n",
       "        -4.06576059e-01],\n",
       "       [-4.63558370e-01, -8.76274582e-01,  1.57294084e+00,\n",
       "        -4.06576059e-01],\n",
       "       [-4.46292652e-01,  1.14119480e+00,  1.49966030e+00,\n",
       "        -2.54470136e-01],\n",
       "       [-4.29026934e-01,  1.14119480e+00, -9.18597452e-01,\n",
       "        -2.54470136e-01],\n",
       "       [-4.11761216e-01, -8.76274582e-01,  4.73732772e-01,\n",
       "        -2.54470136e-01],\n",
       "       [-3.94495498e-01,  1.14119480e+00,  1.07330081e-01,\n",
       "        -2.54470136e-01],\n",
       "       [-3.77229780e-01, -8.76274582e-01, -1.13843907e+00,\n",
       "        -2.54470136e-01],\n",
       "       [-3.59964062e-01, -8.76274582e-01,  7.66854924e-01,\n",
       "        -2.54470136e-01],\n",
       "       [-3.42698344e-01,  1.14119480e+00,  1.35309923e+00,\n",
       "        -2.54470136e-01],\n",
       "       [-3.25432626e-01,  1.14119480e+00, -3.92309951e-02,\n",
       "        -2.54470136e-01],\n",
       "       [-3.08166908e-01,  1.14119480e+00,  2.08590461e+00,\n",
       "        -2.54470136e-01],\n",
       "       [-2.90901190e-01, -8.76274582e-01,  5.47013310e-01,\n",
       "        -2.54470136e-01],\n",
       "       [-2.73635472e-01, -8.76274582e-01, -1.28500014e+00,\n",
       "        -2.54470136e-01],\n",
       "       [-2.56369753e-01,  1.14119480e+00,  6.93574386e-01,\n",
       "        -2.54470136e-01],\n",
       "       [-2.39104035e-01, -8.76274582e-01,  1.20653815e+00,\n",
       "        -1.40390694e-01],\n",
       "       [-2.21838317e-01, -8.76274582e-01, -1.21171960e+00,\n",
       "        -1.40390694e-01],\n",
       "       [-2.04572599e-01, -8.76274582e-01, -3.32353148e-01,\n",
       "        -1.02364213e-01],\n",
       "       [-1.87306881e-01, -8.76274582e-01,  8.40135462e-01,\n",
       "        -1.02364213e-01],\n",
       "       [-1.70041163e-01, -8.76274582e-01,  2.15918515e+00,\n",
       "        -6.43377326e-02],\n",
       "       [-1.52775445e-01,  1.14119480e+00, -1.50484176e+00,\n",
       "        -6.43377326e-02],\n",
       "       [-1.35509727e-01,  1.14119480e+00,  6.93574386e-01,\n",
       "        -2.63112518e-02],\n",
       "       [-1.18244009e-01, -8.76274582e-01,  1.07330081e-01,\n",
       "        -2.63112518e-02],\n",
       "       [-1.00978291e-01, -8.76274582e-01, -4.78914224e-01,\n",
       "        -2.63112518e-02],\n",
       "       [-8.37125726e-02,  1.14119480e+00, -1.06515853e+00,\n",
       "        -2.63112518e-02],\n",
       "       [-6.64468545e-02, -8.76274582e-01,  6.20293848e-01,\n",
       "        -2.63112518e-02],\n",
       "       [-4.91811364e-02, -8.76274582e-01, -8.45316914e-01,\n",
       "        -2.63112518e-02],\n",
       "       [-3.19154183e-02,  1.14119480e+00,  6.93574386e-01,\n",
       "         1.17152289e-02],\n",
       "       [-1.46497002e-02,  1.14119480e+00, -1.35828068e+00,\n",
       "         1.17152289e-02],\n",
       "       [ 2.61601789e-03, -8.76274582e-01, -1.13843907e+00,\n",
       "         4.97417097e-02],\n",
       "       [ 1.98817360e-02, -8.76274582e-01,  7.66854924e-01,\n",
       "         4.97417097e-02],\n",
       "       [ 3.71474541e-02,  1.14119480e+00,  2.08590461e+00,\n",
       "         4.97417097e-02],\n",
       "       [ 5.44131722e-02,  1.14119480e+00, -9.18597452e-01,\n",
       "         4.97417097e-02],\n",
       "       [ 7.16788902e-02,  1.14119480e+00,  7.66854924e-01,\n",
       "         4.97417097e-02],\n",
       "       [ 8.89446083e-02, -8.76274582e-01, -1.28500014e+00,\n",
       "         4.97417097e-02],\n",
       "       [ 1.06210326e-01, -8.76274582e-01,  2.01262407e+00,\n",
       "         8.77681904e-02],\n",
       "       [ 1.23476045e-01,  1.14119480e+00,  1.13325761e+00,\n",
       "         8.77681904e-02],\n",
       "       [ 1.40741763e-01,  1.14119480e+00,  2.15918515e+00,\n",
       "         8.77681904e-02],\n",
       "       [ 1.58007481e-01,  1.14119480e+00,  2.01262407e+00,\n",
       "         8.77681904e-02],\n",
       "       [ 1.75273199e-01,  1.14119480e+00,  1.93934353e+00,\n",
       "         8.77681904e-02],\n",
       "       [ 1.92538917e-01, -8.76274582e-01, -1.43156122e+00,\n",
       "         8.77681904e-02],\n",
       "       [ 2.09804635e-01, -8.76274582e-01, -3.92309951e-02,\n",
       "         1.25794671e-01],\n",
       "       [ 2.27070353e-01,  1.14119480e+00, -1.43156122e+00,\n",
       "         1.25794671e-01],\n",
       "       [ 2.44336071e-01, -8.76274582e-01, -1.50484176e+00,\n",
       "         1.63821152e-01],\n",
       "       [ 2.61601789e-01, -8.76274582e-01, -1.43156122e+00,\n",
       "         1.63821152e-01],\n",
       "       [ 2.78867507e-01, -8.76274582e-01,  1.79278246e+00,\n",
       "         1.63821152e-01],\n",
       "       [ 2.96133225e-01, -8.76274582e-01,  7.66854924e-01,\n",
       "         1.63821152e-01],\n",
       "       [ 3.13398943e-01, -8.76274582e-01,  9.13416000e-01,\n",
       "         2.39874113e-01],\n",
       "       [ 3.30664662e-01, -8.76274582e-01,  8.40135462e-01,\n",
       "         2.39874113e-01],\n",
       "       [ 3.47930380e-01,  1.14119480e+00, -8.45316914e-01,\n",
       "         2.39874113e-01],\n",
       "       [ 3.65196098e-01, -8.76274582e-01, -3.92309951e-02,\n",
       "         2.39874113e-01],\n",
       "       [ 3.82461816e-01, -8.76274582e-01,  1.07330081e-01,\n",
       "         3.15927075e-01],\n",
       "       [ 3.99727534e-01,  1.14119480e+00,  3.40495430e-02,\n",
       "         3.15927075e-01],\n",
       "       [ 4.16993252e-01, -8.76274582e-01, -1.13843907e+00,\n",
       "         3.53953556e-01],\n",
       "       [ 4.34258970e-01, -8.76274582e-01, -5.52194762e-01,\n",
       "         3.53953556e-01],\n",
       "       [ 4.51524688e-01,  1.14119480e+00,  3.27171695e-01,\n",
       "         3.91980036e-01],\n",
       "       [ 4.68790406e-01,  1.14119480e+00,  1.07330081e-01,\n",
       "         3.91980036e-01],\n",
       "       [ 4.86056124e-01,  1.14119480e+00,  1.49966030e+00,\n",
       "         3.91980036e-01],\n",
       "       [ 5.03321842e-01,  1.14119480e+00, -3.92309951e-02,\n",
       "         3.91980036e-01],\n",
       "       [ 5.20587561e-01,  1.14119480e+00,  6.20293848e-01,\n",
       "         3.91980036e-01],\n",
       "       [ 5.37853279e-01,  1.14119480e+00,  3.40495430e-02,\n",
       "         3.91980036e-01],\n",
       "       [ 5.55118997e-01, -8.76274582e-01, -9.91877990e-01,\n",
       "         4.30006517e-01],\n",
       "       [ 5.72384715e-01, -8.76274582e-01, -5.52194762e-01,\n",
       "         4.30006517e-01],\n",
       "       [ 5.89650433e-01,  1.14119480e+00, -1.35828068e+00,\n",
       "         4.68032998e-01],\n",
       "       [ 6.06916151e-01, -8.76274582e-01, -6.98755838e-01,\n",
       "         4.68032998e-01],\n",
       "       [ 6.24181869e-01, -8.76274582e-01,  4.00452233e-01,\n",
       "         4.68032998e-01],\n",
       "       [ 6.41447587e-01,  1.14119480e+00, -4.78914224e-01,\n",
       "         4.68032998e-01],\n",
       "       [ 6.58713305e-01,  1.14119480e+00, -1.43156122e+00,\n",
       "         5.06059479e-01],\n",
       "       [ 6.75979023e-01, -8.76274582e-01, -2.59072609e-01,\n",
       "         5.06059479e-01],\n",
       "       [ 6.93244741e-01, -8.76274582e-01,  1.35309923e+00,\n",
       "         5.44085959e-01],\n",
       "       [ 7.10510460e-01,  1.14119480e+00, -4.78914224e-01,\n",
       "         5.44085959e-01],\n",
       "       [ 7.27776178e-01, -8.76274582e-01, -7.72036376e-01,\n",
       "         5.82112440e-01],\n",
       "       [ 7.45041896e-01, -8.76274582e-01, -4.78914224e-01,\n",
       "         5.82112440e-01],\n",
       "       [ 7.62307614e-01,  1.14119480e+00, -9.91877990e-01,\n",
       "         6.20138921e-01],\n",
       "       [ 7.79573332e-01,  1.14119480e+00, -7.72036376e-01,\n",
       "         6.20138921e-01],\n",
       "       [ 7.96839050e-01,  1.14119480e+00,  6.93574386e-01,\n",
       "         6.20138921e-01],\n",
       "       [ 8.14104768e-01, -8.76274582e-01, -4.78914224e-01,\n",
       "         6.20138921e-01],\n",
       "       [ 8.31370486e-01, -8.76274582e-01, -3.32353148e-01,\n",
       "         6.58165401e-01],\n",
       "       [ 8.48636204e-01,  1.14119480e+00, -3.32353148e-01,\n",
       "         6.58165401e-01],\n",
       "       [ 8.65901922e-01,  1.14119480e+00,  3.27171695e-01,\n",
       "         6.58165401e-01],\n",
       "       [ 8.83167640e-01,  1.14119480e+00,  3.40495430e-02,\n",
       "         6.58165401e-01],\n",
       "       [ 9.00433358e-01, -8.76274582e-01,  4.00452233e-01,\n",
       "         6.58165401e-01],\n",
       "       [ 9.17699077e-01, -8.76274582e-01, -3.92309951e-02,\n",
       "         6.58165401e-01],\n",
       "       [ 9.34964795e-01, -8.76274582e-01,  6.20293848e-01,\n",
       "         6.58165401e-01],\n",
       "       [ 9.52230513e-01, -8.76274582e-01, -8.45316914e-01,\n",
       "         6.58165401e-01],\n",
       "       [ 9.69496231e-01,  1.14119480e+00, -1.12511533e-01,\n",
       "         6.58165401e-01],\n",
       "       [ 9.86761949e-01, -8.76274582e-01, -6.25475300e-01,\n",
       "         6.58165401e-01],\n",
       "       [ 1.00402767e+00,  1.14119480e+00, -3.32353148e-01,\n",
       "         6.58165401e-01],\n",
       "       [ 1.02129339e+00, -8.76274582e-01, -6.25475300e-01,\n",
       "         6.58165401e-01],\n",
       "       [ 1.03855910e+00, -8.76274582e-01,  1.27981869e+00,\n",
       "         6.96191882e-01],\n",
       "       [ 1.05582482e+00, -8.76274582e-01, -6.98755838e-01,\n",
       "         6.96191882e-01],\n",
       "       [ 1.07309054e+00,  1.14119480e+00, -1.43156122e+00,\n",
       "         7.72244844e-01],\n",
       "       [ 1.09035626e+00, -8.76274582e-01, -5.52194762e-01,\n",
       "         7.72244844e-01],\n",
       "       [ 1.10762198e+00,  1.14119480e+00,  8.40135462e-01,\n",
       "         9.24350767e-01],\n",
       "       [ 1.12488769e+00, -8.76274582e-01, -1.85792071e-01,\n",
       "         9.24350767e-01],\n",
       "       [ 1.14215341e+00,  1.14119480e+00,  2.53891157e-01,\n",
       "         9.62377247e-01],\n",
       "       [ 1.15941913e+00, -8.76274582e-01, -4.05633686e-01,\n",
       "         9.62377247e-01],\n",
       "       [ 1.17668485e+00, -8.76274582e-01, -1.85792071e-01,\n",
       "         1.00040373e+00],\n",
       "       [ 1.19395057e+00,  1.14119480e+00, -4.78914224e-01,\n",
       "         1.00040373e+00],\n",
       "       [ 1.21121628e+00,  1.14119480e+00,  1.07330081e-01,\n",
       "         1.00040373e+00],\n",
       "       [ 1.22848200e+00,  1.14119480e+00, -7.72036376e-01,\n",
       "         1.00040373e+00],\n",
       "       [ 1.24574772e+00,  1.14119480e+00, -1.85792071e-01,\n",
       "         1.00040373e+00],\n",
       "       [ 1.26301344e+00,  1.14119480e+00, -1.85792071e-01,\n",
       "         1.00040373e+00],\n",
       "       [ 1.28027916e+00, -8.76274582e-01,  9.86696538e-01,\n",
       "         1.03843021e+00],\n",
       "       [ 1.29754487e+00, -8.76274582e-01, -6.25475300e-01,\n",
       "         1.03843021e+00],\n",
       "       [ 1.31481059e+00,  1.14119480e+00,  1.42637977e+00,\n",
       "         1.03843021e+00],\n",
       "       [ 1.33207631e+00,  1.14119480e+00, -8.45316914e-01,\n",
       "         1.03843021e+00],\n",
       "       [ 1.34934203e+00,  1.14119480e+00,  1.49966030e+00,\n",
       "         1.22856261e+00],\n",
       "       [ 1.36660775e+00,  1.14119480e+00, -2.59072609e-01,\n",
       "         1.22856261e+00],\n",
       "       [ 1.38387346e+00, -8.76274582e-01, -1.12511533e-01,\n",
       "         1.38066854e+00],\n",
       "       [ 1.40113918e+00, -8.76274582e-01, -4.78914224e-01,\n",
       "         1.38066854e+00],\n",
       "       [ 1.41840490e+00,  1.14119480e+00,  5.47013310e-01,\n",
       "         1.41869502e+00],\n",
       "       [ 1.43567062e+00, -8.76274582e-01, -6.98755838e-01,\n",
       "         1.41869502e+00],\n",
       "       [ 1.45293634e+00, -8.76274582e-01,  1.80610619e-01,\n",
       "         1.45672150e+00],\n",
       "       [ 1.47020206e+00,  1.14119480e+00, -6.25475300e-01,\n",
       "         1.45672150e+00],\n",
       "       [ 1.48746777e+00, -8.76274582e-01,  1.13325761e+00,\n",
       "         1.53277446e+00],\n",
       "       [ 1.50473349e+00,  1.14119480e+00, -7.72036376e-01,\n",
       "         1.53277446e+00],\n",
       "       [ 1.52199921e+00, -8.76274582e-01,  1.80610619e-01,\n",
       "         1.60882742e+00],\n",
       "       [ 1.53926493e+00, -8.76274582e-01, -1.85792071e-01,\n",
       "         1.60882742e+00],\n",
       "       [ 1.55653065e+00, -8.76274582e-01, -3.32353148e-01,\n",
       "         1.60882742e+00],\n",
       "       [ 1.57379636e+00, -8.76274582e-01, -4.78914224e-01,\n",
       "         1.60882742e+00],\n",
       "       [ 1.59106208e+00,  1.14119480e+00, -4.05633686e-01,\n",
       "         1.98909223e+00],\n",
       "       [ 1.60832780e+00, -8.76274582e-01, -3.92309951e-02,\n",
       "         1.98909223e+00],\n",
       "       [ 1.62559352e+00, -8.76274582e-01,  6.20293848e-01,\n",
       "         2.25527759e+00],\n",
       "       [ 1.64285924e+00, -8.76274582e-01, -2.59072609e-01,\n",
       "         2.25527759e+00],\n",
       "       [ 1.66012495e+00, -8.76274582e-01,  4.73732772e-01,\n",
       "         2.48343648e+00],\n",
       "       [ 1.67739067e+00,  1.14119480e+00, -4.78914224e-01,\n",
       "         2.48343648e+00],\n",
       "       [ 1.69465639e+00,  1.14119480e+00, -4.78914224e-01,\n",
       "         2.90172777e+00],\n",
       "       [ 1.71192211e+00,  1.14119480e+00, -6.25475300e-01,\n",
       "         2.90172777e+00]])"
      ]
     },
     "execution_count": 33,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "st_scale"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "metadata": {},
   "outputs": [],
   "source": [
    "##Normalization"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.preprocessing import MinMaxScaler"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "metadata": {},
   "outputs": [],
   "source": [
    "min_max=MinMaxScaler(feature_range=(0,1))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "metadata": {},
   "outputs": [],
   "source": [
    "norm_scal=min_max.fit_transform(x)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "array([[0.        , 0.3877551 ],\n",
       "       [0.        , 0.81632653],\n",
       "       [0.00819672, 0.05102041],\n",
       "       [0.00819672, 0.7755102 ],\n",
       "       [0.01639344, 0.39795918],\n",
       "       [0.01639344, 0.76530612],\n",
       "       [0.02459016, 0.05102041],\n",
       "       [0.02459016, 0.94897959],\n",
       "       [0.03278689, 0.02040816],\n",
       "       [0.03278689, 0.7244898 ],\n",
       "       [0.03278689, 0.13265306],\n",
       "       [0.03278689, 1.        ],\n",
       "       [0.04098361, 0.14285714],\n",
       "       [0.04098361, 0.7755102 ],\n",
       "       [0.04098361, 0.12244898],\n",
       "       [0.04098361, 0.79591837],\n",
       "       [0.04918033, 0.34693878],\n",
       "       [0.04918033, 0.66326531],\n",
       "       [0.06557377, 0.28571429],\n",
       "       [0.06557377, 0.98979592],\n",
       "       [0.07377049, 0.34693878],\n",
       "       [0.07377049, 0.73469388],\n",
       "       [0.08196721, 0.04081633],\n",
       "       [0.08196721, 0.73469388],\n",
       "       [0.10655738, 0.13265306],\n",
       "       [0.10655738, 0.82653061],\n",
       "       [0.10655738, 0.31632653],\n",
       "       [0.10655738, 0.6122449 ],\n",
       "       [0.1147541 , 0.30612245],\n",
       "       [0.1147541 , 0.87755102],\n",
       "       [0.12295082, 0.03061224],\n",
       "       [0.12295082, 0.73469388],\n",
       "       [0.14754098, 0.03061224],\n",
       "       [0.14754098, 0.92857143],\n",
       "       [0.14754098, 0.13265306],\n",
       "       [0.14754098, 0.81632653],\n",
       "       [0.1557377 , 0.16326531],\n",
       "       [0.1557377 , 0.73469388],\n",
       "       [0.18032787, 0.25510204],\n",
       "       [0.18032787, 0.75510204],\n",
       "       [0.18852459, 0.34693878],\n",
       "       [0.18852459, 0.92857143],\n",
       "       [0.19672131, 0.35714286],\n",
       "       [0.19672131, 0.6122449 ],\n",
       "       [0.19672131, 0.2755102 ],\n",
       "       [0.19672131, 0.65306122],\n",
       "       [0.20491803, 0.55102041],\n",
       "       [0.20491803, 0.46938776],\n",
       "       [0.20491803, 0.41836735],\n",
       "       [0.20491803, 0.41836735],\n",
       "       [0.22131148, 0.52040816],\n",
       "       [0.22131148, 0.60204082],\n",
       "       [0.2295082 , 0.54081633],\n",
       "       [0.2295082 , 0.60204082],\n",
       "       [0.2295082 , 0.44897959],\n",
       "       [0.2295082 , 0.40816327],\n",
       "       [0.23770492, 0.5       ],\n",
       "       [0.23770492, 0.45918367],\n",
       "       [0.25409836, 0.51020408],\n",
       "       [0.25409836, 0.45918367],\n",
       "       [0.25409836, 0.55102041],\n",
       "       [0.26229508, 0.52040816],\n",
       "       [0.26229508, 0.59183673],\n",
       "       [0.2704918 , 0.51020408],\n",
       "       [0.2704918 , 0.59183673],\n",
       "       [0.2704918 , 0.5       ],\n",
       "       [0.2704918 , 0.47959184],\n",
       "       [0.2704918 , 0.59183673],\n",
       "       [0.2704918 , 0.46938776],\n",
       "       [0.27868852, 0.41836735],\n",
       "       [0.28688525, 0.48979592],\n",
       "       [0.28688525, 0.56122449],\n",
       "       [0.31967213, 0.46938776],\n",
       "       [0.31967213, 0.54081633],\n",
       "       [0.31967213, 0.53061224],\n",
       "       [0.31967213, 0.47959184],\n",
       "       [0.31967213, 0.52040816],\n",
       "       [0.31967213, 0.41836735],\n",
       "       [0.31967213, 0.51020408],\n",
       "       [0.31967213, 0.55102041],\n",
       "       [0.31967213, 0.40816327],\n",
       "       [0.31967213, 0.43877551],\n",
       "       [0.31967213, 0.57142857],\n",
       "       [0.31967213, 0.45918367],\n",
       "       [0.3442623 , 0.58163265],\n",
       "       [0.3442623 , 0.55102041],\n",
       "       [0.35245902, 0.60204082],\n",
       "       [0.35245902, 0.45918367],\n",
       "       [0.36065574, 0.55102041],\n",
       "       [0.36065574, 0.40816327],\n",
       "       [0.36885246, 0.48979592],\n",
       "       [0.36885246, 0.39795918],\n",
       "       [0.36885246, 0.41836735],\n",
       "       [0.36885246, 0.52040816],\n",
       "       [0.36885246, 0.46938776],\n",
       "       [0.36885246, 0.5       ],\n",
       "       [0.37704918, 0.41836735],\n",
       "       [0.37704918, 0.48979592],\n",
       "       [0.3852459 , 0.40816327],\n",
       "       [0.3852459 , 0.47959184],\n",
       "       [0.3852459 , 0.59183673],\n",
       "       [0.3852459 , 0.55102041],\n",
       "       [0.3852459 , 0.56122449],\n",
       "       [0.3852459 , 0.41836735],\n",
       "       [0.39344262, 0.5       ],\n",
       "       [0.39344262, 0.45918367],\n",
       "       [0.39344262, 0.42857143],\n",
       "       [0.39344262, 0.47959184],\n",
       "       [0.39344262, 0.52040816],\n",
       "       [0.39344262, 0.54081633],\n",
       "       [0.40163934, 0.41836735],\n",
       "       [0.40163934, 0.45918367],\n",
       "       [0.40983607, 0.47959184],\n",
       "       [0.40983607, 0.5       ],\n",
       "       [0.40983607, 0.42857143],\n",
       "       [0.40983607, 0.59183673],\n",
       "       [0.42622951, 0.42857143],\n",
       "       [0.42622951, 0.57142857],\n",
       "       [0.42622951, 0.56122449],\n",
       "       [0.42622951, 0.39795918],\n",
       "       [0.44262295, 0.58163265],\n",
       "       [0.44262295, 0.91836735],\n",
       "       [0.45081967, 0.28571429],\n",
       "       [0.45081967, 0.7755102 ],\n",
       "       [0.45901639, 0.34693878],\n",
       "       [0.45901639, 0.95918367],\n",
       "       [0.45901639, 0.10204082],\n",
       "       [0.45901639, 0.75510204],\n",
       "       [0.45901639, 0.08163265],\n",
       "       [0.45901639, 0.75510204],\n",
       "       [0.46721311, 0.33673469],\n",
       "       [0.46721311, 0.71428571],\n",
       "       [0.47540984, 0.04081633],\n",
       "       [0.47540984, 0.8877551 ],\n",
       "       [0.47540984, 0.06122449],\n",
       "       [0.47540984, 0.73469388],\n",
       "       [0.48360656, 0.09183673],\n",
       "       [0.48360656, 0.7244898 ],\n",
       "       [0.49180328, 0.04081633],\n",
       "       [0.49180328, 0.93877551],\n",
       "       [0.5       , 0.39795918],\n",
       "       [0.5       , 0.87755102],\n",
       "       [0.50819672, 0.1122449 ],\n",
       "       [0.50819672, 0.97959184],\n",
       "       [0.50819672, 0.35714286],\n",
       "       [0.50819672, 0.74489796],\n",
       "       [0.51639344, 0.21428571],\n",
       "       [0.51639344, 0.90816327],\n",
       "       [0.51639344, 0.16326531],\n",
       "       [0.51639344, 0.8877551 ],\n",
       "       [0.51639344, 0.19387755],\n",
       "       [0.51639344, 0.76530612],\n",
       "       [0.51639344, 0.15306122],\n",
       "       [0.51639344, 0.89795918],\n",
       "       [0.51639344, 0.        ],\n",
       "       [0.51639344, 0.78571429],\n",
       "       [0.51639344, 0.        ],\n",
       "       [0.51639344, 0.73469388],\n",
       "       [0.52459016, 0.34693878],\n",
       "       [0.52459016, 0.83673469],\n",
       "       [0.54098361, 0.04081633],\n",
       "       [0.54098361, 0.93877551],\n",
       "       [0.57377049, 0.25510204],\n",
       "       [0.57377049, 0.75510204],\n",
       "       [0.58196721, 0.19387755],\n",
       "       [0.58196721, 0.95918367],\n",
       "       [0.59016393, 0.26530612],\n",
       "       [0.59016393, 0.63265306],\n",
       "       [0.59016393, 0.12244898],\n",
       "       [0.59016393, 0.75510204],\n",
       "       [0.59016393, 0.09183673],\n",
       "       [0.59016393, 0.92857143],\n",
       "       [0.59836066, 0.12244898],\n",
       "       [0.59836066, 0.86734694],\n",
       "       [0.59836066, 0.14285714],\n",
       "       [0.59836066, 0.69387755],\n",
       "       [0.63934426, 0.13265306],\n",
       "       [0.63934426, 0.90816327],\n",
       "       [0.67213115, 0.31632653],\n",
       "       [0.67213115, 0.86734694],\n",
       "       [0.68032787, 0.14285714],\n",
       "       [0.68032787, 0.8877551 ],\n",
       "       [0.68852459, 0.3877551 ],\n",
       "       [0.68852459, 0.97959184],\n",
       "       [0.70491803, 0.23469388],\n",
       "       [0.70491803, 0.68367347],\n",
       "       [0.72131148, 0.16326531],\n",
       "       [0.72131148, 0.85714286],\n",
       "       [0.72131148, 0.2244898 ],\n",
       "       [0.72131148, 0.69387755],\n",
       "       [0.80327869, 0.07142857],\n",
       "       [0.80327869, 0.91836735],\n",
       "       [0.86065574, 0.15306122],\n",
       "       [0.86065574, 0.79591837],\n",
       "       [0.90983607, 0.2755102 ],\n",
       "       [0.90983607, 0.74489796],\n",
       "       [1.        , 0.17346939],\n",
       "       [1.        , 0.83673469]])"
      ]
     },
     "execution_count": 37,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "norm_scal"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 9.Perform any of the clustering algorithms "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.cluster import KMeans"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 39,
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "C:\\Users\\sajus\\Anaconda3\\lib\\site-packages\\sklearn\\cluster\\_kmeans.py:1037: UserWarning: KMeans is known to have a memory leak on Windows with MKL, when there are less chunks than available threads. You can avoid it by setting the environment variable OMP_NUM_THREADS=1.\n",
      "  \"KMeans is known to have a memory leak on Windows \"\n"
     ]
    }
   ],
   "source": [
    "wcss=[]\n",
    "for i in range(1,11):\n",
    "    kmeans=KMeans(n_clusters=i, init='k-means++',random_state=0)   \n",
    "    kmeans.fit(data)\n",
    "    wcss.append(kmeans.inertia_)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "Text(0, 0.5, 'WCSS')"
      ]
     },
     "execution_count": 40,
     "metadata": {},
     "output_type": "execute_result"
    },
    {
     "data": {
      "image/png": "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\n",
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
    "import matplotlib.pyplot as plt\n",
    "plt.plot(range(1,11),wcss)\n",
    "plt.title(\"Elbow Method\")\n",
    "plt.xlabel('No of Clusters')\n",
    "plt.ylabel('WCSS')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 41,
   "metadata": {},
   "outputs": [],
   "source": [
    "km_model=KMeans(n_clusters=3, init='k-means++',random_state=0)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 42,
   "metadata": {},
   "outputs": [],
   "source": [
    "ykmeans=km_model.fit_predict(data)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 43,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "[2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2\n",
      " 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1 1 1 1\n",
      " 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1\n",
      " 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n",
      " 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0\n",
      " 0 0 0 0 0 0 0 0 0 0 0 0 0]\n"
     ]
    }
   ],
   "source": [
    "print(ykmeans)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 44,
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
       "      <th>CustomerID</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Annual Income (k$)</th>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>19</td>\n",
       "      <td>15</td>\n",
       "      <td>39</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>1</td>\n",
       "      <td>21</td>\n",
       "      <td>15</td>\n",
       "      <td>81</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>0</td>\n",
       "      <td>20</td>\n",
       "      <td>16</td>\n",
       "      <td>6</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>0</td>\n",
       "      <td>23</td>\n",
       "      <td>16</td>\n",
       "      <td>77</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>0</td>\n",
       "      <td>31</td>\n",
       "      <td>17</td>\n",
       "      <td>40</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   CustomerID  Gender  Age  Annual Income (k$)  Spending Score (1-100)\n",
       "0           1       1   19                  15                      39\n",
       "1           2       1   21                  15                      81\n",
       "2           3       0   20                  16                       6\n",
       "3           4       0   23                  16                      77\n",
       "4           5       0   31                  17                      40"
      ]
     },
     "execution_count": 44,
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
    "## 10. ADD CLUSTER DATA WITH MAIN DATASET "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 45,
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "C:\\Users\\sajus\\Anaconda3\\lib\\site-packages\\ipykernel_launcher.py:1: SettingWithCopyWarning: \n",
      "A value is trying to be set on a copy of a slice from a DataFrame.\n",
      "Try using .loc[row_indexer,col_indexer] = value instead\n",
      "\n",
      "See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy\n",
      "  \"\"\"Entry point for launching an IPython kernel.\n"
     ]
    }
   ],
   "source": [
    "data['Kclus']=pd.Series(ykmeans)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 46,
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
       "      <th>CustomerID</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Annual Income (k$)</th>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "      <th>Kclus</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>19</td>\n",
       "      <td>15</td>\n",
       "      <td>39</td>\n",
       "      <td>2.0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>1</td>\n",
       "      <td>21</td>\n",
       "      <td>15</td>\n",
       "      <td>81</td>\n",
       "      <td>2.0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>0</td>\n",
       "      <td>20</td>\n",
       "      <td>16</td>\n",
       "      <td>6</td>\n",
       "      <td>2.0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>0</td>\n",
       "      <td>23</td>\n",
       "      <td>16</td>\n",
       "      <td>77</td>\n",
       "      <td>2.0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>0</td>\n",
       "      <td>31</td>\n",
       "      <td>17</td>\n",
       "      <td>40</td>\n",
       "      <td>2.0</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   CustomerID  Gender  Age  Annual Income (k$)  Spending Score (1-100)  Kclus\n",
       "0           1       1   19                  15                      39    2.0\n",
       "1           2       1   21                  15                      81    2.0\n",
       "2           3       0   20                  16                       6    2.0\n",
       "3           4       0   23                  16                      77    2.0\n",
       "4           5       0   31                  17                      40    2.0"
      ]
     },
     "execution_count": 46,
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
   "execution_count": 47,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "array([ 2.,  1.,  0., nan])"
      ]
     },
     "execution_count": 47,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data['Kclus'].unique()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 48,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "0    0.0\n",
       "1    1.0\n",
       "dtype: float64"
      ]
     },
     "execution_count": 48,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data['Kclus'].mode()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 49,
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "C:\\Users\\sajus\\Anaconda3\\lib\\site-packages\\pandas\\core\\generic.py:6130: SettingWithCopyWarning: \n",
      "A value is trying to be set on a copy of a slice from a DataFrame\n",
      "\n",
      "See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy\n",
      "  self._update_inplace(new_data)\n"
     ]
    }
   ],
   "source": [
    "data['Kclus'].fillna(data['Kclus'].mode()[0],inplace=True)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 50,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "CustomerID                0\n",
       "Gender                    0\n",
       "Age                       0\n",
       "Annual Income (k$)        0\n",
       "Spending Score (1-100)    0\n",
       "Kclus                     0\n",
       "dtype: int64"
      ]
     },
     "execution_count": 50,
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
   "execution_count": 51,
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
       "      <th>CustomerID</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Annual Income (k$)</th>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "      <th>Kclus</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>19</td>\n",
       "      <td>15</td>\n",
       "      <td>39</td>\n",
       "      <td>2.0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>1</td>\n",
       "      <td>21</td>\n",
       "      <td>15</td>\n",
       "      <td>81</td>\n",
       "      <td>2.0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>0</td>\n",
       "      <td>20</td>\n",
       "      <td>16</td>\n",
       "      <td>6</td>\n",
       "      <td>2.0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>0</td>\n",
       "      <td>23</td>\n",
       "      <td>16</td>\n",
       "      <td>77</td>\n",
       "      <td>2.0</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>0</td>\n",
       "      <td>31</td>\n",
       "      <td>17</td>\n",
       "      <td>40</td>\n",
       "      <td>2.0</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   CustomerID  Gender  Age  Annual Income (k$)  Spending Score (1-100)  Kclus\n",
       "0           1       1   19                  15                      39    2.0\n",
       "1           2       1   21                  15                      81    2.0\n",
       "2           3       0   20                  16                       6    2.0\n",
       "3           4       0   23                  16                      77    2.0\n",
       "4           5       0   31                  17                      40    2.0"
      ]
     },
     "execution_count": 51,
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
   "execution_count": 52,
   "metadata": {},
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "C:\\Users\\sajus\\Anaconda3\\lib\\site-packages\\ipykernel_launcher.py:1: SettingWithCopyWarning: \n",
      "A value is trying to be set on a copy of a slice from a DataFrame.\n",
      "Try using .loc[row_indexer,col_indexer] = value instead\n",
      "\n",
      "See the caveats in the documentation: http://pandas.pydata.org/pandas-docs/stable/indexing.html#indexing-view-versus-copy\n",
      "  \"\"\"Entry point for launching an IPython kernel.\n"
     ]
    }
   ],
   "source": [
    "data['Kclus']=data['Kclus'].astype('int32')"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 53,
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
       "      <th>CustomerID</th>\n",
       "      <th>Gender</th>\n",
       "      <th>Age</th>\n",
       "      <th>Annual Income (k$)</th>\n",
       "      <th>Spending Score (1-100)</th>\n",
       "      <th>Kclus</th>\n",
       "    </tr>\n",
       "  </thead>\n",
       "  <tbody>\n",
       "    <tr>\n",
       "      <th>0</th>\n",
       "      <td>1</td>\n",
       "      <td>1</td>\n",
       "      <td>19</td>\n",
       "      <td>15</td>\n",
       "      <td>39</td>\n",
       "      <td>2</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>1</th>\n",
       "      <td>2</td>\n",
       "      <td>1</td>\n",
       "      <td>21</td>\n",
       "      <td>15</td>\n",
       "      <td>81</td>\n",
       "      <td>2</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>2</th>\n",
       "      <td>3</td>\n",
       "      <td>0</td>\n",
       "      <td>20</td>\n",
       "      <td>16</td>\n",
       "      <td>6</td>\n",
       "      <td>2</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>3</th>\n",
       "      <td>4</td>\n",
       "      <td>0</td>\n",
       "      <td>23</td>\n",
       "      <td>16</td>\n",
       "      <td>77</td>\n",
       "      <td>2</td>\n",
       "    </tr>\n",
       "    <tr>\n",
       "      <th>4</th>\n",
       "      <td>5</td>\n",
       "      <td>0</td>\n",
       "      <td>31</td>\n",
       "      <td>17</td>\n",
       "      <td>40</td>\n",
       "      <td>2</td>\n",
       "    </tr>\n",
       "  </tbody>\n",
       "</table>\n",
       "</div>"
      ],
      "text/plain": [
       "   CustomerID  Gender  Age  Annual Income (k$)  Spending Score (1-100)  Kclus\n",
       "0           1       1   19                  15                      39      2\n",
       "1           2       1   21                  15                      81      2\n",
       "2           3       0   20                  16                       6      2\n",
       "3           4       0   23                  16                      77      2\n",
       "4           5       0   31                  17                      40      2"
      ]
     },
     "execution_count": 53,
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
   "execution_count": 54,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "0    70\n",
       "1    68\n",
       "2    60\n",
       "Name: Kclus, dtype: int64"
      ]
     },
     "execution_count": 54,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "data.Kclus.value_counts()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 11.Split the Data into Dependent and Independent variables"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 55,
   "metadata": {},
   "outputs": [],
   "source": [
    "y=data['Spending Score (1-100)']"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 56,
   "metadata": {},
   "outputs": [],
   "source": [
    "x=data.drop('Spending Score (1-100)',axis=1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 57,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "     CustomerID  Gender  Age  Annual Income (k$)  Kclus\n",
      "0             1       1   19                  15      2\n",
      "1             2       1   21                  15      2\n",
      "2             3       0   20                  16      2\n",
      "3             4       0   23                  16      2\n",
      "4             5       0   31                  17      2\n",
      "5             6       0   22                  17      2\n",
      "6             7       0   35                  18      2\n",
      "7             8       0   23                  18      2\n",
      "8             9       1   64                  19      2\n",
      "9            10       0   30                  19      2\n",
      "10           11       1   67                  19      2\n",
      "11           12       0   35                  19      2\n",
      "12           13       0   58                  20      2\n",
      "13           14       0   24                  20      2\n",
      "14           15       1   37                  20      2\n",
      "15           16       1   22                  20      2\n",
      "16           17       0   35                  21      2\n",
      "17           18       1   20                  21      2\n",
      "18           19       1   52                  23      2\n",
      "19           20       0   35                  23      2\n",
      "20           21       1   35                  24      2\n",
      "21           22       1   25                  24      2\n",
      "22           23       0   46                  25      2\n",
      "23           24       1   31                  25      2\n",
      "24           25       0   54                  28      2\n",
      "25           26       1   29                  28      2\n",
      "26           27       0   45                  28      2\n",
      "27           28       1   35                  28      2\n",
      "28           29       0   40                  29      2\n",
      "29           30       0   23                  29      2\n",
      "..          ...     ...  ...                 ...    ...\n",
      "170         171       1   40                  87      0\n",
      "171         172       1   28                  87      0\n",
      "172         173       1   36                  87      0\n",
      "173         174       1   36                  87      0\n",
      "174         175       0   52                  88      0\n",
      "175         176       0   30                  88      0\n",
      "176         177       1   58                  88      0\n",
      "177         178       1   27                  88      0\n",
      "178         179       1   59                  93      0\n",
      "179         180       1   35                  93      0\n",
      "180         181       0   37                  97      0\n",
      "181         182       0   32                  97      0\n",
      "182         183       1   46                  98      0\n",
      "183         184       0   29                  98      0\n",
      "184         185       0   41                  99      0\n",
      "185         186       1   30                  99      0\n",
      "186         187       0   54                 101      0\n",
      "187         188       1   28                 101      0\n",
      "188         189       0   41                 103      0\n",
      "189         190       0   36                 103      0\n",
      "190         191       0   34                 103      0\n",
      "191         192       0   32                 103      0\n",
      "192         193       1   33                 113      0\n",
      "193         194       0   38                 113      0\n",
      "194         195       0   47                 120      0\n",
      "195         196       0   35                 120      0\n",
      "196         197       0   45                 126      0\n",
      "197         198       1   32                 126      0\n",
      "198         199       1   32                 137      0\n",
      "199         200       1   30                 137      0\n",
      "\n",
      "[198 rows x 5 columns]\n"
     ]
    }
   ],
   "source": [
    "print(x)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 58,
   "metadata": {},
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "0      39\n",
      "1      81\n",
      "2       6\n",
      "3      77\n",
      "4      40\n",
      "5      76\n",
      "6       6\n",
      "7      94\n",
      "8       3\n",
      "9      72\n",
      "10     14\n",
      "11     99\n",
      "12     15\n",
      "13     77\n",
      "14     13\n",
      "15     79\n",
      "16     35\n",
      "17     66\n",
      "18     29\n",
      "19     98\n",
      "20     35\n",
      "21     73\n",
      "22      5\n",
      "23     73\n",
      "24     14\n",
      "25     82\n",
      "26     32\n",
      "27     61\n",
      "28     31\n",
      "29     87\n",
      "       ..\n",
      "170    13\n",
      "171    75\n",
      "172    10\n",
      "173    92\n",
      "174    13\n",
      "175    86\n",
      "176    15\n",
      "177    69\n",
      "178    14\n",
      "179    90\n",
      "180    32\n",
      "181    86\n",
      "182    15\n",
      "183    88\n",
      "184    39\n",
      "185    97\n",
      "186    24\n",
      "187    68\n",
      "188    17\n",
      "189    85\n",
      "190    23\n",
      "191    69\n",
      "192     8\n",
      "193    91\n",
      "194    16\n",
      "195    79\n",
      "196    28\n",
      "197    74\n",
      "198    18\n",
      "199    83\n",
      "Name: Spending Score (1-100), Length: 198, dtype: int64\n"
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
    "## 12.SPLIT THE DATA INTO TRAINING AND TESTING "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 59,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.model_selection import train_test_split"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 63,
   "metadata": {},
   "outputs": [],
   "source": [
    "x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.2,random_state=10)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 64,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(158, 5)"
      ]
     },
     "execution_count": 64,
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
   "execution_count": 65,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(158,)"
      ]
     },
     "execution_count": 65,
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
   "execution_count": 66,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(40, 5)"
      ]
     },
     "execution_count": 66,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "x_test.shape"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 67,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "(40,)"
      ]
     },
     "execution_count": 67,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "y_test.shape"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 13. Build the Model "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 68,
   "metadata": {},
   "outputs": [],
   "source": [
    "from sklearn.linear_model import MultipleRegression\n",
    "lr=MultipleRegression()"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 14.Train the Model "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 69,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "MultipleRegression()"
      ]
     },
     "execution_count": 69,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "lr.fit(x_train,y_train)"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 15. Test the Model"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 70,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "array([43.25047645, 57.02908429, 50.20251649, 55.70711785, 57.0140705 ,\n",
       "       49.60489193, 64.61219681, 46.53528748, 43.26507074, 58.17515061,\n",
       "       41.82613422, 27.61825956, 49.55074478, 56.19413575, 40.74487627,\n",
       "       32.8060876 , 56.80631332, 38.06013082, 52.93130222, 59.03428492,\n",
       "       48.02728525, 43.94998595, 29.55712152, 56.16529581, 50.91462054,\n",
       "       60.97813037, 46.01006058, 57.58967359, 58.98854957, 54.6286957 ,\n",
       "       63.4880341 , 63.06657573, 60.57732223, 45.44839871, 61.37087733,\n",
       "       35.74811876, 70.86189719, 57.40274757, 43.5976173 , 43.78491393])"
      ]
     },
     "execution_count": 70,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "y_pred=lr.predict(x_test)\n",
    "y_pred"
   ]
  },
  {
   "cell_type": "markdown",
   "metadata": {},
   "source": [
    "## 16.Measure the performance using Evaluation Metrics"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 79,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "-6.961535567263691"
      ]
     },
     "execution_count": 79,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "from sklearn.metrics import mean_squared_error, r2_score, mean_absolute_error\n",
    "acc=r2_score(y_pred,y_test)\n",
    "acc"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 84,
   "metadata": {},
   "outputs": [],
   "source": [
    "mae = mean_absolute_error(y_test,y_pred)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 85,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "22.32801080580144"
      ]
     },
     "execution_count": 85,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "mae"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 86,
   "metadata": {},
   "outputs": [],
   "source": [
    "mse = mean_squared_error(y_test,y_pred)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 87,
   "metadata": {},
   "outputs": [
    {
     "data": {
      "text/plain": [
       "783.1652052891498"
      ]
     },
     "execution_count": 87,
     "metadata": {},
     "output_type": "execute_result"
    }
   ],
   "source": [
    "mse"
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
