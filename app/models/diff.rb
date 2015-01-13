class Diff
  include ActiveModel::Model

  attr_accessor :before, :after

  def diff_content
    Diffy::Diff.new(self.before, self.after, include_plus_and_minus_in_html: true)
               .to_s(:html_simple)
  end
end
