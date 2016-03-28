Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id
      Bignum :userid, :null=>false, :unique=>true
      TrueClass :sent_message
    end
  end
end

