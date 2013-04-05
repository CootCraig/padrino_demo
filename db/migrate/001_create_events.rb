Sequel.migration do
  up do
    create_table :events do
      primary_key :id
      String :event_type
      String :event_text
      DateTime :event_time
    end
  end

  down do
    drop_table :events
  end
end
