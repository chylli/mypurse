module TypesHelper
  def prepare_types_select(options)
    options.map {|option| [option,option]}
  end
end

