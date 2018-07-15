class UserSerializer < ActiveModel::Serializer
	attributes :uuid, :name, :email
end