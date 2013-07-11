Spree::Product.class_eval do

  def option_values
    @_option_values ||= Spree::OptionValue.find_by_sql(["SELECT ov.* FROM spree_option_values ov INNER JOIN spree_option_values_variants ovv ON ovv.option_value_id = ov.id INNER JOIN spree_variants v on ovv.variant_id = v.id WHERE v.product_id = ? ORDER BY v.position", self.id])
  end

  def grouped_option_values
    @_grouped_option_values ||= option_values.group_by(&:option_type)
  end

  def variants_for_option_value(value)
    @_variant_option_values ||= variants.includes(:option_values).all
    @_variant_option_values.select { |i| i.option_value_ids.include?(value.id) }
  end

  def variant_options_hash
    return @_variant_options_hash if @_variant_options_hash
    hash = {}
    variants.includes(:option_values).each do |variant|
      variant.option_values.each do |ov|
        otid = ov.option_type_id.to_s
        ovid = ov.id.to_s
        hash[otid] ||= {}
        hash[otid][ovid] ||= {}
        hash[otid][ovid][variant.id.to_s] = variant.to_hash
      end
    end
    @_variant_options_hash = hash
  end

end
