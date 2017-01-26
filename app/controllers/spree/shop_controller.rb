module Spree
  class ShopController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      redirect_to '/'
      # @searcher = build_searcher(params.merge(include_images: true))
      # @products = @searcher.retrieve_products.includes(:possible_promotions)
      # @products = @products.includes(:taxons).order("spree_taxons.name asc").order("spree_products.slug asc")
      # @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
