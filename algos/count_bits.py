def count_bits(x: int) -> int:
  num_bits = 0
  while x:
    rint(x & 1)
    num_bits += x & 1
    x >>= 1
  return num_bits

count_bits(-6)
