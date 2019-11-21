class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  # もしimageが空じゃなければ、contentは空にできない(もしimageがあれば、contentは空でもいい)
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
