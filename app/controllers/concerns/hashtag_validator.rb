class HashtagValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        unless value.start_with?("#")
            record.errors.add(attribute, "Must start with a #")
        end
    end
end