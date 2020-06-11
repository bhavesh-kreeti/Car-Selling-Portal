module SellersHelper
	def search(q)
		q=q.upcase
    Seller.includes(:city,:model,:registration_state,:registration_year,:brand,:kilometer_driven,:variant).each do |p|
      if p.city.name == q
        s = Seller.all.where(city_id: p.city.id)
        return s
        break
    elsif p.model.name == q
    	s = Seller.all.where(model_id: p.model.id)
        	return s
        	break
    elsif p.registration_state.name == q
    	s = Seller.all.where(registration_state_id: p.registration_state.id)
        	return s
        	break
    elsif p.registration_year.name == q
    	s = Seller.all.where(registration_year_id: p.registration_year.id)
        	return s
        	break
    elsif p.kilometer_driven.name == q
    	s = Seller.all.where(kilometer_driven_id: p.kilometer_driven.id)
        	return s
        	break
    elsif p.variant.name == q
    	s = Seller.all.where(variant_id: p.variant.id)
        	return s
        	break
    elsif p.brand.name == q
    	s = Seller.all.where(brand_id: p.brand.id)
        	return s
        	break
      end
    end
  end
end