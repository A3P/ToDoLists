class Profile < ActiveRecord::Base
  belongs_to :user
  validate :sue_is_female
  validates :gender, inclusion: {in: %w(male female), message: "%{value} is not a gender"}
  validate :full_name_is_not_null

  def sue_is_female
  	if first_name == "Sue" && gender == "male"
  		errors.add(:first_name, "cannot be male.")
  	end
  end

  def full_name_is_not_null
  	if first_name.nil? && last_name.nil?
  		errors.add(%{attribute}, "can't be null")
  	end
  end

  def self.get_all_profiles min, max
    Profile.where(birth_year: min..max).order(birth_year: :asc)
  end

end
