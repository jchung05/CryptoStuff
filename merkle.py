import hashlib

def merkle(txns:list)->str:
  if not txns:
    return hashlib.sha256(0).hexdigest()

  if len(txns) == 1:
    return hashlib.sha256(txns[0]).hexdigest()

  if len(txns) % 2 == 1:
    txns.append(txns[-1])

  nextList = []

  for x,y in zip(txns, txns[1:]):
    nextList.append(hashlib.sha256(x.encode('utf-8') + y.encode('utf-8')).hexdigest())
    #nextList.append(hashlib.sha256(x).hexdigest() + hashlib.sha256(y).hexdigest())
  
  return merkle(nextList)
  

a = ['a', 'b', 'c', 'd']

print(merkle(a))
