class UploadsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def form
  end

  def submit
    file_name = params["csv-file"].original_filename rescue nil
    file_path = params["csv-file"].tempfile.path rescue nil

    if file_name && file_path
      `./pgfutter --dbname upload_to_futter --host postgis --port 5432 --username docker --pass docker --table #{file_name} csv #{file_path}`
    end
  end
end
