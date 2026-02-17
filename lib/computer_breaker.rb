class ComputerBreaker
  OPTIONS = %w[A B C D E F].freeze
  def get_guess
    Array.new(4) {OPTIONS.sample}
  end
end