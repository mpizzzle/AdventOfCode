#!/usr/bin/env python

import hashlib

count = 0
secret = b'iwrupvqb'
result = hashlib.md5(secret + bytes(str(count), 'utf-8'))

while result.hexdigest()[:5] != '00000':
  count += 1
  result = hashlib.md5(secret + bytes(str(count), 'utf-8'))

print(result.hexdigest())
print(count)

while result.hexdigest()[:6] != '000000':
  count += 1
  result = hashlib.md5(secret + bytes(str(count), 'utf-8'))

print(result.hexdigest())
print(count)
