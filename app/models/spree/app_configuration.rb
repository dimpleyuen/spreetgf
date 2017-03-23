# This is the primary location for defining spree preferences
#
# The expectation is that this is created once and stored in
# the spree environment
#
# setters:
# a.color = :blue
# a[:color] = :blue
# a.set :color = :blue
# a.preferred_color = :blue
#
# getters:
# a.color
# a[:color]
# a.get :color
# a.preferred_color
#
require "spree/core/search/base"

module Spree
  class AppConfiguration < Preferences::Configuration
    # Alphabetized to more easily lookup particular preferences
    preference :address_requires_state, :boolean, default: true # should state/state_name be required
    preference :admin_interface_logo, :string, default: 'logo/The_Glass_Formula_Logo.png'
    preference :email_banner, :string, default: 'logo/TGF_logo_big_inverted.png'
    preference :customize_package_image, :string, default: 'customize.jpg'

    # catalogs
    preference :cuhk_catalog, :string, default: 'CUHK_Catalog.pdf'
    preference :brand_profile, :string, default: 'brandprofile.pdf'
    # social media
    preference :footer_logo, :string, default: 'logo/The_Glass_Formula_Logo_Round.png'
    preference :facebook_icon, :string, default: 'Facebook_Icon.png'
    preference :instagram_icon, :string, default: 'Instagram_Icon.png'
    preference :linkedin_icon, :string, default: 'LinkedIn_Icon.png'

    # main photos
    preference :drink_1, :string, default: 'gingerfizz.png'
    preference :drink_2, :string, default: 'oldfashioned.png'
    preference :drink_3, :string, default: 'vodkalavenade.png'
    preference :drink_4, :string, default: 'giftset01.png'
    preference :drink_5, :string, default: 'giftset02.png'
    preference :drink_6, :string, default: 'hibiscusroyale.jpg'
    preference :drink_7, :string, default: 'bpnotic.jpg'
    preference :drink_8, :string, default: 'flowerhamper.jpg'

    #partners
    preference :partner_1, :string, default: 'baker.png'
    preference :partner_2, :string, default: 'blueprint.png'
    preference :partner_3, :string, default: 'theworkproject.png'
    preference :partner_4, :string, default: 'weuse.png'
    preference :partner_5, :string, default: 'chalk.png'


    preference :admin_path, :string, default: '/admin'
    preference :admin_products_per_page, :integer, default: 30
    preference :allow_checkout_on_gateway_error, :boolean, default: false
    preference :allow_guest_checkout, :boolean, default: true
    preference :alternative_shipping_phone, :boolean, default: false # Request extra phone for ship addr
    preference :always_include_confirm_step, :boolean, default: false # Ensures confirmation step is always in checkout_progress bar, but does not force a confirm step if your payment methods do not support it.
    preference :always_put_site_name_in_title, :boolean, default: true
    preference :auto_capture, :boolean, default: false # automatically capture the credit card (as opposed to just authorize and capture later)
    preference :auto_capture_on_dispatch, :boolean, default: false # Captures payment for each shipment in Shipment#after_ship callback, and makes Shipment.ready when payment authorized.
    preference :binary_inventory_cache, :boolean, default: false # only invalidate product cache when a stock item changes whether it is in_stock
    preference :checkout_zone, :string, default: 'Hong Kong' # replace with the name of a zone if you would like to limit the countries
    preference :company, :boolean, default: false # Request company field for billing and shipping addr
    preference :currency, :string, default: "HKD"
    preference :default_country_id, :integer
    preference :expedited_exchanges, :boolean, default: false # NOTE this requires payment profiles to be supported on your gateway of choice as well as a delayed job handler to be configured with activejob. kicks off an exchange shipment upon return authorization save. charge customer if they do not return items within timely manner.
    preference :expedited_exchanges_days_window, :integer, default: 14 # the amount of days the customer has to return their item after the expedited exchange is shipped in order to avoid being charged
    preference :layout, :string, default: 'spree/layouts/spree_application'
    preference :logo, :string, default: 'logo/The_Glass_Formula_Logo.png'
    preference :max_level_in_taxons_menu, :integer, default: 1 # maximum nesting level in taxons menu
    preference :orders_per_page, :integer, default: 15
    preference :properties_per_page, :integer, default: 15
    preference :products_per_page, :integer, default: 12
    preference :promotions_per_page, :integer, default: 15
    preference :customer_returns_per_page, :integer, default: 15
    preference :require_master_price, :boolean, default: true
    preference :restock_inventory, :boolean, default: true # Determines if a return item is restocked automatically once it has been received
    preference :return_eligibility_number_of_days, :integer, default: 365
    preference :send_core_emails, :boolean, default: true # Default mail headers settings
    preference :shipping_instructions, :boolean, default: true # Request instructions/info for shipping
    preference :show_only_complete_orders_by_default, :boolean, default: true
    preference :show_variant_full_price, :boolean, default: false #Displays variant full price or difference with product price. Default false to be compatible with older behavior
    preference :show_products_without_price, :boolean, default: false
    preference :show_raw_product_description, :boolean, default: false
    preference :tax_using_ship_address, :boolean, default: true
    preference :track_inventory_levels, :boolean, default: true # Determines whether to track on_hand values for variants / products.

    # Store credits configurations
    preference :non_expiring_credit_types, :array, default: []
    preference :credit_to_new_allocation, :boolean, default: false

    # searcher_class allows spree extension writers to provide their own Search class
    def searcher_class
      @searcher_class ||= Spree::Core::Search::Base
    end

    def searcher_class=(sclass)
      @searcher_class = sclass
    end
  end
end
