require 'digest/murmurhash'
require 'pry'

class HashTable
  attr_accessor :arr, :size

  def initialize(size=1000)
    @arr = Array.new(size)
    @size = size
  end

  def get(k)
    k = k.to_s
    idx = idx(k)
    arr[idx].first{|e| e[0] == k}[1]
  end

  def insert(k, v)
    k = k.to_s
    idx = idx(k)
    current = arr[idx]

    (arr[idx] = [[k,v]]) && return if current == nil

    arr[idx] = append_or_replace(arr[idx], [k,v])
  end

  def append_or_replace(arr, k_v)
    replaced = false
    arr.each_with_index do |e, i|
      if e[0] = k_v[0]
        arr[i][1] = k_v[1]
        replaced = true
        break
      end
    end

    unless replaced
      arr.add(k_v)
    end
  end

  def idx(k)
    Digest::MurmurHash1.rawdigest(k) % size
  end
end

ht = HashTable.new

10.times do
  rand1 = rand
  rand2 = rand
  ht.insert(rand1, rand2)
  puts ht.get(rand1) == rand2
end
