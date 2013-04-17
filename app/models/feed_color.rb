class FeedColor
  attr_accessor :bg, :heading, :shadow, :text

  def initialize(color="#00B2F0")
    # @bg, @heading, @shadow, @text = args[:bg],  args[:heading],args[:shadow], args[:text]
    @color = color
    if block_given?
      yield self
    end
    set_colors
  end

  private

  def set_colors
    @bg ||= @color
    @heading ||= darken_color(0.5)
    @text ||= lighten_color( 0.6)
    @shadow ||= darken_color(0.8)
  end

  def lighten_color(amount=0.6)
    hex_color = @color.gsub('#','')
    rgb = hex_color.scan(/../).map {|color| color.hex}
    rgb[0] = [(rgb[0].to_i + 255 * amount).round, 255].min
    rgb[1] = [(rgb[1].to_i + 255 * amount).round, 255].min
    rgb[2] = [(rgb[2].to_i + 255 * amount).round, 255].min
    "#%02x%02x%02x" % rgb
  end

  def darken_color(amount=0.4)
    hex_color = @color.gsub('#','')
    rgb = hex_color.scan(/../).map {|color| color.hex}
    rgb[0] = (rgb[0].to_i * amount).round
    rgb[1] = (rgb[1].to_i * amount).round
    rgb[2] = (rgb[2].to_i * amount).round
    "#%02x%02x%02x" % rgb
  end
end