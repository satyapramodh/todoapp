class Company < ActiveRecord::Base

has_many :users, dependent: :destroy
has_many :categories, dependent: :destroy
has_many :tasks, through: :categories

validates :name, presence: { message: 'Please provide a Company name' }


def get_company(name)
	name = name.downcase
	Company.find_by(:name=>name).nil? ? Company.create(:name=>name) : Company.find_by(:name=>name)
end

end
