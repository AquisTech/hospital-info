class String

  def upcase_first
    self.split(/[\W_]/).map{|l| l.gsub(/^[a-z]/) {$&.to_s.upcase}}.join(' ')
  end

end