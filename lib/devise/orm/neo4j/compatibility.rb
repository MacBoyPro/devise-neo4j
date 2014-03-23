module Devise
  module Orm
    module Neo4j
      
      # This module is to add AR specific methods that devise is looking for
      
      module Compatibility
        extend ActiveSupport::Concern
        included do
                    
         # def assign_attributes(new_attributes)
         #   attributes = sanitize_for_mass_assignment(new_attributes)
         # end

          def self.serialize_from_session(key, salt)
            record = self.find(key.first)
            record if record && record.authenticatable_salt == salt
          end     

          def self.find_first_by_auth_conditions(tainted_conditions, opts={})
            self.find(devise_parameter_filter.filter(tainted_conditions).merge(opts))
          end
        end
      end
    end
  end
end
