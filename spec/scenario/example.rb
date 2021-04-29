module Example
  Role = Struct.new(:name)
  User = Struct.new(:email, :roles)

  class Role::Entity < Grape::Entity
    expose :name, documentation: { type: 'String', desc: 'Role Name' }
  end

  class User::Entity < Grape::Entity
    expose :email, documentation: { type: 'String', desc: 'User Email' }
  end

  class User::FullEntity < User::Entity
    expose :roles,
           using: Role::Entity,
           documentation: { is_array: true, desc: 'User Roles' } # if `type:...` omited it'll be inferred from `using:...`
  end

  class API < Grape::API
    prefix 'api'
    version 'v1'

    desc 'List Users' do
      success User::Entity
      is_array true
      security required: %w[admin/users.read]
    end
    params do
      optional :filter, type: Hash do
        optional :email, type: [String]
      end
    end
    get '/users' do
      [User.new(email: 'test@test.com')]
    end

    desc 'Update User' do
      success User::FullEntity
    end
    params do
      optional :roles, type: Array[JSON] do
        requires :name, type: String
      end
    end
    put '/users/:email', requirements: { email: %r{\A[^/]+\Z} } do
      User.new(
        email: 'test@test.com',
        roles: [Role.new(name: 'admin')],
      )
    end
  end
end
