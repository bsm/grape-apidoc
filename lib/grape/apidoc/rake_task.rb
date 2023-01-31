class Grape::Apidoc::RakeTask < Rake::TaskLib
  def initialize(name = :apidoc, root_api_class: nil, output: $stdout)
    super()

    desc 'Generate markdown documentation for API'
    task(name => :environment) do
      doc = Grape::Apidoc.new(root_api_class, output: output)
      doc.write!
    end
  end
end
