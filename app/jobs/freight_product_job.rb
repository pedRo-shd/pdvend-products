class FreightProductJob < ApplicationJob
  queue_as :freight

  def perform(product)
    puts Benchmark.measure {
      @freight = Correios::Frete::Calculador.new :cep_origem => "04094-050",
                                                 :cep_destino => "90619-900",
                                                 :peso => product.weight,
                                                 :comprimento => product.length,
                                                 :largura => product.width,
                                                 :altura => product.height
      }
    FreightCalculation.new(product, @freight).call
  end
end
