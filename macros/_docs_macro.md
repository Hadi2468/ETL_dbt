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
    - name: grant_select
      description: A macro that we want grant to privs to target.schema and target.role
      arguments:
        - name: schema
           type: string
          description: The schema that we want grant to privs to, by default is our target schema
        - name: role
          type: string
          description: The role that we want grant to privs to, by default is our target role