class Like < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :post
  belongs_to :comment
  has_many :feeds, as: :item

  private

  after_save do
    Feed.create(item_type: self.class.name, item_id: self.id)
  end
end
