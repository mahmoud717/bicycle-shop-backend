class MasterOption < ApplicationRecord
    belongs_to :bicycle
    has_many :options
end