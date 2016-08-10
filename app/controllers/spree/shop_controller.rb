module Spree
  class ShopController < Spree::StoreController
    helper 'spree/products'
    respond_to :html

    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products.includes(:possible_promotions)
      @products = @products.includes(:taxons).order("spree_taxons.name desc").order("spree_products.name asc")
      @taxonomies = Spree::Taxonomy.includes(root: :children)
    end
  end
end
