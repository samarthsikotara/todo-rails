class TaskSerializer < ActiveModel::Serializer
	attributes :id, :uuid, :project_id, :name, :description, :completed, :completed_on, :created_at
end