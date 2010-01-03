require 'text_table.rb'

# data for our table, each row is an array
test1 =   %w[name   gender],
             #-------------
          %w[billy  male  ],
          %w[johnny male  ],
          %w[mom    female]

# create a table
t = Table.new(*test1)

# print it!
t.print

# rebuild the table and print it
t.make(%w[shoe       size color],
         #---------------------
       %w[nike       11   black],
       %w[vans       7    tan  ],
       %w[adidas     9    white],
       %w[timberland 12   brown],
       %w[sketchers  6    green]).print
