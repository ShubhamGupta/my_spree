Spree::CheckoutController.class_eval do
  private

    def before_address
      @order.bill_address ||= Spree::Address.build_default
      @order.ship_address ||= Spree::Address.build_default
      before_delivery
    end

    def before_delivery
      packages = @order.shipments.map(&:to_package)
      @differentiator = Spree::Stock::Differentiator.new(@order, packages)
    end
end
