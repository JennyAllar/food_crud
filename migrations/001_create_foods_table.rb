Sequel.migration do
  change do
    create_table(:foods) do
      primary_key :id
      String :name, :null => false
      String :ethnicity
      Integer :year_eaten, defaul: 1999
    end
  end

end
