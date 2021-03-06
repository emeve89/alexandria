class Book < ApplicationRecord
  belongs_to :publisher, required: false
  belongs_to :author

  validates :title, :released_on, :author, presence: true
  validates :isbn_10, presence: true, length: { is: 10 }, uniqueness: true
  validates :isbn_13, presence: true, length: { is: 13 }, uniqueness: true

  mount_base64_uploader :cover, CoverUploader
end
