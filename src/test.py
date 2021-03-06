import pandas as pd
import numpy as np
import rpy2.robjects as ro
from rpy2.robjects import r, conversion
from rpy2.robjects import pandas2ri
from rpy2.robjects.conversion import localconverter


from rpy2.robjects.packages import importr

mirt = importr('mirt')
stats = importr('stats')

exam_responses = pd.read_csv('responses.csv')
with localconverter(ro.default_converter + pandas2ri.converter):
    r_exam_responses = conversion.py2rpy(exam_responses)

threePL = mirt.mirt(r_exam_responses, 1, itemtype = '3PL', guess = 0.20)

#Item Parameters 
#a,b,c,whatever u is
itemArray = np.asarray(r.coef(threePL, IRTpars=True, simplify=True).rx2('items'))
np.savetxt("itemData.csv", itemArray, delimiter=",")
print("Wrote out itemData.csv")
# print(itemArray)


#Person Parameters
#Theta , Standard Error
params = {'full.scores.SE': True}
personArray = np.asarray(mirt.fscores(threePL, **params))
np.savetxt("personData.csv", personArray, delimiter=",")
print("Wrote out personData.csv")
#print(personArray)

