class ComputeExponent < Foobara::Command
  inputs base: :integer, exponent: :integer
  result :integer

  def execute
    compute_exponent

    computed_exponent
  end

  attr_accessor :computed_exponent

  def compute_exponent
    self.computed_exponent = base**exponent
  end
end
