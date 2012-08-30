class Book < ActiveRecord::Base
  belongs_to :user
  attr_accessible :desc, :state, :title , :photo , :user
  has_attached_file :photo, :styles => { :small => "300x300>" },
                  :url  => "/assets/books/:id/:style/:basename.:extension",
                  :path => ":rails_root/public/assets/books/:id/:style/:basename.:extension"
validates :desc,  :length => { :in => 1..1000 , :too_short => "must have at least %{count} characters" , :too_long  => "must have at most %{count} characters"}
validates :title,  :length => { :in => 0..300 , :too_short => "must have at least %{count} characters" , :too_long  => "must have at most %{count} characters"}

validates_attachment_presence :photo
validates_attachment_size :photo, :less_than => 5.megabytes
validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']
end


