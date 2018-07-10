function quicksort(arr) {
  if (arr.length === 0) {
    return []
  } else if (arr.length === 1) {
    return arr
  }

  const pivot = arr[0]

  const leftArr = []
  const rightArr = []

  arr.splice(1).forEach(item => {
    if (item < pivot) {
      leftArr.push(item)
    } else {
      rightArr.push(item)
    }
  })

  const result = [...quicksort(leftArr), pivot, ...quicksort(rightArr)]

  return result
}

const arr = [3, 7, 5, 2, 1]
console.log(quicksort(arr));