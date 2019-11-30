class Admin::VendorsController < Admin::BaseController
  def show
    @vendor = Vendor.find(params[:id])
    @products = @vendor.products
    @vendors = Vendor.all
  end

  def update_state
    @vendor = Vendor.find(params[:id])
    VendorService.perform(@vendor)
    redirect_back(fallback_location: admin_products_path, notice: "All #{@vendor.name} Vandor roducts state is change to ---> VendorP!")
  end
end