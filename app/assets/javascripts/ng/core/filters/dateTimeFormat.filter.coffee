@core.filter 'dateTimeFormat', [
  'dateFilter', (dateFilter) ->
    (date) ->
      dateFilter(date, 'd-MM-yyyy HH:mm')
]
