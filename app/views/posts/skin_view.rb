module Posts # "posts/skin_view" assumes that Posts::SkinView class
  class SkinView < Poirot::View 
    #  @post instance variable is available as "post" method
    delegate :title, :body, :published, :to => :post
  end
end
