def sort(list)
  less_than = []
  gt_than = []
  return list if list.empty?
  pivot = list.shift

  list.each do |num|
    if num <= pivot
      less_than.push(num)
    else
      gt_than.push(num)
    end
  end

  sort(less_than) + [pivot] + sort(gt_than)
end

input = [1,2,6,4,7,9,3,5,7,2,6,234,6,234,6,78,5,3,7,1,4,5,7889,90,4,5,3,226,4,3,8,76,65,4,265]

puts sort(input)