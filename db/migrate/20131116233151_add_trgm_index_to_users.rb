class AddTrgmIndexToUsers < ActiveRecord::Migration
  def change
    execute <<-SQL
      create extension pg_trgm;
      create index on users using gin(first_name gin_trgm_ops);
      create index on users using gin(last_name gin_trgm_ops);
      create index on users using gin(email gin_trgm_ops);
    SQL
  end
end
