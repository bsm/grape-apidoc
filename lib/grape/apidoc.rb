module Grape
  class Apidoc
    autoload :RakeTask, './rake_task'

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
      # droot api is the one with largest route count:
      Grape::API.descendants.max do |a, b|
        a.try(:routes)&.count <=> b.try(:routes)&.count
      end
    end

    def write_entities!
      @out.puts '# Entities'
      @out.puts

      Grape::Entity.descendants.sort_by(&:name).each do |entity|
        write_entity_header!(entity)
        write_entity_fields!(entity)
      end
    end

    def write_entity_header!(entity)
      @out.puts "## #{entity.name}"
      @out.puts
    end

    def write_entity_fields!(entity)
      # TODO: dig into and write entity fields, maybe as table
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
      path   = route.path.sub(':version', route.version.to_s)
      @out.puts "## #{method} #{path}"
      @out.puts
      # TODO: dig into settings and write route description
    end

    def write_route_perms!(route)
      # TODO: dig into route into perms config
    end

    def write_route_retval!(route)
      # TODO: route retval type, if specified (link to entity header, but only if defined?(Grape::Entity))
    end

    def write_route_params!(route)
      # TODO: accepted route params (dig into entity for types/descriptions etc)
    end

    def identifier(str)
      str.underscore.dasherize.gsub(/[^0-9a-z-]/, '-')
    end
  end
end
