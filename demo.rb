require 'text_table.rb'

# setup our table data
test1 =   %w[name   gender], # first argument is an array representing the header
            #-------------
          %w[billy  male  ], # the rest are arrays representing rows 
          %w[johnny male  ],
          %w[mom    female]

# create the table
t = Table.new(*test1)

# print the table
t.print

# rebuild the table and print it
t.make(%w[shoe       size color],
         #---------------------
       %w[nike       11   black],
       %w[vans       7    tan  ],
       %w[adidas     9    white],
       %w[timberland 12   brown],
       %w[sketchers  6    green]).print
