class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes  :name,
              :email
              #:token
end
