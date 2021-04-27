module Grape
  class Apidoc
    autoload :RakeTask, 'grape/apidoc/rake_task'
    autoload :TableFormat, 'grape/apidoc/table_format'

    ENTITY_TABLE = TableFormat.new([20, 10, 40]).freeze

    def initialize(root_api_class = nil, output: $stdout)
      @api = root_api_class || detect_root_api_class
      @out = output
    end

    def write!
      write_entities! if defined?(Grape::Entity)
      write_routes!
    end

    private

    def detect_root_api_class
      # performance shortcut for https://github.com/bsm/grape-app/
      return Grape::App if defined?(Grape::App)

      # droot api is the one with largest route count:
      Grape::API.descendants.max do |a, b|
        a.try(:routes)&.count <=> b.try(:routes)&.count
      end
    end

    def write_entities!
      @out.puts '# Entities'
      @out.puts

      @api.routes.map(&:entity).sort_by(&:name).each do |entity|
        write_entity_header!(entity)
        write_entity_fields!(entity)
      end
    end

    def write_entity_header!(entity)
      @out.puts "## #{entity.name}"
      @out.puts
    end

    def write_entity_fields!(entity)
      unless entity.documentation.present?
        @out.puts 'No fields exposed.'
        @out.puts
        return
      end

      @out.puts ENTITY_TABLE.format('Field', 'Type', 'Description')
      @out.puts ENTITY_TABLE.separator

      entity.documentation.each do |name, details|
        # TODO: for `type` need to dig into "using" if it's a sub-entity exposure
        # TODO: ideally, if defined?(ActiveRecord) we could try digging into entity columns/relations to detect tupe
        type, desc, = details.values_at(:type, :desc)
        @out.puts ENTITY_TABLE.format(name.to_s, type.to_s, desc.to_s)
      end

      @out.puts
    end

    def write_routes!
      @out.puts '# Routes'
      @out.puts

      @api.routes.sort_by(&:path).each do |route|
        write_route_header!(route)
        write_route_perms!(route)
        write_route_retval!(route)
        write_route_params!(route)
      end
    end

    def write_route_header!(route)
      method = route.request_method
      path = route.path
                  .sub(':version', route.version.to_s)
                  .sub('(.:format)', '')
      @out.puts "## #{method} #{path}"
      @out.puts

      desc = route.settings.dig(:description, :description)
      return unless desc.present?

      @out.puts desc
      @out.puts
    end

    def write_route_perms!(route)
      # TODO: dig into route into perms config
    end

    def write_route_retval!(route)
      entity = route.try(&:entity)
      return unless entity

      array_prefix = 'List of ' if route.settings.dig(:description, :is_array)

      @out.puts "Returns: #{array_prefix}[#{entity.name}](##{identifier(entity.name)})"
      @out.puts
    end

    def write_route_params!(route)
      # TODO: accepted route params (dig into entity for types/descriptions etc)
    end

    def identifier(str)
      str.downcase.gsub(/[^0-9a-z-]/, '-')
    end
  end
end
