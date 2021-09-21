class ArtsyFacade
  def self.find_art_by_id(id)
    response = ArtsyService.find_art_by_id(id)
  end
end
