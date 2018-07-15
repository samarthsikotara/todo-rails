class ProjectSerializer < ActiveModel::Serializer
	attributes :id, :uuid, :name, :description, :completed, :completed_on, :created_at, :tasks

	def tasks
		object.tasks
	end
end