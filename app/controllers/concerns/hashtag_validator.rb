class HashtagValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        if value.start_with?
            record.errors.add(attribute, "Must start with a #")
        end
    end
end