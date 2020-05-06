class UploadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def form
  end

  def submit
    file_name = params["csv-file"].original_filename rescue nil
    file_path = params["csv-file"].tempfile.path rescue nil

    if file_name && file_path
      `./pgfutter --dbname #{ENV['PGFUTTER_DATABASE']} --host #{ENV['PGFUTTER_HOST']} --port #{ENV['PGFUTTER_PORT']} --username #{ENV['PGFUTTER_USERNAME']} --pass #{ENV['PGFUTTER_PASSWORD']} --table #{file_name} csv #{file_path}`
    end
  end
end
