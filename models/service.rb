# Copyright © Mapotempo, 2016
#
# This file is part of Mapotempo.
#
# Mapotempo is free software. You can redistribute it and/or
# modify since you respect the terms of the GNU Affero General
# Public License as published by the Free Software Foundation,
# either version 3 of the License, or (at your option) any later version.
#
# Mapotempo is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the Licenses for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Mapotempo. If not, see:
# <http://www.gnu.org/licenses/agpl.html>
#
require './models/base'


module Models
  class Service < Base
    field :late_multiplier, default: nil
    field :exclusion_cost, default: nil
    validates_numericality_of :late_multiplier, allow_nil: true
    validates_numericality_of :exclusion_cost, allow_nil: true
    field :type, default: :service
    validates_inclusion_of :type, :in => %i(service pickup delivery)

    field :skills, default: []

    belongs_to :activity, class_name: 'Models::Activity'
    has_many :sticky_vehicles, class_name: 'Models::Vehicle'
    has_many :quantities, class_name: 'Models::Quantity'
  end
end
