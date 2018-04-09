class FreightProductJob < ApplicationJob
  queue_as :freight

  def perform(product)
    # puts Benchmark.measure {
      @freight = Correios::Frete::Calculador.new :cep_origem => "71916-500",
                                                 :cep_destino => "01225-001",
                                                 :peso => product.weight,
                                                 :comprimento => product.length,
                                                 :largura => product.width,
                                                 :altura => product.height
      # }
    FreightCalculation.new(product, @freight).call
  end
end
