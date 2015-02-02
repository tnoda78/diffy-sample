class Diff
  include ActiveModel::Model

  attr_accessor :before, :after

  def diff_content
    diff_before = add_newline(self.before)
    diff_after = add_newline(self.after)
    diff_info = Diffy::Diff.new(diff_before, diff_after, diff: "-U 3", include_plus_and_minus_in_html: true,
                               include_diff_info: true)
    diff_info.to_s(:html)
  end

  private

  def add_newline(str)
    return "" unless str.present?
    "#{str.chomp}#{str.scan(/\r\n|\n|\n/)[0] || "\r\n"}"
  end
end
