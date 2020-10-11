# frozen_string_literal: true

class Attachment < ApplicationRecord
  mount_uploader :file, FileUploader

  belongs_to :debt

  validates :name, :presence => true
  validates :file, :presence => true
end
