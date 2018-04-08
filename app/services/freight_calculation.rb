require 'correios-frete'

class FreightCalculation
  include ActionView::Helpers::NumberHelper

  def initialize(product, freight)
    @product = product
    @freight = freight
  end

  def call
    value_freight
  end

  private

  def value_freight
    return error_calculating_freight unless calculating.success?
    {
      cost_of_freight: message_from_calculate,
      zipcode: zipcode_message,
      product: @product
    }
  end

  def message_from_calculate
    number_to_currency(calculating.valor, unit: 'R$ ', separator: ',')
  end

  def calculating
    @freight.calculate_sedex
  end

  def error_calculating_freight
    calculating.msg_erro
  end

  def zipcode_message
    "Origem #{@freight.cep_origem}, Destino #{@freight.cep_destino}"
  end
end
