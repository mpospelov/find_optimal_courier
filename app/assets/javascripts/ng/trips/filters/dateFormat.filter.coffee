@trips.filter 'dateFormat', [
  'dateFilter', (dateFilter) ->
    (date) ->
      dateFilter(date, 'd-MM-yyyy')
]
