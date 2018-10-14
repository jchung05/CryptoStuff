import hashlib

def proof_of_work(data:str, difficulty:int)->int:
  mask = 0
  flag = 1

  for i in range(256):
    mask |= flag << i

  mask = mask >> difficulty
  nonce = 0
  h = None

  while True:
    h = hashlib.sha256(data.encode('utf-8') + str(nonce).encode('utf-8')).hexdigest()
    print(h)

    if h[:difficulty].isdigit() and int(h[:difficulty]) == 0:
      return nonce

    nonce += 1
