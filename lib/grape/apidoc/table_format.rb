# column cell widths
class Grape::Apidoc::TableFormat < Array
  def format(*values)
    str = '|'

    each_with_index do |width, index|
      str << ' '
      str << (values[index] || '').ljust(width)
      str << ' |'
    end

    str
  end

  def separator
    str = '|'

    each_with_index do |width, _index|
      str << ' '
      str << ('-' * width)
      str << ' |'
    end

    str
  end
end
