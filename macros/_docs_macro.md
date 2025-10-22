macros: 
    - name: cent2dollar
      description: A macro that convert cents to dollars, and round them based on second decimal places
      arguments: 
        - name: column_name
          type: string
          description: the name of column that you want to convert 
        - name: decimal
          type: integer
          description: number of decimal places, default to 2
