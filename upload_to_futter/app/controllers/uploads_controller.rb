require 'shellwords'

class UploadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def form
  end

  def submit
    file_name = params["csv-file"].original_filename rescue nil
    file_path = params["csv-file"].tempfile.path rescue nil
    table_name = file_name.gsub(/[^0-9A-Za-z]/, '_').gsub(/_csv/, '').downcase

    if file_name && file_path
      # Drop the existing table if it exists.
      `PGPASSWORD=#{ENV['PGFUTTER_PASSWORD']} psql \
        --host #{ENV['PGFUTTER_HOST']} \
        --port #{ENV['PGFUTTER_PORT']} \
        --username #{ENV['PGFUTTER_USERNAME']} \
        --dbname #{ENV['PGFUTTER_DATABASE']} \
        -c 'DROP TABLE IF EXISTS import."#{table_name}";'`

      # Create and import into a new table.
      `./pgfutter \
        --host #{ENV['PGFUTTER_HOST']} \
        --port #{ENV['PGFUTTER_PORT']} \
        --username #{ENV['PGFUTTER_USERNAME']} \
        --pass #{ENV['PGFUTTER_PASSWORD']} \
        --dbname #{ENV['PGFUTTER_DATABASE']} \
        --table #{Shellwords.escape(table_name)} \
        csv #{file_path}`
    end
  end
end
