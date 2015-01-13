class Diff
  include ActiveModel::Model

  attr_accessor :before, :after

  def diff_content
    diff_info = Diffy::Diff.new(self.before, self.after, diff: "-U 3", include_plus_and_minus_in_html: true,
                               include_diff_info: true)
    diff_info.to_s(:html)
  end
end
