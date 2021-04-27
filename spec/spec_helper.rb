# TODO: this looks weird, how to NOT mess with LOAD_PATH?
$LOAD_PATH << './lib'
require 'grape-apidoc'

require 'grape'
require 'grape-entity'
require 'stringio'

module Mock
  Foo = Struct.new(:foo_id)

  class Foo::Entity < Grape::Entity
    expose :foo_id, documentation: { type: 'Integer', desc: 'Foo ID' }
  end

  Bar = Struct.new(:bar_id)

  class Bar::Entity < Grape::Entity
    expose :bar_id, documentation: { type: 'Integer', desc: 'Bar ID' }
  end
end
