module SalesHelper
  def active_sale?
    # Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current).any?
    #  too much logic here, above.
    # 'active' method in sale.rb
    Sale.active.any?
  end 
end
