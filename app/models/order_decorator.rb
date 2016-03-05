Spree::Order.class_eval do
  include CheckoutDecorator
  checkout_flow do
      go_to_state :address
      go_to_state :complete
      # remove_transition from: :delivery, to: :confirm
    end
end
