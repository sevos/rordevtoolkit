

class APIRDT
  include Shell
  include DistributionHelper

  def unit_list
    # @@INSTALLATION_UNITS.map do |type, units| 
    #   units.map do |name, unit|
    #       {
    #         :name => unit.name,
    #         :type => type,
    #         :plan => unit.plan,
    #         :install_cmd => "#{type}:#{unit.name}:install"
    #       }
    #     end
    # end
  end

end
