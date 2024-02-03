class ImportDataJob < ApplicationJob
  queue_as :default

  def perform(file_path, model, *attributes)
    CsvImportService.new(file_path, model, attributes).call #should be read from S3 or any cloud file storage service
  end

end
