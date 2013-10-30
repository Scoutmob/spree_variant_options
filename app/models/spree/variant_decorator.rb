Spree::Variant.class_eval do
  
  include ActionView::Helpers::NumberHelper
  
  attr_accessible :option_values
  
  def to_hash
    #actual_price += Calculator::Vat.calculate_tax_on(self) if Spree::Config[:show_price_inc_vat]
    found_retail_price = !retail_price.nil? ? retail_price : product.retail_price
    { 
      :id    => self.id, 
      :count => self.count_on_hand, 
      :on_demand => self.on_demand?,
      :price => display_price.to_html({html: true}.merge({no_cents: true})), 
      :retail_price => !found_retail_price.nil? && found_retail_price.is_a?(Numeric) ? Money.new(found_retail_price * 100, "USD").format(no_cents: true) : ''
    }
  end
    
end
