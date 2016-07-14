class Product < ActiveRecord::Base
  def sale_message
    if price.to_f < 100.0
      message = "Discount Item!"
    else
      message = "On Sale!"
    end
    message
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end

  def price_class_name
    if sale_message == "Discount Item!"
      class_name = "discount"
    else
      class_name = ""
    end
  end
end
