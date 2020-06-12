require 'pry'

def merge(arr, left, mid, right) 
  l = arr.slice(left, mid)
  r = arr.slice(mid, right)

  k = left
  i = 0
  j = 0

  while i < l.length && j < r.length do
    if l[i] <= r[j]
      arr[k] = l[i]
      i += 1
    else
      arr[k] = r[j]
      j += 1
    end
    k += 1
  end
  
  while i < l.length do
    arr[k] = l[i]
    i += 1
    k += 1
  end
  
  while j < r.length do
    arr[k] = r[j]
    j += 1
    k += 1
  end

end

def mergesort(arr, left, right)
  if left < right
    mid = (left + right) / 2
    mergesort(arr, left, mid)
    mergesort(arr, mid + 1, right)
    merge(arr, left, mid, right)
  end
end

arr = [5, 0, 1, 0, 4, 12]
p arr
mergesort(arr, 0, arr.length - 1)
p arr