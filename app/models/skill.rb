class Skill < ApplicationRecord
	validate_presence_of :title, :skill_value
end
