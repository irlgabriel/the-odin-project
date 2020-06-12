
def merge(arr, left, mid, right) 
  L = (left..mid).to_a
  R = (mid + 1..right).to_a
  i = 0
  j = 0
  k = left
  
end

def mergesort(arr, left, right)
  if left < right
    mid = (left + right) / 2
    mergesort(arr, left, mid)
    mergesort(arr, mid + 1, right)
    merge(arr, left, mid, right)
  end
end