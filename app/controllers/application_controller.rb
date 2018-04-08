class ApplicationController < ActionController::API
  include Response

  rescue_from Mongoid::Errors::DocumentNotFound, with: :document_not_found
  
  def document_not_found
    json_response({ message: 'Não há resultados para esse id, tente outro!' }, :not_found)
  end
end
