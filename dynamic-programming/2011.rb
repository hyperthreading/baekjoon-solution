def possible_combination_from(ns, offset_start = 0, cache = {})
  cache[ns.length] = cache[ns.length - 1] = 1
  (offset_start..ns.length - 1).reverse_each { |offset|
    cache[offset] = 0 and next if ns[offset] == '0'
    next if cache[offset]
    cache[offset] = cache[offset + 1]
    cache[offset] += cache[offset + 2] unless ns.slice(offset, 2).to_i > 26
  }
  cache[offset_start]
end
puts possible_combination_from(gets.chomp) % 1000000
