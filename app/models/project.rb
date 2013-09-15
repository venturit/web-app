class Project < ActiveRecord::Base
  max_paginates_per 100
  belongs_to :lead, :class_name => :user
  has_many :project_collaborators
  has_many :collaborators, through: :project_collaborators, :source => :user
  has_many :data
   
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/placeholder.png"
  validates :name, :description, :location,:start_date,:end_date,:disclaimer, presence: true
  geocoded_by :full_street_address  
  after_validation :geocode          
  attr_accessible :description, :disclaimer, :downloads, :name, :views, :lead_id, :location,:latitude,:longitude,:start_date,:end_date,:image,:start_time,:end_time,:is_open
  
  def full_street_address 
    if location.blank?
      ""
    else
      location
    end
  end
  
  def chart_data(datum=nil)
      datum ||= data
      datum.map do |data|
      { 
        id: data.id,
        phi2: data.photosynthetic_efficiency,
        temperature: data.temperature
        }
    end
  end
  
end
