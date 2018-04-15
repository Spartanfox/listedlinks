class Page < ApplicationRecord

  has_many :links, dependent: :destroy

  belongs_to :user

  validates_length_of :banner_url, minimum: 11, maximum: 12, :allow_blank => true

  validates_format_of :banner_url,
   :with    => %r{\.(jpe?g|png)\z}i,
    :message => "Invalid image", :allow_blank => true

  validates_format_of :button_background_url,
   :with    => %r{\.(jpe?g|png)\z}i,
    :message => "Invalid image", :allow_blank => true
    
  validates_format_of :background_url,
   :with    => %r{\.(jpe?g|png)\z}i,
    :message => "Invalid image", :allow_blank => true

end
