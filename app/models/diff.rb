class Diff
  include ActiveModel::Model

  attr_writer :before, :after

  def diff_content
    diff_info = Diffy::Diff.new(diff_before, diff_after, diff: "-U 3", include_plus_and_minus_in_html: true,
                               include_diff_info: true)
    diff_info.to_s(:html)
  end

  def before
    @before || ""
  end

  def after
    @after || ""
  end

  private

  def diff_before
    "#{before.chomp}#{new_line}"
  end

  def diff_after
    "#{after.chomp}#{new_line}"
  end

  def new_line
    self.before.scan(/\r\n|\n|\n/)[0] || self.after.scan(/\r\n|\n|\n/)[0] || ""
  end
end
