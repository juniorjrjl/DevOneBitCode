class FileValidator < ActiveModel::EachValidator

	def validate_each(record, attribute, value)
		@record = record
		@value = value
		@attribute = attribute
		perform_validations
	end

	private

	def perform_validations
		if @value.attached?
			validate_mime_type
			validate_size
		end
	end

	def validate_mime_type
		unless permitted_mime_type?
			@record.errors.add(@attribute, "doesn't have a permitted mime type")
		end
	end

	def validate_size
		unless permitted_size?        
			@record.errors.add(@attribute, "is too big")
		end
	end 

	def permitted_mime_type?
		return true unless options[:mime_type].present?
		mime = Mime::Type.lookup @value.attachement.blob.content_type
		permitted_extensions = options[:mime_type]
		mime.symbol.present? && permitted_extensions.include?(mime.symbol)
	end

	def permitted_size?
		return true unless options[:max_size_in_bytes].present?
		@value.attachement.blob.byte_size <= options[:max_size_in_bytes]
	end

end