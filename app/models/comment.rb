class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  default_scope { where(deleted_at: nil).order(id: :desc) }

  validates :content, presence: true


  def destroy
    update(deleted_at: Time.now)
  end
end
