class Diff
  include ActiveModel::Model

  attr_accessor :before, :after

  def diff_content
    Diffy::Diff.new(self.before, self.after).to_s(:html_simple)
  end
end
