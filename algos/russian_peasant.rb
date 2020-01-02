def russian_peasant(a, b)
  res = 0

  while b > 0
    if b & 1 == 1
      res = res + a
    end

    a = a << 1
    b = b >> 1
  end

  res
end

puts russian_peasant(654, 999) == 653346
