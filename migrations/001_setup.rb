Sequel.migration do
  change do
    create_table(:twitterusers) do
      primary_key :id
      String :userid
      Date :sent_date
    end
  end
end

