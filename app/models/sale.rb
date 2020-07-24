class Sale < ActiveRecord::Base

  # scope :active, => { where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current) }
  #  class method (AR SCOPE)
  def self.active
    # self.where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
    # same as below without self
    where("sales.starts_on <= ? AND sales.ends_on >= ?", Date.current, Date.current)
  end
  
  def finished?
    ends_on < Date.current
    #  is like the below
    # self.ends_on < Date.current 
  end
  def upcoming?
    starts_on > Date.current
  end
  def active?
    ends_on > Date.current
  end


end
